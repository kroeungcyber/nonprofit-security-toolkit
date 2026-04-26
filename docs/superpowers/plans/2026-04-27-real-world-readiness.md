# Real-World Readiness Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Transform the NP Ops Kit from a documentation skeleton into a fully validated, production-ready security toolkit with automated CI/CD, complete scripts, interactive assessment tool, and comprehensive content.

**Architecture:** Outside-in — CI pipeline first (validates everything that follows), then scripts, then content guides, then assessment tool, then case studies and polish. Each phase is validated by the pipeline before the next begins.

**Tech Stack:** GitHub Actions, markdownlint-cli2, lychee, shellcheck, PSScriptAnalyzer (pwsh), gitleaks, bash, PowerShell 5.1+, vanilla HTML/CSS/JS (no framework), rclone, bats-core (shell script testing)

---

## File Map

**Create:**
- `.github/workflows/validate.yml`
- `.github/workflows/security-scan.yml`
- `.github/workflows/completeness.yml`
- `.github/workflows/deploy-pages.yml`
- `.markdownlint.yml`
- `.lychee.toml`
- `scripts/check-completeness.sh`
- `scripts/setup-mac.sh`
- `scripts/backup-verify.sh`
- `scripts/security-health-check.sh`
- `tests/scripts/backup-verify.bats`
- `03-protect-your-devices/mac-laptop-security.md`
- `03-protect-your-devices/mobile-security-guide.md`
- `04-backup-your-data/ransomware-recovery-runbook.md`
- `assessment/index.html`
- `case-studies/community-health-clinic.md`
- `case-studies/food-bank.md`
- `case-studies/TEMPLATE.md`

**Modify:**
- `scripts/setup-new-laptop.ps1` — add StrictMode, DryRun, idempotency, structured exit codes
- `04-backup-your-data/README.md` — add rclone walkthrough, fix broken internal links
- `CONTRIBUTING.md` — add Share Your Story section
- `README.md` — add CI badges and assessment CTA

---

## Task 1: Lint Config + validate.yml

**Files:**
- Create: `.markdownlint.yml`
- Create: `.lychee.toml`
- Create: `.github/workflows/validate.yml`

- [ ] **Step 1: Create `.markdownlint.yml`**

```yaml
default: true
MD013:
  line_length: 200
MD033: false
MD041: false
MD024:
  siblings_only: true
```

- [ ] **Step 2: Create `.lychee.toml`**

```toml
exclude = [
  "https://shields.io",
  "https://opensource.org/licenses/MIT",
  "mailto:",
  "happytailsrescue.org",
  "riverviewclinic.org",
  "eastsidecares.org",
  "HKLM:",
  "HKCU:",
]
base = "."
accept = [429]
timeout = 20
max_retries = 3
```

- [ ] **Step 3: Create `.github/workflows/validate.yml`**

```yaml
name: Validate

on:
  push:
    branches: ["**"]
  pull_request:
    branches: ["**"]

jobs:
  markdown-lint:
    name: Markdown Lint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: DavidAnson/markdownlint-cli2-action@v16
        with:
          globs: "**/*.md"
          config: ".markdownlint.yml"

  link-check:
    name: Link Check
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: lycheeverse/lychee-action@v1
        with:
          args: --config .lychee.toml --verbose --no-progress './**/*.md'
          fail: true

  shellcheck:
    name: Shell Script Lint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: ludeeus/action-shellcheck@master
        with:
          scandir: "./scripts"
          severity: warning

  powershell-lint:
    name: PowerShell Lint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run PSScriptAnalyzer
        shell: pwsh
        run: |
          Install-Module PSScriptAnalyzer -Force -Scope CurrentUser -ErrorAction Stop
          $results = Invoke-ScriptAnalyzer `
            -Path scripts/setup-new-laptop.ps1 `
            -Severity Error,Warning `
            -ExcludeRule PSAvoidUsingWriteHost
          if ($results) {
            $results | Format-Table RuleName,Severity,Message,Line -AutoSize
            exit 1
          }
          Write-Host "PSScriptAnalyzer: no issues found"
```

- [ ] **Step 4: Commit**

```bash
git add .github/workflows/validate.yml .markdownlint.yml .lychee.toml
git commit -m "ci: add markdown lint, link check, shellcheck, and PSScriptAnalyzer workflows"
```

---

## Task 2: Security Scan Workflow

**Files:**
- Create: `.github/workflows/security-scan.yml`

- [ ] **Step 1: Create `.github/workflows/security-scan.yml`**

```yaml
name: Security Scan

on:
  push:
    branches: ["**"]
  pull_request:
    branches: ["**"]

jobs:
  secret-scan:
    name: Secret Scanning (gitleaks)
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: gitleaks/gitleaks-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  dangerous-patterns:
    name: Dangerous Pattern Check
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Check for dangerous shell patterns
        run: |
          FAILED=0
          if grep -rn "curl.*|.*bash\|curl.*|.*sh" scripts/ --include="*.sh"; then
            echo "ERROR: Found curl-pipe-shell pattern"
            FAILED=1
          fi
          if grep -rn "rm -rf" scripts/ --include="*.sh" | grep -v "#.*rm -rf"; then
            echo "ERROR: Found rm -rf without comment"
            FAILED=1
          fi
          if grep -rn 'rm \$[A-Z_]*[^"]' scripts/ --include="*.sh"; then
            echo "ERROR: Found unquoted variable in rm command"
            FAILED=1
          fi
          if [ $FAILED -eq 1 ]; then exit 1; fi
          echo "Dangerous pattern check passed."
```

- [ ] **Step 2: Commit**

```bash
git add .github/workflows/security-scan.yml
git commit -m "ci: add secret scanning and dangerous pattern detection"
```

---

## Task 3: Completeness Workflow + Check Script

**Files:**
- Create: `scripts/check-completeness.sh`
- Create: `.github/workflows/completeness.yml`

- [ ] **Step 1: Create `scripts/check-completeness.sh`**

```bash
#!/usr/bin/env bash
set -euo pipefail

MODULES=(
  "01-protect-your-people"
  "02-secure-your-email"
  "03-protect-your-devices"
  "04-backup-your-data"
  "05-keep-good-records"
  "case-studies"
  "scripts"
  "assessment"
)

PLACEHOLDER_PATTERNS="TBD|TODO|FIXME|coming soon|placeholder|INSERT"
PASS=0; FAIL=0; WARNINGS=0

echo "## Completeness Report"
echo ""
echo "| Module | Status | Issues |"
echo "|--------|--------|--------|"

for module in "${MODULES[@]}"; do
  issues=""
  status="complete"

  if [ ! -d "$module" ]; then
    echo "| $module | missing | directory does not exist |"
    ((FAIL++)) || true
    continue
  fi

  if [ ! -f "$module/README.md" ]; then
    issues="missing README.md"
    status="incomplete"
    ((FAIL++)) || true
  fi

  if [[ "$module" != "scripts" && "$module" != "assessment" ]]; then
    guide_count=$(find "$module" -maxdepth 1 -name "*.md" ! -name "README.md" | wc -l | tr -d ' ')
    if [ "$guide_count" -eq 0 ]; then
      issues="${issues:+$issues; }no guide files"
      status="incomplete"
      ((FAIL++)) || true
    fi
  fi

  placeholder_hits=$(grep -rn -E "$PLACEHOLDER_PATTERNS" "$module/" \
    --include="*.md" --include="*.sh" --include="*.ps1" --include="*.html" \
    2>/dev/null | head -3 || true)
  if [ -n "$placeholder_hits" ]; then
    issues="${issues:+$issues; }placeholder text found"
    status="warn"
    ((WARNINGS++)) || true
  fi

  if [ "$status" = "complete" ]; then
    echo "| $module | complete | — |"
    ((PASS++)) || true
  else
    echo "| $module | $status | $issues |"
  fi
done

echo ""
echo "**Summary:** $PASS complete, $FAIL incomplete, $WARNINGS warnings"

if [ "$FAIL" -gt 0 ]; then exit 1; fi
```

- [ ] **Step 2: Make executable**

```bash
chmod +x scripts/check-completeness.sh
```

- [ ] **Step 3: Create `.github/workflows/completeness.yml`**

```yaml
name: Completeness Check

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  completeness:
    name: Module Completeness
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run completeness check
        run: bash scripts/check-completeness.sh >> $GITHUB_STEP_SUMMARY
```

- [ ] **Step 4: Commit**

```bash
git add scripts/check-completeness.sh .github/workflows/completeness.yml
git commit -m "ci: add module completeness check with job summary reporting"
```

---

## Task 4: Harden setup-new-laptop.ps1

**Files:**
- Modify: `scripts/setup-new-laptop.ps1` (full replacement — file is 166 lines)

- [ ] **Step 1: Replace entire file with hardened version**

The new version adds to the existing script: `Set-StrictMode -Version Latest`, `$ErrorActionPreference = 'Stop'`, a `-DryRun` switch parameter, idempotency checks (read current state before writing), structured exit codes (0 = success, 2 = failures), and helper functions for consistent output.

Key structural changes:
- `[CmdletBinding(SupportsShouldProcess)]` replaces `[CmdletBinding()]`
- Add `[switch]$DryRun` to param block
- Add helper functions: `Write-Ok`, `Write-Skip`, `Write-Fail`, `Write-Dry`
- Per-section idempotency: read current registry/setting value before writing; if already correct, call `Write-Skip` and record result as 1 (skipped)
- `$Results` hashtable tracks each section: 0 = changed, 1 = skipped, 2 = failed
- `Stop-Transcript | Out-Null` at end (pipe to suppress output)
- Final exit: `if ($failCount -gt 0) { exit 2 }; exit 0`

**Section 1 idempotency check (Windows Updates):**
```powershell
$AUPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
$current = if (Test-Path $AUPath) {
    (Get-ItemProperty $AUPath -ErrorAction SilentlyContinue).AUOptions
} else { $null }

if ($current -eq 4) {
    Write-Skip "Automatic updates already enabled"
    $Results['Updates'] = 1
} elseif ($DryRun) {
    Write-Dry "Enable automatic updates (AUOptions=4)"
    $Results['Updates'] = 1
} else {
    # ... apply setting ...
    $Results['Updates'] = 0
}
```

Apply the same pattern to all 5 sections (Defender, Firewall, ScreenLock, FindMyDevice).

- [ ] **Step 2: Verify with PSScriptAnalyzer (if pwsh available)**

```bash
pwsh -Command "Install-Module PSScriptAnalyzer -Force -Scope CurrentUser; \$r = Invoke-ScriptAnalyzer -Path scripts/setup-new-laptop.ps1 -Severity Error,Warning -ExcludeRule PSAvoidUsingWriteHost; if (\$r) { \$r | Format-Table; exit 1 } else { Write-Host 'No issues' }"
```

Expected: `No issues`

- [ ] **Step 3: Commit**

```bash
git add scripts/setup-new-laptop.ps1
git commit -m "feat: harden setup-new-laptop.ps1 with DryRun, idempotency, StrictMode, exit codes"
```

---

## Task 5: setup-mac.sh

**Files:**
- Create: `scripts/setup-mac.sh`

- [ ] **Step 1: Create `scripts/setup-mac.sh`**

```bash
#!/usr/bin/env bash
# setup-mac.sh — Non-Profit Mac Security Setup
# Hardens macOS 12+ for nonprofit volunteer use. Idempotent. No third-party deps required.
#
# Usage:
#   sudo bash setup-mac.sh              # apply all settings
#   sudo bash setup-mac.sh --dry-run    # preview without changes
#   sudo bash setup-mac.sh --skip-homebrew

set -euo pipefail

DRY_RUN=false; SKIP_HOMEBREW=false; VERBOSE=false
for arg in "$@"; do
  case "$arg" in
    --dry-run)       DRY_RUN=true ;;
    --skip-homebrew) SKIP_HOMEBREW=true ;;
    --verbose)       VERBOSE=true ;;
  esac
done

LOG_FILE="$HOME/Library/Logs/NPSetup_$(date +%Y%m%d_%H%M%S).log"
PASS=0; SKIP=0; FAIL=0

log()  { echo "[$(date '+%H:%M:%S')] $*" | tee -a "$LOG_FILE"; }
ok()   { log "[OK]   $*"; ((PASS++)) || true; }
skip() { log "[SKIP] $* (already configured)"; ((SKIP++)) || true; }
fail() { log "[FAIL] $*"; ((FAIL++)) || true; }
dry()  { log "[DRY]  Would: $*"; }

if [ "$(id -u)" -ne 0 ]; then
  echo "ERROR: This script must be run with sudo." >&2
  exit 1
fi

log "NP Ops Kit — Mac Security Setup | macOS $(sw_vers -productVersion) | Log: $LOG_FILE"
$DRY_RUN && log "*** DRY RUN — no changes will be made ***"

# 1. FileVault
log "[1/6] FileVault"
fv_status=$(fdesetup status 2>/dev/null || echo "unknown")
if echo "$fv_status" | grep -q "FileVault is On"; then
  skip "FileVault already enabled"
elif $DRY_RUN; then
  dry "Enable FileVault full-disk encryption"
else
  fdesetup enable -user "$(stat -f '%Su' /dev/console)" >> "$LOG_FILE" 2>&1 \
    && ok "FileVault enabled (restart required)" \
    || fail "FileVault failed — enable manually: System Settings > Privacy & Security > FileVault"
fi

# 2. Application Firewall
log "[2/6] Application Firewall"
fw_status=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 2>/dev/null || echo "disabled")
if echo "$fw_status" | grep -q "enabled"; then
  skip "Application firewall already enabled"
elif $DRY_RUN; then
  dry "Enable application firewall with stealth mode"
else
  /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on >> "$LOG_FILE" 2>&1 \
    && ok "Firewall enabled" || fail "Firewall enable failed"
  /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on >> "$LOG_FILE" 2>&1 \
    && ok "Stealth mode enabled" || true
fi

# 3. Screen Lock
log "[3/6] Screen Lock (5 minutes)"
current_lock=$(defaults read com.apple.screensaver idleTime 2>/dev/null || echo "0")
if [ "$current_lock" = "300" ]; then
  skip "Screen lock already 5 minutes"
elif $DRY_RUN; then
  dry "Set screensaver idle to 300s, require password immediately"
else
  defaults write com.apple.screensaver idleTime -int 300
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0
  ok "Screen lock set to 5-minute timeout"
fi

# 4. Remote Login & Sharing
log "[4/6] Remote Login & Sharing"
remote_login=$(systemsetup -getremotelogin 2>/dev/null | awk '{print $NF}' || echo "Unknown")
if [ "$remote_login" = "Off" ]; then
  skip "Remote login already disabled"
elif $DRY_RUN; then
  dry "Disable remote login (SSH) and sharing services"
else
  systemsetup -setremotelogin off >> "$LOG_FILE" 2>&1 \
    && ok "Remote login disabled" || fail "Could not disable remote login"
fi
for service in com.apple.smbd com.apple.screensharing com.apple.RemoteDesktop.agent; do
  if launchctl list "$service" >/dev/null 2>&1; then
    if ! $DRY_RUN; then
      launchctl disable "system/$service" >> "$LOG_FILE" 2>&1 || true
    fi
  fi
done

# 5. Automatic Updates
log "[5/6] Automatic Updates"
auto_check=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled 2>/dev/null || echo "0")
if [ "$auto_check" = "1" ]; then
  skip "Automatic updates already enabled"
elif $DRY_RUN; then
  dry "Enable automatic OS and App Store updates"
else
  defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
  defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true
  defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true
  defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true
  ok "Automatic updates enabled"
fi

# 6. SIP Check
log "[6/6] System Integrity Protection"
sip_status=$(csrutil status 2>/dev/null || echo "unknown")
if echo "$sip_status" | grep -q "enabled"; then
  ok "SIP is enabled"
else
  fail "SIP is DISABLED — boot into Recovery Mode and run: csrutil enable"
fi

# Optional Homebrew tier
if ! $SKIP_HOMEBREW && command -v brew >/dev/null 2>&1; then
  log "[Optional] Homebrew security tools"
  if ! command -v lynis >/dev/null 2>&1; then
    $DRY_RUN && dry "brew install lynis" || brew install lynis >> "$LOG_FILE" 2>&1 && ok "lynis installed"
  else
    skip "lynis already installed"
  fi
  if command -v lynis >/dev/null 2>&1 && ! $DRY_RUN; then
    log "Running lynis quick scan..."
    lynis audit system --quick --no-colors 2>/dev/null | tail -10 | tee -a "$LOG_FILE" || true
  fi
fi

log "Setup complete: $PASS ok, $SKIP already configured, $FAIL failed | Log: $LOG_FILE"
log "Next: 1) Restart 2) Sign in to Apple ID for Find My Mac 3) Install Bitwarden"
if [ "$FAIL" -gt 0 ]; then exit 2; fi
exit 0
```

- [ ] **Step 2: Make executable**

```bash
chmod +x scripts/setup-mac.sh
```

- [ ] **Step 3: Run shellcheck**

```bash
shellcheck scripts/setup-mac.sh
```

Expected: no output (zero issues)

- [ ] **Step 4: Test dry-run**

```bash
sudo bash scripts/setup-mac.sh --dry-run
```

Expected: Lines beginning `[DRY]  Would:` for each step, exit 0.

- [ ] **Step 5: Commit**

```bash
git add scripts/setup-mac.sh
git commit -m "feat: add setup-mac.sh with core hardening and optional Homebrew security tier"
```

---

## Task 6: backup-verify.sh + Tests

**Files:**
- Create: `scripts/backup-verify.sh`
- Create: `tests/scripts/backup-verify.bats`

- [ ] **Step 1: Install bats-core**

```bash
brew install bats-core   # macOS
# or: npm install -g bats
```

- [ ] **Step 2: Write failing tests first**

Create `tests/scripts/backup-verify.bats`:

```bash
#!/usr/bin/env bats

SCRIPT="$BATS_TEST_DIRNAME/../../scripts/backup-verify.sh"

@test "backup age within threshold is considered fresh" {
  NOW=$(date +%s)
  TWELVE_HOURS_AGO=$((NOW - 43200))
  THRESHOLD=90000
  age=$((NOW - TWELVE_HOURS_AGO))
  [ "$age" -lt "$THRESHOLD" ]
}

@test "backup age exceeding threshold is stale" {
  NOW=$(date +%s)
  TWO_DAYS_AGO=$((NOW - 172800))
  THRESHOLD=90000
  age=$((NOW - TWO_DAYS_AGO))
  [ "$age" -gt "$THRESHOLD" ]
}

@test "script exits 1 when no rclone remotes configured" {
  mkdir -p "$BATS_TEST_DIRNAME/mocks"
  cat > "$BATS_TEST_DIRNAME/mocks/rclone" <<'MOCK'
#!/usr/bin/env bash
if [ "$1" = "listremotes" ]; then echo ""; exit 0; fi
exit 0
MOCK
  chmod +x "$BATS_TEST_DIRNAME/mocks/rclone"
  PATH="$BATS_TEST_DIRNAME/mocks:$PATH" run bash "$SCRIPT"
  [ "$status" -eq 1 ]
  [[ "$output" == *"No rclone remotes"* ]]
  rm -f "$BATS_TEST_DIRNAME/mocks/rclone"
}
```

- [ ] **Step 3: Run tests — verify test 3 fails (script doesn't exist yet)**

```bash
bats tests/scripts/backup-verify.bats
```

Expected: tests 1-2 pass, test 3 fails with "No such file or directory"

- [ ] **Step 4: Create `scripts/backup-verify.sh`**

```bash
#!/usr/bin/env bash
# backup-verify.sh — Verify rclone backups are fresh and restorable.
# Exit codes: 0 = all pass, 1 = no remotes or warnings, 2 = failures
#
# Usage:
#   bash backup-verify.sh
#   bash backup-verify.sh --threshold 48    # hours (default: 25)
#   bash backup-verify.sh --remote gdrive:

set -euo pipefail

THRESHOLD_HOURS=25
TARGET_REMOTE=""
CANARY_FILE=".backup-canary.txt"
PASS=0; WARN=0; FAIL=0

for arg in "$@"; do
  case "$arg" in
    --threshold) shift; THRESHOLD_HOURS="$1" ;;
    --remote)    shift; TARGET_REMOTE="$1" ;;
  esac
done

THRESHOLD_SECONDS=$((THRESHOLD_HOURS * 3600))

ok()   { echo "  [PASS] $*"; ((PASS++)) || true; }
warn() { echo "  [WARN] $*"; ((WARN++)) || true; }
fail() { echo "  [FAIL] $*"; ((FAIL++)) || true; }

if ! command -v rclone >/dev/null 2>&1; then
  echo "ERROR: rclone not installed. See https://rclone.org/install/"
  exit 1
fi

echo "Backup Verification — $(date) | Threshold: ${THRESHOLD_HOURS}h"
echo ""

if [ -n "$TARGET_REMOTE" ]; then
  REMOTES=("$TARGET_REMOTE")
else
  mapfile -t REMOTES < <(rclone listremotes 2>/dev/null | grep ':' || true)
fi

if [ "${#REMOTES[@]}" -eq 0 ]; then
  echo "No rclone remotes configured."
  echo "Run 'rclone config' to add a remote. See 04-backup-your-data/README.md"
  exit 1
fi

for remote in "${REMOTES[@]}"; do
  echo "Remote: $remote"

  if ! rclone lsd "$remote" --max-depth 1 >/dev/null 2>&1; then
    fail "Cannot reach $remote — check credentials and network"
    continue
  fi
  ok "Remote reachable"

  latest_file=$(rclone ls "$remote" --max-depth 3 2>/dev/null \
    | sort -k2 | tail -1 | awk '{print $2}' || true)

  if [ -z "$latest_file" ]; then
    warn "$remote appears empty — no backup files found"
    continue
  fi

  mod_time=$(rclone lsl "${remote}${latest_file}" 2>/dev/null \
    | awk '{print $2, $3}' | head -1 \
    | xargs -I{} date -j -f "%Y-%m-%d %H:%M:%S" "{}" "+%s" 2>/dev/null \
    || date +%s)

  now=$(date +%s)
  age=$((now - mod_time))
  age_hours=$((age / 3600))

  if [ "$age" -lt "$THRESHOLD_SECONDS" ]; then
    ok "Last backup: ${age_hours}h ago (within ${THRESHOLD_HOURS}h threshold)"
  else
    fail "Last backup: ${age_hours}h ago — STALE (threshold: ${THRESHOLD_HOURS}h)"
  fi

  canary_content="backup-canary-$(date +%s)"
  tmp_canary=$(mktemp)
  echo "$canary_content" > "$tmp_canary"

  if rclone copyto "$tmp_canary" "${remote}${CANARY_FILE}" >/dev/null 2>&1; then
    restore_tmp=$(mktemp)
    if rclone copyto "${remote}${CANARY_FILE}" "$restore_tmp" >/dev/null 2>&1; then
      restored=$(cat "$restore_tmp")
      if [ "$restored" = "$canary_content" ]; then
        ok "Canary restore verified"
      else
        fail "Canary content mismatch — backup may be corrupted"
      fi
    else
      fail "Could not restore canary from $remote"
    fi
    rm -f "$restore_tmp"
    rclone deletefile "${remote}${CANARY_FILE}" >/dev/null 2>&1 || true
  else
    warn "Could not write canary (read-only remote?)"
  fi
  rm -f "$tmp_canary"
  echo ""
done

echo "Results: $PASS pass, $WARN warnings, $FAIL failed"
if [ "$FAIL" -gt 0 ]; then exit 2; fi
if [ "$WARN" -gt 0 ]; then exit 1; fi
exit 0
```

- [ ] **Step 5: Make executable**

```bash
chmod +x scripts/backup-verify.sh
```

- [ ] **Step 6: Run tests — all 3 should pass**

```bash
bats tests/scripts/backup-verify.bats
```

Expected: `3 tests, 0 failures`

- [ ] **Step 7: Commit**

```bash
git add scripts/backup-verify.sh tests/scripts/backup-verify.bats
git commit -m "feat: add backup-verify.sh with canary restore test and bats test suite"
```

---

## Task 7: security-health-check.sh

**Files:**
- Create: `scripts/security-health-check.sh`

- [ ] **Step 1: Create `scripts/security-health-check.sh`**

```bash
#!/usr/bin/env bash
# security-health-check.sh — Weekly passive security posture check.
# No changes made to the system. Outputs human-readable report + JSON.
#
# Usage:
#   bash security-health-check.sh
#   bash security-health-check.sh --domain yourorg.org
#
# Cron (Monday 9am): 0 9 * * 1 /path/to/security-health-check.sh --domain yourorg.org

set -euo pipefail

DOMAIN=""
CONFIG_DIR="${HOME}/.np-ops-kit"
CONFIG_FILE="$CONFIG_DIR/config"
REPORT_FILE="$CONFIG_DIR/health-report.json"
mkdir -p "$CONFIG_DIR"

for arg in "$@"; do
  case "$arg" in
    --domain) shift; DOMAIN="$1" ;;
  esac
done

if [ -z "$DOMAIN" ] && [ -f "$CONFIG_FILE" ]; then
  DOMAIN=$(grep "^domain=" "$CONFIG_FILE" | cut -d= -f2 || true)
fi
if [ -z "$DOMAIN" ]; then
  read -r -p "Enter your organization domain (e.g. yourorg.org): " DOMAIN
  echo "domain=$DOMAIN" >> "$CONFIG_FILE"
fi

PASS=0; WARN=0; FAIL=0
declare -A CHECK_RESULTS

ok()   { echo "  [PASS] $*"; CHECK_RESULTS["$1"]="pass"; ((PASS++)) || true; }
warn() { echo "  [WARN] $*"; CHECK_RESULTS["$1"]="warn"; ((WARN++)) || true; }
fail() { echo "  [FAIL] $*"; CHECK_RESULTS["$1"]="fail"; ((FAIL++)) || true; }

echo "Security Health Check — $(date) — $DOMAIN"
echo ""

# Check 1: DMARC
echo "[1/4] DMARC for $DOMAIN"
dmarc=$(dig +short TXT "_dmarc.$DOMAIN" 2>/dev/null || echo "")
if echo "$dmarc" | grep -q "v=DMARC1"; then
  policy=$(echo "$dmarc" | grep -o 'p=[^;]*' | head -1)
  if echo "$policy" | grep -qE "p=reject|p=quarantine"; then
    ok "dmarc" "DMARC present with enforcing policy ($policy)"
  else
    warn "dmarc" "DMARC present but weak (p=none) — upgrade to p=quarantine"
  fi
else
  fail "dmarc" "No DMARC record found — see 02-secure-your-email/stop-phishing-attacks.md"
fi

# Check 2: SPF
echo "[2/4] SPF for $DOMAIN"
spf=$(dig +short TXT "$DOMAIN" 2>/dev/null | grep "v=spf1" || echo "")
if [ -n "$spf" ]; then
  ok "spf" "SPF record found"
else
  fail "spf" "No SPF record — see 02-secure-your-email/stop-phishing-attacks.md"
fi

# Check 3: Backup freshness
echo "[3/4] Backup Freshness"
if command -v rclone >/dev/null 2>&1; then
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  if bash "$script_dir/backup-verify.sh" >/dev/null 2>&1; then
    ok "backup" "All backups verified fresh"
  else
    fail "backup" "Backup issues detected — run: bash scripts/backup-verify.sh"
  fi
else
  warn "backup" "rclone not installed — cannot verify backups"
fi

# Check 4: OS Updates (macOS only)
echo "[4/4] OS Update Status"
if [ "$(uname -s)" = "Darwin" ]; then
  pending=$(softwareupdate -l 2>/dev/null | grep -c "^\*" || echo "0")
  if [ "$pending" -eq 0 ]; then
    ok "os_updates" "macOS is up to date"
  else
    warn "os_updates" "$pending pending update(s) — run: softwareupdate -i -a"
  fi
else
  warn "os_updates" "OS update check only supported on macOS"
fi

# Write JSON report
cat > "$REPORT_FILE" <<JSONEOF
{
  "generated": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "domain": "$DOMAIN",
  "summary": { "pass": $PASS, "warn": $WARN, "fail": $FAIL },
  "checks": {
    "dmarc": "${CHECK_RESULTS[dmarc]:-unknown}",
    "spf": "${CHECK_RESULTS[spf]:-unknown}",
    "backup": "${CHECK_RESULTS[backup]:-unknown}",
    "os_updates": "${CHECK_RESULTS[os_updates]:-unknown}"
  }
}
JSONEOF

echo ""
echo "Results: $PASS pass, $WARN warnings, $FAIL failed"
echo "Report: $REPORT_FILE"
echo "Cron: 0 9 * * 1 $(realpath "$0") --domain $DOMAIN"
if [ "$FAIL" -gt 0 ]; then exit 2; fi
if [ "$WARN" -gt 0 ]; then exit 1; fi
exit 0
```

- [ ] **Step 2: Make executable and lint**

```bash
chmod +x scripts/security-health-check.sh
shellcheck scripts/security-health-check.sh
```

Expected: no output

- [ ] **Step 3: Commit**

```bash
git add scripts/security-health-check.sh
git commit -m "feat: add security-health-check.sh with DMARC/SPF/backup/OS update checks and JSON report"
```

---

## Task 8: mac-laptop-security.md

**Files:**
- Create: `03-protect-your-devices/mac-laptop-security.md`

- [ ] **Step 1: Create the guide**

The guide mirrors the structure of `windows-laptop-security.md`. Cover these 8 steps with exact click paths, a verification table, and links to `setup-mac.sh`:

1. **FileVault** — System Settings > Privacy & Security > FileVault > Turn On
2. **Application Firewall** — System Settings > Network > Firewall > on + Options > Enable stealth mode
3. **Screen Lock** — System Settings > Lock Screen > 5 minutes, password Immediately
4. **Disable Remote Login** — System Settings > General > Sharing > Remote Login off, File/Screen Sharing off
5. **Automatic Updates** — System Settings > Software Update > enable all 4 toggles
6. **SIP Check** — Terminal: `csrutil status` → must say "enabled"
7. **Find My Mac** — System Settings > Apple ID > iCloud > Find My Mac on
8. **Browser Hardening** — Safari: cross-site tracking off, "safe files" download off; Chrome: Safety Check, block third-party cookies

End with a verification table and links to `setup-mac.sh` (automated option) and `mobile-security-guide.md`.

- [ ] **Step 2: Commit**

```bash
git add 03-protect-your-devices/mac-laptop-security.md
git commit -m "docs: add Mac laptop security hardening guide with automated setup option"
```

---

## Task 9: mobile-security-guide.md

**Files:**
- Create: `03-protect-your-devices/mobile-security-guide.md`

- [ ] **Step 1: Create the guide**

Structure:
- One-page BYOD policy template (copy-paste, fill in org name, volunteer signs)
- **iPhone section** — 6 steps with exact tap paths: screen lock (custom numeric), auto updates, app permissions audit (Location/Contacts/Camera to "While Using"), Find My iPhone, iCloud Backup, Lockdown Mode (for high-risk volunteers)
- **Android section** — 5 steps: screen lock, auto updates, Permission Manager audit, encryption check (`Settings > Security > Encryption`), Find My Device, Work Profile setup
- **Both platforms** — Bitwarden install, lost/stolen phone response checklist (within 1 hour + within 24 hours)
- Verification table: screen lock, auto updates, location permission, Find My, Bitwarden

- [ ] **Step 2: Commit**

```bash
git add 03-protect-your-devices/mobile-security-guide.md
git commit -m "docs: add BYOD mobile security guide for iOS and Android volunteers"
```

---

## Task 10: Backup Module Updates

**Files:**
- Modify: `04-backup-your-data/README.md`
- Create: `04-backup-your-data/ransomware-recovery-runbook.md`

- [ ] **Step 1: Fix broken links in `04-backup-your-data/README.md`**

The current README (line 41-42) links to `./simple-backup-strategy.md` and `./ransomware-recovery-plan.md` — neither exists.

Find and replace the "What's in This Section" block:
```markdown
1. **[Simple Backup Strategy](./simple-backup-strategy.md)** — The 3-2-1 rule explained
2. **[Ransomware Recovery Plan](./ransomware-recovery-plan.md)** — What to do if you're hit
```
Replace with:
```markdown
1. **[Ransomware Recovery Runbook](./ransomware-recovery-runbook.md)** — What to do if you're hit
2. **[Backup Verification Script](../scripts/backup-verify.sh)** — Automated weekly check

Jump to: [rclone Setup Walkthrough](#rclone-setup-walkthrough)
```

Also fix the bottom nav (last 2 lines):
```markdown
**[← Back to Main Menu](../README.md)**
**[Next: Simple Backup Strategy →](./simple-backup-strategy.md)**
```
Replace with:
```markdown
**[← Back to Main Menu](../README.md)**
**[Next: Ransomware Recovery Runbook →](./ransomware-recovery-runbook.md)**
```

- [ ] **Step 2: Add rclone walkthrough section to README**

After the "Free Tools for Backups" table (after line 126), add a new `## rclone Setup Walkthrough` section covering:
- Install: `brew install rclone` (Mac), download from rclone.org (Windows), `curl install.sh | sudo bash` (Linux)
- Configure Google Drive: `rclone config` interactive walkthrough (10 numbered steps)
- First backup: `rclone sync ~/Documents gdrive:NPBackup/Documents --progress`
- Mac cron: `0 2 * * * rclone sync ...`
- Windows Task Scheduler: 8-step UI walkthrough
- Verify: `bash scripts/backup-verify.sh`

- [ ] **Step 3: Create `04-backup-your-data/ransomware-recovery-runbook.md`**

Sections:
- What Is Ransomware (signs: encrypted files, ransom note, can't open docs)
- Decision Tree (have backups? → don't pay, restore; no backups? → contact FBI IC3 before paying)
- Step 1: Isolate Immediately (Windows: disconnect WiFi + unplug ethernet; Mac: same; alert team)
- Step 2: Assess Damage (table: which computers, what files, when started, last clean backup)
- Step 3: Restore from Backup (rclone restore commands, Windows Backup, Time Machine)
- Step 4: Report (FBI IC3 at ic3.gov, state AG, cyber insurance — with 72-hour notice requirement)
- Step 5: Rebuild Infected Machine (Windows: Reset PC → Remove Everything; Mac: Recovery Mode → Erase → Reinstall; then re-run setup scripts)
- Step 6: Post-Incident Review (how did it happen? run `security-health-check.sh`, re-take assessment)
- Emergency Contact List template (cyber insurance, legal, IT volunteer, board chair, FBI IC3)
- Prevention Checklist (6 checkboxes linked to relevant modules)

- [ ] **Step 4: Commit**

```bash
git add 04-backup-your-data/README.md 04-backup-your-data/ransomware-recovery-runbook.md
git commit -m "docs: add rclone walkthrough to backup README and ransomware recovery runbook"
```

---

## Task 11: Interactive Assessment Tool

**Files:**
- Create: `assessment/index.html`

**Security note:** All dynamic content comes from the hardcoded `SECTIONS` constant (not user input). The URL hash stores only `yes/no/notsure` values validated via strict equality checks. Use `textContent` for all dynamic text to be safe.

- [ ] **Step 1: Create `assessment/index.html`**

The file is a single self-contained HTML page. Structure:

```
<!DOCTYPE html>
<html lang="en">
<head>
  [CSS inline — see below]
</head>
<body>
<div class="container">
  <div id="assessment"> ... </div>
  <div id="report" style="display:none"> ... </div>
</div>
<script>
  const SECTIONS = [ ... 9 sections ... ];
  let answers = {};
  function renderSections() { ... }
  function setAnswer(sectionId, questionIndex, value) { ... }
  function generateReport() { ... }
  function saveToHash() { ... }
  function loadFromHash() { ... }
  loadFromHash();
  renderSections();
</script>
</body>
</html>
```

**CSS (inline in `<style>`):**
```css
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
:root {
  --green: #1a7f37; --amber: #bf8700; --red: #cf222e;
  --green-bg: #dafbe1; --amber-bg: #fff8c5; --red-bg: #ffebe9;
  --border: #d0d7de; --bg: #f6f8fa; --text: #1f2328; --accent: #0969da;
}
body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
       background: var(--bg); color: var(--text); line-height: 1.6; }
.container { max-width: 760px; margin: 0 auto; padding: 2rem 1rem; }
.section-card { background: #fff; border: 1px solid var(--border); border-radius: 8px;
                padding: 1.5rem; margin-bottom: 1.5rem; }
.question { display: flex; align-items: flex-start; gap: 1rem;
            padding: 0.75rem 0; border-bottom: 1px solid var(--border); }
.question:last-of-type { border-bottom: none; }
.question-text { flex: 1; font-size: 0.95rem; }
.options { display: flex; gap: 0.5rem; flex-shrink: 0; }
.options label { display: flex; flex-direction: column; align-items: center;
                 gap: 0.25rem; cursor: pointer; font-size: 0.75rem; }
.options input[type=radio] { accent-color: var(--accent); width: 18px; height: 18px; }
.section-score { margin-top: 1rem; padding: 0.75rem 1rem; border-radius: 6px;
                 font-size: 0.9rem; font-weight: 500; display: none; }
.score-strong  { background: var(--green-bg); color: var(--green); }
.score-warning { background: var(--amber-bg); color: var(--amber); }
.score-critical{ background: var(--red-bg);   color: var(--red); }
.btn { padding: 0.6rem 1.5rem; border: none; border-radius: 6px; cursor: pointer; font-size: 1rem; }
.btn-primary { background: var(--accent); color: #fff; }
.module-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
.module-card { padding: 1rem; border-radius: 6px; border: 1px solid var(--border); font-size: 0.9rem; }
@media (max-width: 600px) { .module-grid { grid-template-columns: 1fr; } }
@media print { .btn { display: none; } }
```

**`SECTIONS` data (all 9 from SECURITY_ASSESSMENT.md):**
```js
const SECTIONS = [
  { id:'passwords', title:'Passwords & Account Security', emoji:'🔐',
    module:'../01-protect-your-people/', moduleLabel:'Module 1: Protect Your People',
    questions:[
      'Do all staff/volunteers use a password manager?',
      'Are all accounts protected with two-factor authentication (2FA)?',
      'Are passwords at least 12 characters long?',
      'Do people use different passwords for different accounts?',
      'Are shared accounts logged in a secure place?',
      'Are ex-volunteer accounts disabled within 24 hours of departure?'
    ]},
  { id:'email', title:'Email Security', emoji:'📧',
    module:'../02-secure-your-email/', moduleLabel:'Module 2: Secure Your Email',
    questions:[
      'Have you set up email authentication (SPF, DKIM, DMARC)?',
      'Can volunteers recognize a phishing email?',
      'Is there a process for reporting suspicious emails?',
      'Do you have email filtering enabled?',
      'Are email forwarding rules regularly checked?'
    ]},
  { id:'devices', title:'Device Security', emoji:'💻',
    module:'../03-protect-your-devices/', moduleLabel:'Module 3: Protect Your Devices',
    questions:[
      'Do all computers have automatic updates turned on?',
      'Is antivirus software installed and running on all devices?',
      'Are computers password-protected (not auto-login)?',
      'Do screens lock after 5-10 minutes of inactivity?',
      'Is there a policy for using personal devices for work?',
      'Are old computers wiped before disposal or donation?'
    ]},
  { id:'backup', title:'Data Backup', emoji:'💾',
    module:'../04-backup-your-data/', moduleLabel:'Module 4: Backup Your Data',
    questions:[
      'Are critical files backed up automatically?',
      'Are backups stored in a different location (cloud or off-site)?',
      'Have you tested restoring from backup in the last 6 months?',
      "Is donor/volunteer data encrypted when stored?",
      'Do you know what data you have and where it\'s stored?',
      'Is there a plan for recovering from ransomware?'
    ]},
  { id:'network', title:'Network & Remote Work', emoji:'🌐',
    module:'../05-keep-good-records/', moduleLabel:'Module 5: Keep Good Records',
    questions:[
      'Is your office WiFi password-protected (not open)?',
      'Is there a separate WiFi network for guests?',
      'Is your router admin password changed from the default?',
      'Do remote workers use a VPN for sensitive work?',
      'Is remote desktop access secured with strong passwords?'
    ]},
  { id:'docs', title:'Documentation & Processes', emoji:'📝',
    module:'../05-keep-good-records/', moduleLabel:'Module 5: Keep Good Records',
    questions:[
      'Do you have a list of all software/services you use?',
      'Is there an inventory of computers and devices?',
      'Do you have contact info for all technology vendors?',
      'Is there a plan for what to do if you get hacked?',
      'Are there written policies for acceptable technology use?',
      'Do you review who has access at least twice a year?'
    ]},
  { id:'privacy', title:'Privacy & Compliance', emoji:'🛡️',
    module:'../05-keep-good-records/compliance-quick-guide.md', moduleLabel:'Compliance Guide',
    questions:[
      'Do you have a privacy notice/policy on your website?',
      'Do you know which data protection laws apply to you (GDPR, CCPA)?',
      'Do you have a data retention schedule?',
      'Do you have a process for handling data deletion requests?',
      'Do you have Data Processing Agreements with vendors?',
      'Do you have a breach response plan with 72-hour notification?',
      'Do you assess the security of critical vendors?',
      'Do you document what personal data you collect and why?'
    ]},
  { id:'monitoring', title:'Security Monitoring', emoji:'🔍',
    module:'../05-keep-good-records/security-monitoring-guide.md', moduleLabel:'Security Monitoring Guide',
    questions:[
      'Do you review security logs at least weekly?',
      'Are security alerts configured for suspicious activity?',
      'Do you monitor failed login attempts?',
      'Do you have alerts for data breach notifications?',
      'Do you export and retain security logs?',
      'Do you review admin activity regularly?',
      'Do you monitor for unusual data access or downloads?',
      'Do you have a process for investigating security alerts?'
    ]},
  { id:'physical', title:'Physical Security', emoji:'🏢',
    module:'../05-keep-good-records/physical-security-guide.md', moduleLabel:'Physical Security Guide',
    questions:[
      'Is your office locked when unattended?',
      'Do you have a visitor sign-in/sign-out procedure?',
      'Are sensitive files stored in locked cabinets?',
      'Do you have a clean desk policy?',
      'Do you shred sensitive documents before disposal?',
      'Are laptops secured with cable locks or stored locked away?',
      'Do you have an emergency action plan?',
      'Do you control who has keys/access codes?'
    ]}
];
```

**Key JS functions:**

`sectionScore(sectionId)` — counts No+NotSure answers; returns `'strong'` (0), `'warning'` (1-2), or `'critical'` (3+).

`renderSections()` — builds DOM using `document.createElement` (NOT template literal innerHTML) for each section card, question row, and radio group. Uses `textContent` for all text content.

`setAnswer(sectionId, idx, value)` — updates `answers` object, calls `updateSectionScore`, `updateProgress`, `saveToHash`.

`updateSectionScore(sectionId)` — updates the score div: `el.style.display = 'block'` and `el.textContent = label`.

`generateReport()` — builds report using DOM methods:
```js
// Priority list — use createElement, NOT innerHTML
listEl.textContent = '';
priorities.slice(0, 8).forEach(p => {
  const li = document.createElement('li');
  li.textContent = p.question + ' \u2192 ';
  const a = document.createElement('a');
  a.href = p.module;
  a.textContent = p.moduleLabel;
  li.appendChild(a);
  listEl.appendChild(li);
});

// Module grid — use createElement
gridEl.textContent = '';
SECTIONS.forEach(s => {
  const score = sectionScore(s.id);
  const bgClass = {strong:'score-strong', warning:'score-warning', critical:'score-critical'}[score];
  const label = {strong:'Strong', warning:'Needs Attention', critical:'Critical Risk'}[score];
  const div = document.createElement('div');
  div.className = 'module-card ' + bgClass;
  const title = document.createElement('strong');
  title.textContent = s.emoji + ' ' + s.title;
  div.appendChild(title);
  div.appendChild(document.createElement('br'));
  div.appendChild(document.createTextNode(label));
  gridEl.appendChild(div);
});
```

`saveToHash()` — `btoa(JSON.stringify(answers))` → `history.replaceState(null,'','#'+encoded)`

`loadFromHash()` — `answers = JSON.parse(atob(location.hash.slice(1)))` in a try/catch

- [ ] **Step 2: Open and verify in browser**

```bash
open assessment/index.html
```

Manual checks:
- All 9 sections render with correct question text
- Selecting No on 3+ questions in a section shows `🚨 Critical Risk` badge
- Generate Report shows overall risk level + priority action list with correct module links
- "Save as PDF" opens print dialog, navigation buttons hidden in print view
- Copy URL after answering, paste in new tab — answers restored from hash
- Tab key navigates through all radio buttons (keyboard accessible)

- [ ] **Step 3: Commit**

```bash
git add assessment/index.html
git commit -m "feat: add single-file interactive security assessment with URL hash sharing and PDF export"
```

---

## Task 12: GitHub Pages Deployment

**Files:**
- Create: `.github/workflows/deploy-pages.yml`

- [ ] **Step 1: Enable GitHub Pages in repo settings**

Visit: `https://github.com/kroeungcyber/nonprofit-security-toolkit/settings/pages`
Set Source to **GitHub Actions**, click Save.

- [ ] **Step 2: Create `.github/workflows/deploy-pages.yml`**

```yaml
name: Deploy Assessment to GitHub Pages

on:
  push:
    branches: [main]
    paths:
      - 'assessment/**'
      - '.github/workflows/deploy-pages.yml'

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v4
      - uses: actions/upload-pages-artifact@v3
        with:
          path: assessment/
      - uses: actions/deploy-pages@v4
        id: deployment
```

- [ ] **Step 3: Commit and verify**

```bash
git add .github/workflows/deploy-pages.yml
git commit -m "ci: deploy assessment tool to GitHub Pages on push to main"
git push origin main
```

Check `https://github.com/kroeungcyber/nonprofit-security-toolkit/actions` — deploy-pages job should succeed.
Assessment lives at: `https://kroeungcyber.github.io/nonprofit-security-toolkit/`

---

## Task 13: Case Studies

**Files:**
- Create: `case-studies/community-health-clinic.md`
- Create: `case-studies/food-bank.md`
- Create: `case-studies/TEMPLATE.md`

- [ ] **Step 1: Create `case-studies/community-health-clinic.md`**

Profile: 12-staff community health clinic, shared Windows laptops, personal Gmail (no org domain), patient intake data. Incident: phishing email forwarded 3 times before anyone questioned it.

Assessment scores before: Passwords 🚨, Devices 🚨, Backup 🚨, Email ⚠️
Implementation: Google Workspace for Nonprofits (free via TechSoup) + Bitwarden, ran `setup-new-laptop.ps1` on 4 laptops (45 min total vs 2h manual), DMARC, rclone nightly backup, phishing training.
Results after: all 4 sections improved to ✅ Strong. Key metric: 83% of staff passed simulated phishing test.

- [ ] **Step 2: Create `case-studies/food-bank.md`**

Profile: 8 staff + 30 rotating seasonal volunteers, high turnover, Google Workspace, ex-volunteer accessed donor spreadsheet 6 months after leaving.

Assessment scores before: Passwords 🚨 (6/6 critical), Documentation 🚨, Email ⚠️
Implementation: Bitwarden, immediate access audit (removed 9 stale accounts), onboarding/offboarding checklists, DMARC, `security-health-check.sh` as Monday morning cron.
Results after: Passwords ✅, Documentation ✅, Email ✅. Zero unauthorized access incidents since.

- [ ] **Step 3: Create `case-studies/TEMPLATE.md`**

Sections: Organization Profile table (type, size, budget, tech, location, data at risk), Assessment Results Before (score table), The Situation (2-3 specific examples), Incident (optional), Implementation by week (what + commands used), Results After (score table + measurable outcomes), Key Lessons (3 bullet points).

Submission options: PR, GitHub Issue (`case-study` label), or email. Anonymization note: org name optional throughout.

- [ ] **Step 4: Commit**

```bash
git add case-studies/community-health-clinic.md case-studies/food-bank.md case-studies/TEMPLATE.md
git commit -m "docs: add two case studies and case study submission template"
```

---

## Task 14: CONTRIBUTING.md + README Polish

**Files:**
- Modify: `CONTRIBUTING.md`
- Modify: `README.md`

- [ ] **Step 1: Update Case Studies section in `CONTRIBUTING.md`**

Find the existing "1. Case Studies" subsection under "Areas We Especially Need Help" and replace it with:

```markdown
### 1. Case Studies

Real-world examples are the most valuable contribution — other organizations learn best from
stories like their own.

**To share your story:**
1. See [case-studies/TEMPLATE.md](./case-studies/TEMPLATE.md) for the format
2. Anonymization fully supported — org name never required
3. Submit via PR, GitHub Issue (label: `case-study`), or email to the maintainer

**What makes a good case study:** specific numbers (accounts removed, time saved, score change),
what finally prompted action, and what you'd do differently.

Existing examples: [Small Animal Rescue](./case-studies/small-animal-rescue.md),
[Community Health Clinic](./case-studies/community-health-clinic.md),
[Eastside Food Bank](./case-studies/food-bank.md)
```

- [ ] **Step 2: Update badge row in `README.md`**

Find the existing badge row (lines 5-7) and replace with:

```markdown
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://github.com/kroeungcyber/nonprofit-security-toolkit/actions/workflows/validate.yml/badge.svg)](https://github.com/kroeungcyber/nonprofit-security-toolkit/actions/workflows/validate.yml)
[![Zero Budget](https://img.shields.io/badge/Cost-%240-green)](./IMPLEMENTATION_PLAYBOOK.md)

**[Take the Free Security Assessment →](https://kroeungcyber.github.io/nonprofit-security-toolkit/)**
15 minutes · No signup · Instant priority report
```

- [ ] **Step 3: Commit**

```bash
git add CONTRIBUTING.md README.md
git commit -m "docs: add Share Your Story to CONTRIBUTING and CI badges + assessment CTA to README"
```

---

## Task 15: Push and Verify Everything

- [ ] **Step 1: Push all commits**

```bash
git push origin main
```

- [ ] **Step 2: Verify all CI workflows pass**

Visit: `https://github.com/kroeungcyber/nonprofit-security-toolkit/actions`

Expected — all green:
- **Validate:** markdown lint, link check, shellcheck, PSScriptAnalyzer
- **Security Scan:** gitleaks, dangerous patterns
- **Completeness:** job summary shows 8/8 modules complete
- **Deploy Pages:** assessment live at GitHub Pages

- [ ] **Step 3: Verify completeness report (job summary)**

In the Completeness workflow run → Summary tab. Expected:
```
| Module | Status | Issues |
|--------|--------|--------|
| 01-protect-your-people | complete | — |
| 02-secure-your-email | complete | — |
| 03-protect-your-devices | complete | — |
| 04-backup-your-data | complete | — |
| 05-keep-good-records | complete | — |
| case-studies | complete | — |
| scripts | complete | — |
| assessment | complete | — |
Summary: 8 complete, 0 incomplete, 0 warnings
```

- [ ] **Step 4: Verify assessment tool at GitHub Pages URL**

Open `https://kroeungcyber.github.io/nonprofit-security-toolkit/`
- All 9 sections present
- Section scores update in real-time
- Generate Report produces a priority action list with correct links
- Print dialog opens cleanly (nav buttons hidden)
- URL hash preserves answers across tabs

- [ ] **Step 5: Verify scripts locally**

```bash
sudo bash scripts/setup-mac.sh --dry-run
# Expected: [DRY] Would: lines for each step, exit 0

bash scripts/security-health-check.sh --domain example.org
# Expected: 4 checks run, JSON at ~/.np-ops-kit/health-report.json, exit 0 or 1

bats tests/scripts/backup-verify.bats
# Expected: 3 tests, 0 failures
```

---

## Spec Coverage Checklist

| Spec Requirement | Implemented In |
|-----------------|---------------|
| validate.yml: markdownlint, lychee, shellcheck, PSScriptAnalyzer | Task 1 |
| security-scan.yml: gitleaks, dangerous patterns | Task 2 |
| completeness.yml + check-completeness.sh | Task 3 |
| PS1: StrictMode, DryRun, idempotency, exit codes | Task 4 |
| setup-mac.sh: core + optional Homebrew tier | Task 5 |
| backup-verify.sh: canary restore, bats tests | Task 6 |
| security-health-check.sh: DMARC/SPF/backup/OS, JSON report | Task 7 |
| mac-laptop-security.md | Task 8 |
| mobile-security-guide.md: iOS + Android + BYOD policy | Task 9 |
| 04-backup-your-data/README.md: rclone walkthrough, fixed links | Task 10 |
| ransomware-recovery-runbook.md | Task 10 |
| assessment/index.html: 9 sections, scoring, URL hash, PDF | Task 11 |
| deploy-pages.yml + GitHub Pages | Task 12 |
| community-health-clinic.md + food-bank.md + TEMPLATE.md | Task 13 |
| CONTRIBUTING.md Share Your Story | Task 14 |
| README CI badges + assessment CTA | Task 14 |
