# Design: Real-World Readiness — NP Ops Kit

**Date:** 2026-04-27  
**Repo:** kroeungcyber/nonprofit-security-toolkit  
**Approach:** Outside-In (CI first, then fill gaps)

---

## Problem Statement

The toolkit has solid documentation foundations but is missing:
- Production-ready scripts (only 1 Windows script exists; Mac, backup, and health-check scripts promised in README are absent)
- CI/CD validation (no quality gate, no link checking, no completeness enforcement)
- Content gaps (no Mac guide, no mobile guide, stub backup module, no ransomware recovery runbook)
- Interactive assessment (static markdown only — too much friction for non-technical nonprofit staff)
- Thin case study coverage (1 fictional case study; no template for real submissions)

---

## Approach: Outside-In (CI First)

Stand up GitHub Actions as the quality net before adding any new content. Every subsequent addition is validated immediately. Completeness report gives a live checklist of remaining gaps.

---

## Section 1: CI/CD Pipeline

Three workflow files under `.github/workflows/`:

### `validate.yml` — runs on push + PR
- **Markdown lint** via `markdownlint-cli` — enforces consistent heading levels, list formatting, line length
- **Broken link check** via `lychee` — catches dead external URLs and internal cross-references
- **PowerShell syntax** via `PSScriptAnalyzer` (using `pwsh` on `ubuntu-latest`) — catches errors and best practice violations in `setup-new-laptop.ps1`
- **Shell script lint** via `shellcheck` — validates all `.sh` scripts for quoting, error handling, portability

### `security-scan.yml` — runs on push + PR
- **Secret scanning** via `gitleaks` — prevents accidental credential commits
- **Dangerous pattern check** — custom grep for patterns inappropriate in beginner-facing scripts: `rm -rf`, unquoted `$variables` in dangerous contexts, `curl | bash`, `sudo` without explanation

### `completeness.yml` — runs on push to main
- Scans each of the 8 module folders for: presence of `README.md`, at least one non-README guide file
- Flags placeholder text: `TBD`, `TODO`, `FIXME`, `coming soon`, `placeholder`
- Generates a job summary table: module name, status (complete/incomplete), missing items
- Posts a completeness badge score (e.g. `7/8 modules complete`) readable by shields.io

### README badge row additions
- CI status badge (validate workflow)
- Link check badge (lychee)
- Completeness score badge
- GitHub Pages / Assessment Tool badge

---

## Section 2: Scripts

### `scripts/setup-new-laptop.ps1` — hardened (existing)

Changes:
- Add `Set-StrictMode -Version Latest` and `$ErrorActionPreference = 'Stop'` at top
- Wrap each of the 5 configuration sections in `try/catch` with per-section rollback logging
- Add idempotency checks before each change (read current state, skip if already correct)
- Add `-WhatIf` / `-DryRun` switch: prints what would change without applying anything
- Structured exit codes: `0` = all success, `1` = partial (some sections failed), `2` = fatal failure
- Log format: timestamped, machine-readable (pipe-friendly)

### `scripts/setup-mac.sh` — new

Core hardening (zero dependencies, runs on macOS 12+):
- Enable FileVault full-disk encryption (prompts if not already active)
- Enable application firewall (`socketfilterfw`)
- Set screen lock timeout to 5 minutes
- Disable remote login (SSH off by default)
- Disable remote sharing services (file sharing, screen sharing, remote management)
- Enable automatic OS and app updates
- Check SIP (System Integrity Protection) status — warn if disabled
- Log to `~/Library/Logs/NPSetup.log`

Optional Homebrew tier (detected via `command -v brew`):
- Installs `lynis` — runs a quick audit and appends score to log
- Installs `blockblock` (if user confirms) — monitors for persistence mechanism additions

Flags:
- `--dry-run`: prints actions without executing
- `--skip-homebrew`: skips optional tier even if Homebrew is present
- `--verbose`: detailed output per step

### `scripts/backup-verify.sh` — new

- Reads configured rclone remotes from `rclone listremotes`
- For each remote: checks connectivity, reads last-modified timestamp of backup folder
- Compares timestamp against configurable threshold (default 25 hours — catches missed daily backups)
- Restores a small sentinel file (`backup-canary.txt`) to a temp location to verify restore integrity
- Output: per-remote pass/warn/fail table
- Exit codes: `0` = all pass, `1` = warnings, `2` = failures — cron-friendly
- Designed to run as a weekly cron job with output piped to email

### `scripts/security-health-check.sh` — new

Checks (all passive reads, no changes made):
- DMARC DNS record present for org's domain (prompts for domain on first run, saves to config)
- rclone backup freshness (delegates to `backup-verify.sh`)
- OS update status (macOS: `softwareupdate -l`; Windows: not in scope for shell script)
- Google Workspace 2FA enforcement (optional — requires service account JSON; skipped if not configured)

Outputs:
- Human-readable terminal report with pass/warn/fail per check
- Machine-readable `health-report.json` in `~/.np-ops-kit/` for future dashboard use
- Recommended cadence: weekly cron (`0 9 * * 1` — Monday 9am)

---

## Section 3: Content Gaps

### `03-protect-your-devices/mac-laptop-security.md` — new

Mirrors structure of `windows-laptop-security.md`:
- Why this matters (data at rest, device theft risk)
- Step-by-step: FileVault, Gatekeeper, firewall, screen lock, Find My Mac, automatic updates
- Browser hardening: Safari privacy settings, Chrome extensions to avoid
- Links to `setup-mac.sh` for one-command automated setup
- Verification checklist at the end

### `03-protect-your-devices/mobile-security-guide.md` — new

BYOD-focused (nonprofits can't issue phones):
- iOS section: screen lock PIN (not pattern), Face ID/Touch ID, Find My iPhone, app permission audit, automatic updates, iCloud backup
- Android section: same structure, device encryption check, Google Find My Device
- Work/personal separation: iOS Managed Apple ID guidance, Android Work Profile setup
- Remote wipe instructions for both platforms
- Volunteer agreement template (one-page BYOD policy)

### `04-backup-your-data/README.md` — full replacement of stub

- 3-2-1 strategy explained in plain English (3 copies, 2 media types, 1 offsite)
- rclone setup walkthrough: install, configure Google Drive remote, first sync
- Scheduling: cron (Mac/Linux) and Task Scheduler (Windows) step-by-step
- Verification: links to `backup-verify.sh`
- What to back up: prioritized list (donor database, financial records, email, documents)

### `04-backup-your-data/ransomware-recovery-runbook.md` — new

- Decision tree: symptoms → isolate → assess → restore vs. rebuild
- Step 1: Isolate (disconnect from network immediately — exact steps for Windows/Mac)
- Step 2: Assess (which systems, what data, when last clean backup)
- Step 3: Restore from backup (rclone restore commands)
- Step 4: Report (FBI IC3 reporting link, state AG notification requirements summary)
- Contact list template: cyber insurance, legal counsel, IT support, board chair
- Post-incident: what to change to prevent recurrence

---

## Section 4: Interactive Assessment Tool

### `assessment/index.html` — new single-file app

**Architecture:** Vanilla HTML/CSS/JS, zero external dependencies. Opens with double-click, works fully offline.

**Content:** Mirrors `SECURITY_ASSESSMENT.md` exactly — 6 sections, ~30 questions, same scoring thresholds.

**UX flow:**
1. Landing: org name input (optional, used in PDF header), "Start Assessment" button
2. One section per screen with progress indicator (e.g. "Section 2 of 6")
3. Each question: Yes / No / Not Sure radio buttons, inline "why this matters" tooltip
4. Section summary: color-coded score (green/amber/red), brief explanation
5. Final report: overall risk level, top 5 priority actions auto-generated from "No"/"Not Sure" answers, each action linked to the relevant module guide

**Output:**
- "Save as PDF" via `window.print()` with print-specific CSS (clean layout, no nav chrome)
- Shareable URL: answers encoded as base64 in URL hash — send a pre-filled assessment to a board member

**Hosting:**
- GitHub Actions deploys `assessment/` to `gh-pages` branch on every push to main
- Live URL: `https://kroeungcyber.github.io/nonprofit-security-toolkit/`
- README hero section gets a prominent CTA button: "→ Take the Free Security Assessment"

**Accessibility:** WCAG AA contrast ratios, full keyboard navigation, `aria-label` on all inputs, responsive flexbox layout (works on phones).

---

## Section 5: Case Studies

### `case-studies/community-health-clinic.md` — new

- **Org:** Community health clinic, 12 staff, handles patient intake forms (HIPAA-adjacent)
- **Tech:** 4 shared Windows laptops, Gmail (personal accounts), no IT staff
- **Risk profile:** Patient trust at stake, shared credentials, no backups
- **Incident:** Near-miss ransomware via phishing email attachment
- **Implementation:** Modules 3 (device hardening via PS1 script) + 4 (rclone backup) + health-check script
- **Outcome:** Assessment score improved from Critical to Compliant; backup verified weekly

### `case-studies/food-bank.md` — new

- **Org:** Food bank, 8 staff + 30 rotating volunteers, heavy seasonal turnover
- **Tech:** Google Workspace free tier, mix of personal devices, no onboarding process
- **Risk profile:** Ex-volunteer access, shared passwords, no offboarding checklist
- **Incident:** Former volunteer accessed donor spreadsheet 3 months after leaving
- **Implementation:** Modules 1 (Bitwarden + 2FA) + 2 (email hardening) + onboarding/offboarding checklists
- **Outcome:** Assessment score from Critical to Strong in password section; zero access incidents post-implementation

### `case-studies/TEMPLATE.md` — new

Structured fields:
- Organization type, size, annual budget, tech environment
- Security Assessment results before (section scores)
- Which modules were implemented and in what order
- Measurable outcomes (assessment score delta, incidents prevented, time saved)
- Anonymization note: real name optional, "Small Animal Rescue in the Southeast" is fine

### `CONTRIBUTING.md` update

Add "Share Your Story" section:
- Points to `case-studies/TEMPLATE.md`
- Explains anonymization options
- Submission via PR or email (opens a GitHub Issue template for non-technical contributors)

---

## Implementation Order

1. `.github/workflows/validate.yml` + `security-scan.yml` + `completeness.yml`
2. Harden `scripts/setup-new-laptop.ps1`
3. `scripts/setup-mac.sh`
4. `scripts/backup-verify.sh` + `scripts/security-health-check.sh`
5. `03-protect-your-devices/mac-laptop-security.md`
6. `03-protect-your-devices/mobile-security-guide.md`
7. `04-backup-your-data/README.md` (full replacement) + `ransomware-recovery-runbook.md`
8. `assessment/index.html` + GitHub Pages workflow
9. `case-studies/community-health-clinic.md` + `case-studies/food-bank.md` + `case-studies/TEMPLATE.md`
10. `CONTRIBUTING.md` update + README badge row + README CTA button

---

## Success Criteria

- All 3 CI workflows pass on a clean push
- `PSScriptAnalyzer` and `shellcheck` report zero errors on all scripts
- `lychee` reports zero broken links
- Completeness report shows 8/8 modules complete
- Assessment tool loads offline, produces a printable PDF, and is accessible via `gh-pages`
- Mac and Windows setup scripts both exit `0` on a clean machine with `--dry-run`
- `backup-verify.sh` exits non-zero when backup is stale (verified by seeding a stale timestamp in CI)
