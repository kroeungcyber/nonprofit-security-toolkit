# 📧 Secure Your Email

**Stop phishing attacks and protect your organization's communications.**

---

## Why This Matters

Email is the #1 way attackers break into organizations. They send fake emails that look real to:
- Trick you into giving them your password
- Get you to send money to the wrong account
- Install viruses on your computer
- Steal donor information

**The average non-profit receives 5-10 phishing emails per week.**

**Real story:** A small animal rescue received an email that looked like it was from their bank. It said there was suspicious activity on their account and they needed to log in to verify. The email looked perfect — same logo, same colors. A volunteer clicked the link and entered their password. Within hours, $8,000 was transferred out of their account.

---

## What You'll Accomplish

- ✅ Set up email authentication to prevent spoofing
- ✅ Train volunteers to recognize phishing attempts
- ✅ Create a process for reporting suspicious emails
- ✅ Know what to do if someone clicks a bad link

**Time to implement:** 3-4 hours  
**Cost:** $0  
**Ongoing maintenance:** 15 minutes per quarter for training refreshers

---

## What's in This Section

1. **[Stop Phishing Attacks](./stop-phishing-attacks.md)** — Email authentication setup (SPF, DKIM, DMARC)
2. **[Volunteer Training Guide](./volunteer-training-guide.md)** — Teach your team to spot fake emails and what to do if one is clicked

---

## Quick Start: Minimum Viable Protection

If you only have 1 hour, do this:

1. **[Read the phishing guide](./volunteer-training-guide.md)** (30 min)
2. **Set up DMARC on your domain** — Contact whoever manages your domain name and ask them to add a DMARC record (see [stop-phishing-attacks.md](./stop-phishing-attacks.md) for details)

---

## The Complete Email Security System

### Phase 1: Prevent Spoofing (Week 1)
- ✅ Set up SPF record
- ✅ Set up DKIM signing
- ✅ Set up DMARC policy

### Phase 2: Train Your Team (Week 2)
- ✅ Conduct phishing awareness training
- ✅ Create reporting process
- ✅ Share examples of real phishing attempts

### Phase 3: Monitor & Respond (Ongoing)
- ✅ Check DMARC reports monthly
- ✅ Review and update training quarterly
- ✅ Respond quickly to any incidents

---

## What is Phishing?

**Simple explanation:** Phishing is when someone sends you a fake email pretending to be someone you trust, trying to trick you into:
- Giving them your password
- Sending them money
- Installing a virus
- Sharing private information

**Analogy:** It's like someone dressing up as your bank's security guard and asking for your ATM PIN. They look official, but they're trying to steal from you.

---

## Common Email Threats for Non-Profits

### 1. Credential Harvesting

**What it looks like:** An email that looks like it's from Gmail, Microsoft, or your bank asking you to "verify your account" or "update your password."

**The trap:** You click the link and enter your password on a fake website that looks real. The attacker now has your password.

**Red flags:**
- Urgent language: "Your account will be suspended!"
- Generic greeting: "Dear Customer" instead of your name
- Hover over links — the real URL doesn't match the text

### 2. Business Email Compromise (BEC)

**What it looks like:** An email that appears to be from your boss, board president, or treasurer asking you to:
- Send money urgently
- Buy gift cards
- Wire transfer funds
- Change banking information

**The trap:** The email looks like it's from a leader, so you follow the instructions without questioning.

**Red flags:**
- Urgent requests for money
- New procedures or changes to normal processes
- Slight differences in email address (jane@yourorg.org vs jane@your0rg.org with a zero)
- The sender says they're "in a meeting" and can't talk

### 3. Malicious Attachments

**What it looks like:** An email with an attachment that claims to be:
- An invoice
- A donation receipt
- A resume from a job applicant
- A document from a funder

**The trap:** You open the attachment and it installs malware on your computer.

**Red flags:**
- Unexpected attachments
- File types like .exe, .zip, .js, .scr
- The sender asks you to "enable macros" or "enable content"

### 4. Fake Donor Emails

**What it looks like:** An email from someone claiming to be a potential major donor who:
- Wants to make a large donation
- Needs you to click a link to "process the donation"
- Asks for your bank details to send funds

**The trap:** They're trying to steal your banking information or get you to click a malicious link.

**Red flags:**
- Donors don't usually email out of the blue with huge offers
- Requests to click unusual links
- Pressure to act quickly

---

## Tools We Use

| Tool | Purpose | Cost |
|------|---------|------|
| **SPF/DKIM/DMARC** | Prevent email spoofing | Free |
| **Google Workspace spam filters** | Block malicious emails | Free tier |
| **Phishing training materials** | Educate volunteers | Free (included here) |

---

## Measuring Success

After implementing this section, you should be able to say:
- ✅ "Our domain is protected against email spoofing"
- ✅ "Our volunteers can recognize and report phishing attempts"
- ✅ "We have a plan for responding to email security incidents"
- ✅ "We haven't had a successful phishing attack in the last quarter"

---

**[← Back to Main Menu](../README.md)**  
**[Next: Stop Phishing Attacks →](./stop-phishing-attacks.md)**
