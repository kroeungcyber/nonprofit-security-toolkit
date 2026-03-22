# 🔍 Security Monitoring Guide

**Detect threats early through logs, alerts, and continuous monitoring.**

---

## Why This Matters

You can't protect what you can't see. Security monitoring helps you:

- **Detect breaches early** — Before major damage occurs
- **Identify insider threats** — Unauthorized access by staff/volunteers
- **Meet compliance requirements** — GDPR, insurance, and audit requirements
- **Investigate incidents** — Understand what happened after the fact
- **Prove due diligence** — Show you took reasonable security measures

**Real story:** A non-profit noticed unusual login times in their Google Workspace logs. Investigation revealed a volunteer's account was compromised. Because they caught it within 24 hours, they prevented the attacker from accessing donor data.

---

## What You'll Accomplish

- ✅ Enable logging on critical systems
- ✅ Set up security alerts
- ✅ Establish log review procedures
- ✅ Meet compliance log retention requirements
- ✅ Detect suspicious activity early

**Time to implement:** 2-3 hours initially, 15 minutes/month ongoing  
**Cost:** $0 (using built-in tools)  
**Difficulty:** Easy to Medium

---

## The Monitoring Framework

### What to Monitor (The Critical 5)

**1. Account Activity**
- Failed login attempts
- Successful logins from unusual locations
- Password changes
- New account creations
- Privilege changes

**2. Data Access**
- Who accessed sensitive files
- Large data downloads
- Unusual data export activity
- Access outside business hours

**3. Email Activity**
- Suspicious forwarding rules
- Bulk emails sent
- Login from new devices
- Unusual email patterns

**4. System Changes**
- Software installations
- Configuration changes
- New admin accounts
- Security setting changes

**5. Network Activity**
- Unusual traffic patterns
- Connections to suspicious IP addresses
- Large data transfers
- VPN connections

---

## Step 1: Enable Logging on Critical Systems

### Google Workspace (Free Non-Profit Tier)

**What You Can Monitor:**
- Login activity
- Admin activity
- OAuth token activity
- Email log events
- Drive audit events

**How to Enable:**

1. **Go to Google Admin Console**
   - admin.google.com
   - Sign in with admin account

2. **Navigate to Reporting**
   - Reports → Audit and investigation

3. **Review Available Logs**
   - User activity reports
   - Admin activity reports
   - Login activity reports
   - OAuth token activity

4. **Set Data Retention**
   - Security → Settings → Data retention
   - Set to maximum (typically 6 months for free tier)
   - Consider upgrading to retain logs longer (GDPR recommends 1+ years)

**Key Reports to Review Weekly:**

**Login Report (Security Critical):**
```
Reports → Audit and investigation → Log events
Filter by: "Login" events
Look for:
- Login failures from unknown IP addresses
- Logins outside business hours (9pm-6am)
- Logins from unusual countries/locations
- Multiple failed attempts followed by success
```

**Admin Activity Report:**
```
Reports → Admin → Admin activity
Look for:
- New users added
- Password resets
- 2FA changes
- Privilege escalations
- Settings changes
```

**Drive Audit Report:**
```
Reports → Audit and investigation → Drive
Look for:
- Mass downloads
- External sharing
- File deletions
- Access by former staff
```

---

### Microsoft 365 (If Using)

**Enable Audit Logging:**

1. **Go to Security & Compliance Center**
   - security.microsoft.com

2. **Enable Audit Logging**
   - Audit → Audit log search
   - Click "Start recording user and admin activity"
   - May take a few hours to activate

3. **Set Retention**
   - Audit log retention: 90 days (default) or 1 year (with E5 license)

**Key Searches:**

**Failed Logins:**
```
Activity: UserLoginFailed
Look for: Repeated failures from same account
```

**Privilege Changes:**
```
Activity: Add member to role
Look for: Unexpected admin assignments
```

**Data Exfiltration:**
```
Activity: FileDownloaded, FileSyncDownloadedFull
Look for: Large volume downloads
```

---

### Cloud Storage (Google Drive / OneDrive)

**Monitor for:**
- Files shared externally
- Large downloads
- Access from new devices
- Unusual access times

**Google Drive Monitoring:**

1. **Admin Console → Apps → Google Workspace → Drive**
2. **View sharing settings**
3. **Review file exposure reports**

**Set Up Alerts:**

**Google Workspace Alert Rules:**

1. **Go to Security → Alert center**
2. **Click "View all alert rules"**
3. **Create Rule:**

```
Rule Name: Suspicious Login Activity
Conditions:
- Login from unusual location
- Multiple failed login attempts
- Impossible travel (login from 2 countries within hours)

Actions:
- Email admin immediately
- Severity: High
```

```
Rule Name: Privilege Escalation
Conditions:
- Admin role assigned
- User added to sensitive group

Actions:
- Email admin immediately
- Severity: Medium
```

```
Rule Name: Bulk Email Sent
Conditions:
- More than 100 emails sent in 1 hour
- Email forwarding rule created

Actions:
- Email admin daily summary
- Severity: Medium
```

---

### Password Manager (Bitwarden)

**What to Monitor:**
- Login attempts
- Device authorizations
- Emergency access uses
- Collection access

**Bitwarden Admin Console:**

1. **Organization Admin → Reporting**
2. **Review:**
   - Event logs
   - Member access
   - Vault health reports

**Set Up Alerts:**

```
Monitor for:
- Failed login attempts to organization vault
- New device authorizations
- Emergency access activations
- Exported vault data
```

---

### Website/Hosting

**If you have a website, monitor:**

**Google Analytics (Free):**
- Unusual traffic spikes
- Traffic from suspicious countries
- High bounce rates (possible attacks)

**Web Hosting Logs (cPanel/Hosting Dashboard):**
```
Access logs show:
- Failed login attempts to WordPress admin
- Suspicious file requests
- DDoS attempts
- SQL injection attempts

Check: cPanel → Metrics → Errors or Raw Access Logs
```

**WordPress (If Using):**

Install security plugin:
- **Wordfence** (free) — Login attempt monitoring, firewall
- **Sucuri Scanner** (free) — Malware scanning, security alerts

**Monitor:**
- Failed WordPress login attempts
- File changes
- Plugin installations
- Admin account creations

---

### Network/Router Logs

**Consumer/Small Business Routers:**

Most routers can log:
- Device connections
- Blocked connection attempts
- Bandwidth usage

**How to Enable:**

1. **Access router admin panel**
   - Usually 192.168.1.1 or 192.168.0.1
   - Check router manual

2. **Navigate to Logging/Administration**

3. **Enable logging**
   - Local logging (stored on router)
   - Remote logging (if supported)

**What to Look For:**
- Unknown devices connecting
- Connection attempts to blocked ports
- Unusual traffic patterns
- Multiple failed authentication attempts

---

## Step 2: Set Up Security Alerts

### Free Alerting Options

**Option 1: Google Workspace Alert Center (Free)**
- Built-in alerts for suspicious activity
- Email notifications to admins
- Daily/weekly summaries

**Option 2: Have I Been Pwned (Free)**

Monitor if your organization appears in data breaches:

1. **Go to:** haveibeenpwned.com
2. **Sign up for:** "Notify me" with your domain
3. **Get alerts** when domain appears in breaches

**Option 3: Google Alerts (Free)**

Monitor web for mentions:

1. **Go to:** google.com/alerts
2. **Create alerts:**
   - "[YourOrgName] data breach"
   - "[YourOrgName] hacked"
   - "[Your domain] compromise"
3. **Frequency:** Daily or weekly

**Option 4: Vendor Status Pages**

Subscribe to status pages of critical vendors:
- Google Workspace Status: status.google.com/workspace
- Microsoft 365 Status: status.office365.com
- Your hosting provider status page

---

### Configure Email Alerts

**Critical Alerts (Immediate Email):**
- Failed login from new location
- Admin account created
- Email forwarding rule created
- Bulk data download
- Suspicious OAuth app authorization

**Daily Summary Alerts:**
- All login activity
- Password changes
- New device registrations
- Admin activity summary

**Weekly Summary:**
- Overall security posture
- Top accessed files
- Storage usage changes
- User activity summary

---

## Step 3: Log Review Procedures

### Weekly Security Review (15 minutes)

**Schedule:** Same day/time each week

**Checklist:**

```
WEEKLY SECURITY REVIEW
Date: ___________ Reviewer: ___________

GOOGLE WORKSPACE / MICROSOFT 365
☐ Review login failures (Reports → Login)
   - Count: _______ Any suspicious? ☐ Yes ☐ No
   - If yes, investigate: ___________________

☐ Review admin activity (Reports → Admin)
   - Any unexpected changes? ☐ Yes ☐ No
   - If yes, what: ___________________

☐ Review drive/file access (Reports → Drive/Audit)
   - Large downloads? ☐ Yes ☐ No
   - External sharing? ☐ Yes ☐ No

☐ Check alert center for new alerts
   - Alerts this week: _______
   - Action taken: ___________________

PASSWORD MANAGER (Bitwarden)
☐ Review organization event logs
   - Any anomalies? ☐ Yes ☐ No

☐ Check vault health report
   - Reused passwords: _______
   - Weak passwords: _______
   - Action: ___________________

WEBSITE (If Applicable)
☐ Review hosting error logs
   - Failed admin logins: _______
   - Any suspicious requests? ☐ Yes ☐ No

☐ Check Google Analytics for anomalies
   - Unusual traffic sources: ___________________

SECURITY NEWS
☐ Check for breaches affecting your vendors
   - Any alerts from Have I Been Pwned? ☐ Yes ☐ No
   - Any vendor security advisories? ☐ Yes ☐ No

FOLLOW-UP ACTIONS
☐ _____________________________________________
☐ _____________________________________________

Next Review: ___________
```

### Monthly Deep Dive (1 hour)

**Monthly Security Audit:**

```
MONTHLY SECURITY AUDIT
Date: ___________ Auditor: ___________

ACCESS REVIEW
☐ Review all user accounts
   - Active users: _______
   - Disabled accounts: _______
   - Any that should be disabled? ☐ Yes ☐ No

☐ Review admin privileges
   - Current admins: _______
   - All still needed? ☐ Yes ☐ No

☐ Review shared drives/folders
   - External shares: _______
   - All legitimate? ☐ Yes ☐ No

☐ Review Bitwarden collections
   - Access appropriate? ☐ Yes ☐ No

LOG ANALYSIS
☐ Export and review 30 days of login logs
   - Pattern analysis: ___________________
   - Any red flags? ☐ Yes ☐ No

☐ Review OAuth/app authorizations
   - Third-party apps with access: _______
   - All still needed? ☐ Yes ☐ No
   - Revoke unnecessary: ___________________

☐ Review email forwarding rules
   - Rules in place: _______
   - All legitimate? ☐ Yes ☐ No

DEVICE REVIEW
☐ Review active devices
   - Authorized devices: _______
   - Any unknown devices? ☐ Yes ☐ No
   - Remove inactive devices: _______

VENDOR SECURITY
☐ Check vendor security advisories
   - Any critical updates needed? ☐ Yes ☐ No

☐ Review vendor breach notifications
   - Any incidents this month? ☐ Yes ☐ No

POLICY COMPLIANCE
☐ Check password policy compliance
   - Users with weak passwords: _______
   - Reminder sent: ☐ Yes ☐ No

☐ Verify 2FA enrollment
   - Without 2FA: _______
   - Action taken: ___________________

FINDINGS
_________________________________________________________________
_________________________________________________________________

ACTION ITEMS
☐ _____________________________________________ Due: _______
☐ _____________________________________________ Due: _______
☐ _____________________________________________ Due: _______

Next Audit: ___________
```

---

## Step 4: Log Retention Policy

### Compliance Requirements

**GDPR Recommendation:**
- Security logs: 1-2 years
- Access logs: 1-2 years
- Authentication logs: 1-2 years

**IRS Requirements (US):**
- Financial system access logs: 7 years
- General security logs: Minimum 1 year recommended

**Best Practice:**
- Critical security logs: 2+ years
- General activity logs: 1 year
- System logs: 90 days

### Retention Schedule

```
LOG RETENTION SCHEDULE

LOG TYPE                    RETENTION PERIOD    STORAGE LOCATION
────────────────────────────────────────────────────────────────────
Google Workspace Admin      2 years            Google (export monthly)
Google Workspace Login      2 years            Google (export monthly)
Microsoft 365 Audit         1-2 years          Microsoft (export if <1yr)
Bitwarden Events            1 year             Bitwarden (export quarterly)
Website Access Logs         90 days            Hosting provider
Router Logs                 90 days            Router/External storage
Email Security (DMARC)      1 year             DMARC reporting service
Backup Logs                 2 years            Local/cloud storage

EXPORT PROCEDURES
────────────────────────────────────────────────────────────────────
Monthly (1st of month):
☐ Export Google Workspace admin logs
☐ Export login reports
☐ Save to secure storage

Quarterly:
☐ Export Bitwarden event logs
☐ Archive to long-term storage

Annually:
☐ Review retention compliance
☐ Purge logs past retention period
☐ Archive important security events permanently
```

---

## Step 5: Detecting Common Threats

### Indicator of Compromise (IOC) Checklist

**Signs of Account Compromise:**

```
ACCOUNT COMPROMISE INDICATORS

☐ Login from unusual location/country
☐ Login at unusual time (3am on Sunday)
☐ Multiple failed logins then success
☐ Login from unfamiliar device
☐ Password changed unexpectedly
☐ Email forwarding rule created
☐ Reply-to address changed
☐ Bulk emails sent
☐ OAuth apps authorized without knowledge
☐ Files shared externally suddenly
☐ Large data downloads
☐ Admin privileges granted unexpectedly

IF YOU SEE THESE:
1. Disable account immediately
2. Force password reset
3. Review all activity from past 7 days
4. Check for email forwarding rules
5. Remove unauthorized OAuth apps
6. Notify incident response team
```

**Signs of Insider Threat:**

```
INSIDER THREAT INDICATORS

☐ Accessing data outside normal duties
☐ Accessing data before departure
☐ Downloading large amounts of data
☐ Accessing systems outside work hours
☐ Sharing files externally
☐ Printing sensitive documents excessively
☐ Taking photos of screens
☐ Attempting to access unauthorized areas
☐ Bypassing security controls
☐ Disabling security features
☐ Refusing to follow security procedures

IF YOU SEE THESE:
1. Document the activity
2. Review access logs
3. Consult with leadership/HR
4. Limit access if justified
5. Preserve evidence
6. Consider monitoring more closely
```

**Signs of Data Exfiltration:**

```
DATA EXFILTRATION INDICATORS

☐ Large file downloads (GBs)
☐ Mass file access in short time
☐ Exporting contact lists
☐ Emailing files to personal accounts
☐ Uploading to personal cloud storage
☐ USB device usage (if logged)
☐ Printing large volumes
☐ Screenshots of sensitive data
☐ Access from unapproved devices
☐ Copying to external drives

IF YOU SEE THESE:
1. Disable data access immediately
2. Review what was accessed
3. Determine if data was sensitive
4. Assess scope of exposure
5. Initiate incident response if breach confirmed
```

---

## Step 6: Incident Detection Workflow

### Automated Detection

**Set Up These Automated Checks:**

**Daily (Automated Reports):**
- Failed login summary
- New device registrations
- Admin activity summary
- Large file transfers

**Weekly (Manual Review):**
- Full login report review
- OAuth app audit
- External sharing review
- Security alert review

**Monthly (Deep Analysis):**
- Pattern analysis
- Access review
- Compliance check
- Policy enforcement

### Manual Investigation

**When You Detect Suspicious Activity:**

```
INVESTIGATION CHECKLIST

STEP 1: PRESERVE EVIDENCE
☐ Take screenshots of suspicious activity
☐ Export relevant logs immediately
☐ Note exact date/time of detection
☐ Document who detected it

STEP 2: ASSESS SCOPE
☐ What account/system is involved?
☐ When did the activity start?
☐ What data was accessed?
☐ How many records affected?
☐ Was any data exfiltrated?

STEP 3: CHECK FOR INDICATORS
☐ Review past 30 days of logs for this account
☐ Check for related accounts affected
☐ Look for similar patterns in other accounts
☐ Review email rules, forwarding, auto-replies
☐ Check OAuth authorizations

STEP 4: DETERMINE IMPACT
☐ Was sensitive data accessed? ☐ Yes ☐ No
☐ Was data downloaded/shared? ☐ Yes ☐ No
☐ Could this affect donors/volunteers? ☐ Yes ☐ No
☐ Is this ongoing or historical? ☐ Ongoing ☐ Historical

STEP 5: DOCUMENT FINDINGS
☐ Write incident summary
☐ Save all evidence
☐ Timeline of events
☐ Recommended actions

STEP 6: ESCALATE IF NEEDED
☐ Notify incident commander if confirmed breach
☐ Contact legal if regulatory notification required
☐ Engage cyber insurance if applicable
```

---

## Free Monitoring Tools

### Essential Free Tools

**1. Google Workspace (Included)**
- Admin console reports
- Alert center
- Security dashboard

**2. Have I Been Pwned (Free)**
- Domain breach monitoring
- Email alerts
- Historical breach lookup

**3. Google Alerts (Free)**
- Web monitoring
- Brand mentions
- Breach notifications

**4. VirusTotal (Free)**
- Check suspicious files/URLs
- Hash analysis
- Reputation checking

**5. URLVoid (Free)**
- Website reputation checking
- Blocklist checking
- Phishing detection

### Monitoring Calendar

```
SECURITY MONITORING CALENDAR

DAILY (5 minutes)
☐ Check email for security alerts
☐ Review Google Alert notifications
☐ Check vendor status pages

WEEKLY (15 minutes)
☐ Review login failures
☐ Check admin activity
☐ Review file access logs
☐ Check Have I Been Pwned

MONTHLY (1 hour)
☐ Full access review
☐ Export and archive logs
☐ Review OAuth apps
☐ Check compliance metrics
☐ Update monitoring procedures

QUARTERLY (2 hours)
☐ Deep log analysis
☐ Pattern review
☐ Policy compliance audit
☐ Update alert thresholds
☐ Security metrics report
```

---

## Compliance Documentation

### Log Review Evidence

**For Audits/Compliance, Document:**

```
LOG REVIEW EVIDENCE LOG

Date Range: _______ to _______
Reviewer: _________________

SYSTEMS REVIEWED:
☐ Google Workspace Login Logs
☐ Google Workspace Admin Logs
☐ Drive Audit Logs
☐ Bitwarden Event Logs
☐ Website Access Logs
☐ Other: ___________________

FINDINGS:
☐ No significant findings
☐ Findings identified (see below)

FINDINGS DETAILS:
_________________________________________________________________
_________________________________________________________________

ACTIONS TAKEN:
_________________________________________________________________
_________________________________________________________________

EVIDENCE LOCATION:
Logs stored at: ___________________
Retention: ___________________

Reviewed By: _________________ Date: _______
Verified By: _________________ Date: _______
```

### Audit Trail Best Practices

**Always:**
- ✅ Review logs regularly (weekly minimum)
- ✅ Document findings
- ✅ Take action on anomalies
- ✅ Preserve evidence of compliance
- ✅ Keep logs for required retention period
- ✅ Limit access to logs to authorized personnel

**Never:**
- ❌ Delete logs before retention period
- ❌ Ignore security alerts
- ❌ Skip weekly reviews
- ❌ Let only one person have access to logs
- ❌ Store logs only in one location

---

## Quick Start Guide

**If you only have 30 minutes:**

1. **Enable Google Workspace audit logs** (10 min)
   - Go to admin.google.com
   - Reports → Audit and investigation
   - Verify logging is enabled

2. **Set up Have I Been Pwned monitoring** (5 min)
   - Go to haveibeenpwned.com
   - Sign up with your domain

3. **Create Google Alerts** (5 min)
   - Set up alerts for your org name + "breach"
   - Set up alerts for your domain

4. **Schedule weekly review** (5 min)
   - Put 15 minutes on calendar every week
   - Use the weekly checklist above

5. **Export one report** (5 min)
   - Practice exporting a login report
   - Save it to your secure location

**You now have basic security monitoring in place!**

---

## Resources

**Related Documents:**
- **[incident-response-plan.md](./incident-response-plan.md)** — Responding to detected threats
- **[vendor-security-assessment.md](./vendor-security-assessment.md)** — Monitoring vendor security
- **[compliance-quick-guide.md](./compliance-quick-guide.md)** — Compliance log retention requirements

**Useful Links:**
- [Google Workspace Admin Help - Reports](https://support.google.com/a/answer/45897)
- [Microsoft 365 Security Documentation](https://docs.microsoft.com/en-us/microsoft-365/security/)
- [NIST Guide to Computer Security Log Management](https://csrc.nist.gov/publications/detail/sp/800-92/final)

---

**Remember:** Monitoring doesn't prevent attacks, but it helps you detect them early and respond effectively. The best security monitoring is consistent, not complex.

**[← Back to Keep Good Records](./README.md)**
