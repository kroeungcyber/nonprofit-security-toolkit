# 🛡️ Stop Phishing Attacks

**Set up email authentication to prevent scammers from impersonating your organization.**

---

## Why This Matters

**The Problem:** Anyone can send an email that looks like it came from your organization. Scammers do this to:
- Trick donors into sending money to fake accounts
- Impersonate your leadership to volunteers
- Damage your reputation
- Get past spam filters

**The Solution:** Three email authentication technologies — SPF, DKIM, and DMARC — prove that emails actually came from you.

**Real Impact:** Organizations with DMARC see 95%+ reduction in email spoofing attempts.

---

## What You'll Accomplish

- ✅ Understand what SPF, DKIM, and DMARC do (in plain English)
- ✅ Set up email authentication for your domain
- ✅ Monitor for spoofing attempts
- ✅ Protect your organization's reputation

**Time:** 1-2 hours  
**Cost:** $0  
**Technical skill needed:** Low (you'll work with your domain provider)

---

## What Are SPF, DKIM, and DMARC?

Don't let the acronyms scare you. Here's what they do in simple terms:

### SPF (Sender Policy Framework)

**What it does:** Says "only these mail servers are allowed to send email for our domain."

**Analogy:** It's like giving your mail carrier a list of approved post offices. If mail comes from somewhere else, it's rejected.

**Example:** If you use Google Workspace, SPF tells the world "only Google's mail servers can send email for @yourorg.org"

---

### DKIM (DomainKeys Identified Mail)

**What it does:** Adds a digital signature to prove the email hasn't been changed.

**Analogy:** It's like a tamper-evident seal on a medicine bottle. If the seal is broken, you know someone opened it.

**Example:** When you send an email, DKIM adds an invisible signature. When someone receives it, their email system checks the signature to confirm it's authentic.

---

### DMARC (Domain-based Message Authentication)

**What it does:** Tells email providers what to do if SPF or DKIM checks fail, and sends you reports about spoofing attempts.

**Analogy:** It's like having a security guard who:
1. Checks IDs (SPF and DKIM)
2. Has instructions on what to do with suspicious people
3. Writes a report about who tried to get in

**Example:** "If an email claims to be from us but fails authentication, reject it. Also, send me a weekly report of all attempts."

---

## Do You Need This?

**Yes, if:**
- You send email from your own domain (like @yourorg.org)
- You use Google Workspace, Microsoft 365, or similar
- You care about your organization's reputation
- You want to protect donors from scammers

**You might not need this if:**
- You only use Gmail.com, Yahoo.com, or Outlook.com addresses
- (But you should still be aware of how it works!)

---

## Step 1: Check Your Current Setup (10 minutes)

Before making changes, see what's already configured.

### Use Online Tools

**Option 1: MXToolbox**
1. Go to [mxtoolbox.com/spf.aspx](https://mxtoolbox.com/spf.aspx)
2. Enter your domain (e.g., yourorg.org)
3. Click "SPF Record Lookup"
4. See if you have an SPF record

**Option 2: Google Admin Toolbox**
1. Go to [toolbox.googleapps.com/apps/checkmx](https://toolbox.googleapps.com/apps/checkmx)
2. Enter your domain
3. See your current email configuration

**What you're looking for:**
- SPF record exists (starts with "v=spf1")
- DKIM is configured (has DKIM signatures)
- DMARC record exists (starts with "v=DMARC1")

---

## Step 2: Set Up SPF (15 minutes)

### Find Your Email Provider's SPF Record

**Google Workspace:**
```
v=spf1 include:_spf.google.com ~all
```

**Microsoft 365:**
```
v=spf1 include:spf.protection.outlook.com ~all
```

**Other providers:** Check their documentation or ask their support

### Add the SPF Record to Your Domain

**You need to:** Add a TXT record to your domain's DNS settings.

**Who can do this:**
- Whoever manages your domain (GoDaddy, Namecheap, Cloudflare, etc.)
- Your web developer
- Your IT volunteer

**Instructions to give them:**

```
Please add this TXT record to our DNS:

Type: TXT
Name: @ (or leave blank, or enter your domain)
Value: v=spf1 include:_spf.google.com ~all
TTL: 3600 (or 1 hour)

Replace "include:_spf.google.com" with your email provider's SPF include.
```

**How to do it yourself (if you manage the domain):**

**GoDaddy:**
1. Log into GoDaddy
2. Go to My Products > DNS
3. Find your domain
4. Click "Manage DNS"
5. Click "Add" under Records
6. Select Type: TXT
7. Name: @
8. Value: (paste your SPF record)
9. TTL: 1 Hour
10. Save

**Cloudflare:**
1. Log into Cloudflare
2. Select your domain
3. Go to DNS > Records
4. Click "Add record"
5. Type: TXT
6. Name: @
7. Content: (paste your SPF record)
8. Save

**Namecheap:**
1. Log into Namecheap
2. Go to Domain List
3. Click "Manage" next to your domain
4. Go to Advanced DNS
5. Click "Add New Record"
6. Type: TXT Record
7. Host: @
8. Value: (paste your SPF record)
9. Save

### Verify SPF is Working

Wait 15-30 minutes for changes to take effect, then:

1. Send an email to a Gmail address
2. In Gmail, open the email
3. Click the three dots (More) > "Show original"
4. Look for "SPF: PASS"

---

## Step 3: Set Up DKIM (20 minutes)

DKIM requires generating a cryptographic key pair. The process varies by email provider.

### For Google Workspace

1. Go to [admin.google.com](https://admin.google.com)
2. Go to **Apps** > **Google Workspace** > **Gmail**
3. Click **Authenticate email**
4. Click **Generate new record**
5. Select your domain from the dropdown
6. Click **Generate**
7. You'll see a DNS Hostname and TXT record value

**Add this to your DNS:**
```
Type: TXT
Name: (the DNS Hostname from Google, usually something like google._domainkey)
Value: (the long TXT record value from Google)
TTL: 3600
```

8. Wait 1 hour
9. Go back to Google Admin
10. Click **Start authentication**
11. Status should change to "Authenticating email"

### For Microsoft 365

1. Go to [security.microsoft.com](https://security.microsoft.com)
2. Go to **Email & collaboration** > **DKIM**
3. Select your domain
4. Click **Create DKIM keys**
5. Follow the prompts to add DNS records
6. Enable DKIM signing

### Verify DKIM is Working

Send a test email to [mail-tester.com](https://www.mail-tester.com):

1. Go to mail-tester.com
2. Copy the unique email address shown
3. Send an email from your domain to that address
4. Click "Then check your score"
5. Look for DKIM: "DKIM signature test passed"

---

## Step 4: Set Up DMARC (20 minutes)

DMARC tells email providers what to do with emails that fail SPF or DKIM checks.

### Start with a Monitoring Policy

First, set DMARC to only monitor (don't reject anything yet). This lets you see what's happening without risking legitimate emails being blocked.

**Create this TXT record:**

```
Type: TXT
Name: _dmarc
Value: v=DMARC1; p=none; rua=mailto:dmarc@yourorg.org; ruf=mailto:dmarc@yourorg.org; fo=1
TTL: 3600
```

**What this means:**
- `v=DMARC1` — This is a DMARC record
- `p=none` — Just monitor, don't reject emails yet
- `rua=` — Where to send aggregate reports
- `ruf=` — Where to send forensic (detailed) reports
- `fo=1` — Report if either SPF or DKIM fails

**Change the email addresses** (`dmarc@yourorg.org`) to an address where you can receive reports.

### Add the DMARC Record

Add this TXT record to your DNS the same way you added SPF.

### Verify DMARC is Working

**Check with MXToolbox:**
1. Go to [mxtoolbox.com/DMARC.aspx](https://mxtoolbox.com/DMARC.aspx)
2. Enter your domain
3. Should show your DMARC record

**Send a test email:**
1. Send to a Gmail address
2. View original message
3. Look for "DMARC: PASS"

---

## Step 5: Monitor Reports (Ongoing)

DMARC sends you reports about emails claiming to be from your domain.

### What the Reports Tell You

**Aggregate reports (rua):**
- How many emails were sent from your domain
- How many passed/failed SPF
- How many passed/failed DKIM
- Which servers sent the emails

**Forensic reports (ruf):**
- Detailed information about specific failed emails
- Useful for investigating spoofing attempts

### Reading the Reports

Reports come as XML files. You can:

**Option 1: Read them manually** (hard — they're technical)

**Option 2: Use free DMARC report analyzers:**
- [dmarcian](https://dmarcian.com) — Free for low volume
- [EasyDMARC](https://easydmarc.com) — Free tier available
- [DMARC Analyzer](https://www.dmarcanalyzer.com)

**What to look for:**
- Emails you didn't send — These are spoofing attempts
- Legitimate services failing authentication — You need to add them to SPF

---

## Step 6: Increase Protection (After 2-4 Weeks)

Once you've monitored for a while and confirmed legitimate emails pass:

### Change DMARC to Quarantine

Update your DMARC record to:

```
v=DMARC1; p=quarantine; rua=mailto:dmarc@yourorg.org; pct=25
```

**What this does:**
- `p=quarantine` — Failed emails go to spam/junk
- `pct=25` — Only apply to 25% of failed emails (gradual rollout)

After a week with no problems, increase to `pct=50`, then `pct=100`.

### Eventually Change to Reject

For maximum protection:

```
v=DMARC1; p=reject; rua=mailto:dmarc@yourorg.org
```

**What this does:** Failed emails are completely rejected (not delivered at all).

⚠️ **Only do this after:**
- 4+ weeks of monitoring
- Confirming all legitimate emails pass
- Fixing any authentication issues

---

## Troubleshooting

### "I'm not receiving DMARC reports"

- Check that the email address in your DMARC record is correct
- Check spam/junk folders
- Some providers take a few days to start sending reports
- Make sure your email server accepts mail to that address

### "Legitimate emails are failing SPF"

You probably send email from services not in your SPF record:

**Common services to add:**
- Mailchimp: `include:servers.mcsv.net`
- Constant Contact: `include:ccsend.com`
- SendGrid: `include:sendgrid.net`
- Mailgun: `include:mailgun.org`

**Updated SPF example:**
```
v=spf1 include:_spf.google.com include:servers.mcsv.net ~all
```

### "DKIM keeps failing"

- Make sure you copied the entire key value (it's very long)
- Check that the DNS record name is exactly right
- Wait 24 hours for DNS to fully propagate
- In Google Workspace, click "Authenticate email" again

### "DMARC shows a lot of failed emails from servers I don't recognize"

These could be:
1. **Spoofing attempts** — This is what DMARC is catching! Good!
2. **Legitimate forwarding** — Some email forwards break authentication
3. **Third-party services** — Add them to SPF if they're legitimate

---

## Quick Reference

### DNS Records Summary

| Record | Type | Name | Value Example |
|--------|------|------|---------------|
| **SPF** | TXT | @ | `v=spf1 include:_spf.google.com ~all` |
| **DKIM** | TXT | google._domainkey | (long key from Google) |
| **DMARC** | TXT | _dmarc | `v=DMARC1; p=none; rua=mailto:dmarc@yourorg.org` |

### DMARC Policy Progression

| Stage | Policy | When to Use |
|-------|--------|-------------|
| **1. Monitor** | `p=none` | First 2-4 weeks — just watch |
| **2. Quarantine (25%)** | `p=quarantine; pct=25` | Gradual enforcement |
| **3. Quarantine (100%)** | `p=quarantine` | Full quarantine mode |
| **4. Reject** | `p=reject` | Maximum protection |

---

## How to Verify Everything Works

**Test with mail-tester.com:**
1. Send an email to their test address
2. Check your score
3. Look for: SPF ✅, DKIM ✅, DMARC ✅

**Test with Gmail:**
1. Send an email to a Gmail account
2. View original message
3. Look for: SPF: PASS, DKIM: PASS, DMARC: PASS

---

## Next Steps

- **[Incident Response Plan](../05-keep-good-records/incident-response-plan.md)** — What to do if a phishing or spoofing attack succeeds
- **[Volunteer Training Guide](./volunteer-training-guide.md)** — Teach your team about phishing

---

**[← Back to Secure Your Email](./README.md)**
