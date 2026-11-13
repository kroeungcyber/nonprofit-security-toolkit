# AGENTS.md — NonProfit Security Toolkit

Guidance for AI agents (and humans) working in this repository.

## Project

NP Ops Kit: a zero-budget security toolkit that helps small non-profits (5–50
people, no IT staff) protect donors, data, and volunteers. Whitehat research
turned into plain-language guides, checklists, templates, and scripts.

- License: MIT
- Audience: non-technical volunteers — content must work for them
- Cost rule: free tools first, low-cost acceptable, paid tools must be justified

## Repository Layout

- `01-protect-your-people/` … `05-keep-good-records/` — the 8 numbered core
  modules; each is a folder of markdown guides, policies, and checklists
- `case-studies/` — real-world incident write-ups (anonymized)
- `scripts/` — automation for volunteers (currently one PowerShell setup script)
- `docs/` — internal plans and specs (design/implementation history)
- `SECURITY_ASSESSMENT.md`, `IMPLEMENTATION_PLAYBOOK.md` — program-level docs
- `CONTRIBUTING.md` — contributor guidelines and code of conduct (authoritative
  for style and process questions)

## Content Conventions

- Write like you are explaining to a smart, non-technical friend. No jargon
  without an explanation; use analogies.
- Every procedure needs specific steps (click here, type this), time estimates,
  and difficulty levels. Do not skip steps that "seem obvious."
- Use checklists for procedures, tables for comparisons, bold for warnings,
  short scannable paragraphs.
- When recommending tools: free first, state cost, explain why, note
  limitations, offer alternatives.
- Case studies and checklists must never contain real names, credentials,
  donor data, or live URLs. Use placeholders like `NAME`, `ORG`, `EXAMPLE.COM`.
- This is a docs-first repository. No frameworks, no build step, no package.json.
  Do not introduce a build system or dependencies unless explicitly requested.

## Security Constraints for Agents

- Never commit secrets, API keys, real donor information, or organization
  identifiers. Search diffs for them before finishing any change.
- PowerShell scripts must stay defensible: no credential storage, no disabling
  of security controls, no remote code execution without explanation.
- Attack-technique write-ups are for education and defense only. Frame every
  case study around prevention, detection, and response — not exploitation steps.

## Workflow

- Work on feature branches; commit messages describe what and why in plain
  English. Main branch is protected by PR.
- Before finishing: run `git status` and `git diff --check`; review the full
  diff for the constraints above.
- Markdown is the only format for content. Keep file names kebab-case.
- No lint/test suite exists. Verification = markdown renders correctly,
  links resolve, steps are complete, and the Security Constraints above hold.

## Relevant Skills

When applicable, load: documentation-and-adrs, code-review-and-quality,
security-and-hardening, debugging-and-error-recovery,
spec-driven-development (for new modules), and incremental-implementation.
