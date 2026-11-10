# Case Study: Small Animal Rescue

## Organization Profile

| Attribute | Details |
|-----------|---------|
| **Organization Type** | Animal Rescue & Shelter |
| **Size** | 5 active volunteers, 10 occasional helpers |
| **Annual Budget** | $50,000 |
| **Tech Environment** | 3 laptops, 5 personal phones, shared email |
| **Location** | Small town, USA |
| **Website** | happytails.example.org |

---

## The Situation (Before)

### Security Audit Results

Sarah, the founder of Happy Tails Animal Rescue, knew their technology situation wasn't ideal, but she didn't realize how vulnerable they were until she completed the [Security Assessment](../SECURITY_ASSESSMENT.md).

**Critical Risk Areas:**

🔴 **Passwords & Accounts (5/6 Critical)**
- All volunteers used the same password for the shared email account
- Password was written on a sticky note on the reception desk
- No password manager
- No two-factor authentication anywhere
- Former volunteers still had the password

🔴 **Email Security (4/5 Critical)**
- No DMARC/SPF/DKIM configured
- Volunteers couldn't recognize phishing attempts
- No process for reporting suspicious emails
- info@happytails.example.org had been spoofed before

🟡 **Device Security (3/6 Needs Attention)**
- Laptops had passwords, but screens didn't lock automatically
- Automatic updates were turned off ("they were annoying")
- No encryption on any devices

🔴 **Backups (5/6 Critical)**
- No backup strategy
- Donor database only existed on one laptop
- 6 years of adoption records in one place

🟡 **Network (2/5 Needs Attention)**
- Office WiFi password was the shelter's name plus "123"
- Same network for staff and visitors

🟡 **Documentation (4/6 Needs Attention)**
- No asset inventory
- No vendor contact list
- No idea who had access to what

### The Incident That Sparked Change

A volunteer clicked a link in an email that looked like it was from their veterinary supplier. The email said "Your invoice is overdue — click here to pay." The volunteer entered the credit card info.

**Result:** $1,200 stolen, credit card compromised, hours spent canceling and reordering cards.

Sarah realized: *"If that had been our donor database or grant funds, we could have lost everything. We needed to get serious about security."*

---

## The Implementation

### Phase 1: Emergency Fixes (Week 1) — 2 hours

**Day 1: Password Lockdown (30 minutes)**
- Changed all shared passwords immediately
- Set up Bitwarden for the organization
- Created strong, unique passwords for:
  - Email accounts
  - Banking/PayPal
  - Social media
  - Veterinary supplier accounts

**Day 3: Enable 2FA on Critical Accounts (45 minutes)**
- Installed Google Authenticator on Sarah's phone
- Enabled 2FA on:
  - Primary Gmail account
  - PayPal (where donations come in)
  - Bank account
- Printed backup codes and stored in locked filing cabinet

**Day 5: Update Everything (30 minutes)**
- Ran Windows Update on all 3 laptops
- Enabled automatic updates
- Installed pending security patches
- Set screens to lock after 5 minutes

**Day 7: First Training Session (30 minutes)**
- All volunteers met for coffee
- Reviewed the [5 Red Flags of Phishing](../02-secure-your-email/volunteer-training-guide.md)
- Sarah shared the story of the credit card incident
- Gave everyone the printed [Phishing Protection Card](../02-secure-your-email/volunteer-training-guide.md)

### Phase 2: Core Security (Week 2-3) — 4 hours

**Email Security Setup (Week 2, 2 hours)**
Sarah worked with their web developer to add DNS records:
- Set up SPF record for Google Workspace
- Enabled DKIM signing
- Created DMARC policy (monitoring mode)
- Result: Could now see spoofing attempts in DMARC reports

**Device Hardening (Week 3, 1 hour)**
- Enabled Windows Defender on all laptops (was already on, just verified)
- Turned on Find My Device
- Set up Windows Hello (fingerprint) on 2 laptops that had the hardware
- Enabled BitLocker on the laptop with Windows Pro

**Simple Backup Strategy (Week 3, 1 hour)**
- Installed Google Drive for Desktop
- Synced Documents folder to Google Drive
- Exported donor database to CSV weekly (automated reminder)
- Bought a $60 external hard drive for local backup

### Phase 3: Documentation & Processes (Week 4) — 2 hours

**Created Asset Inventory (30 minutes)**
- Listed all laptops with serial numbers
- Recorded who had which device
- Added purchase dates and warranty info

**Vendor Contact Sheet (15 minutes)**
- Listed internet provider with account number
- Added veterinary suppliers
- Included bank contact info

**Onboarding Checklist (45 minutes)**
- Created checklist for new volunteers
- Included Bitwarden setup
- Added 2FA requirements
- Wrote down account access procedures

**Offboarding Checklist (30 minutes)**
- Process for removing access when volunteers leave
- Password change procedures
- Equipment return checklist

---

## Results (After 1 Month)

### Security Assessment Re-take

| Section | Before | After |
|---------|:------:|:-----:|
| Passwords & Accounts | 🚨 5/6 Critical | ✅ Strong |
| Email Security | 🚨 4/5 Critical | ✅ Strong |
| Device Security | 🟡 3/6 Needs Attention | ✅ Strong |
| Backups | 🚨 5/6 Critical | ✅ Strong |
| Network | 🟡 2/5 Needs Attention | ⚠️ 2/5 (WiFi password changed) |
| Documentation | 🟡 4/6 Needs Attention | ✅ Strong |

**Overall: From 4 Critical Risk areas to 0**

### Measurable Improvements

| Metric | Before | After |
|--------|:------:|:-----:|
| Shared passwords | 8 accounts | 0 accounts |
| 2FA coverage | 0% | 100% of admin accounts |
| Automatic updates | Disabled | Enabled on all devices |
| Backup coverage | 0% | 100% of critical data |
| Documented assets | 0% | 100% |
| Training completion | 0% | 100% of active volunteers |

### Cost Breakdown

| Item | Cost |
|------|:----:|
| Bitwarden (free tier) | $0 |
| Google Workspace (already had) | $0 |
| Google Authenticator | $0 |
| External hard drive | $60 |
| **Total** | **$60** |

**Time invested:** 8 hours total over 4 weeks

**Ongoing maintenance:** ~15 minutes per month

---

## Challenges & Solutions

### Challenge 1: "I Don't Want to Use My Phone for Work"

**The Problem:** One volunteer didn't want work 2FA codes on her personal phone.

**The Solution:** Created a simple system — Sarah (the founder) keeps backup codes for all accounts in the office safe. If someone doesn't want 2FA on their phone, they use backup codes when needed. Not ideal, but better than no 2FA.

### Challenge 2: Forgotten Master Password

**The Problem:** A volunteer forgot her Bitwarden master password after 2 weeks.

**The Solution:** She had to reset all her passwords and start over. Now every volunteer writes down their master password and stores it in a sealed envelope in their personal file (locked cabinet). They know they can get it if needed.

### Challenge 3: "This is Too Complicated"

**The Problem:** Two older volunteers struggled with Bitwarden.

**The Solution:** Sarah sat with each of them for 30 minutes one-on-one. She created a simple cheat sheet:

```
HOW TO LOG IN WITH BITWARDEN:
1. Click the blue shield in your browser
2. Click your email address
3. Bitwarden fills in the password automatically
4. Click "Sign In"

FORGOT YOUR MASTER PASSWORD?
Ask Sarah for the envelope in your file.
```

After the personal help, both volunteers were comfortable.

---

## What Worked Well

✅ **Starting small** — Week 1 was just password changes and 2FA. Not overwhelming.

✅ **Personal story** — Sharing the credit card incident made security real, not abstract.

✅ **Cheat sheets** — Printed one-page guides volunteers could keep at their desks.

✅ **One-on-one help** — Some people need personal attention, not group training.

✅ **Free tools** — No budget required meant no approval process.

---

## What They'd Do Differently

🔄 **Start with documentation** — Having an asset inventory from day one would have made setup faster.

🔄 **Train before the incident** — Waiting for a security incident to take action was risky.

🔄 **Get leadership buy-in first** — Sarah is the founder, so this was easy. For organizations with boards, getting approval upfront is important.

---

## Sarah's Advice to Other Non-Profits

> "I thought we were too small to be a target. We're not. That $1,200 we lost could have paid for a month of dog food. The security fixes we implemented cost $60 and maybe 8 hours total. It's the best investment we've made.
>
> Start with passwords and 2FA. Everything else can wait. Those two things would have prevented our credit card incident.
>
> And don't assume your volunteers will just 'get it.' Some people need you to sit with them. That's okay. Take the time."

---

## Next Steps for Happy Tails

Sarah's 6-month plan:
- [ ] Review and update all passwords (quarterly)
- [ ] DMARC policy upgrade from "monitor" to "quarantine"
- [ ] Volunteer refresher training
- [ ] Test backup restoration
- [ ] Security assessment re-take

---

**Questions about this case study?**  
Open an issue or contribute your own story!

**[← Back to Case Studies](./README.md)**
