# 📘 Implementation Playbook

**Step-by-step instructions to secure your non-profit in 13 hours over 3 weeks.**

---

## How to Use This Playbook

This playbook assumes you:
- Have no dedicated IT staff
- Have a budget of $0 (or close to it)
- Need to secure 5-20 volunteers/staff
- Use Google Workspace (free non-profit tier) or similar cloud email

**Each section includes:**
- ⏱️ **Time required**
- 💰 **Cost**
- 🎯 **What you'll accomplish**
- 📋 **Step-by-step instructions**
- ✅ **How to verify it worked**

---

## Week 1: Quick Wins (4 Hours Total)

These three tasks will eliminate 80% of your biggest security risks.

---

### Task 1: Take the Security Assessment (15 Minutes)

**Before you change anything, understand where you are.**

**What this does:** Gives you a baseline score and shows what to prioritize.

**Instructions:**
1. Open [SECURITY_ASSESSMENT.md](./SECURITY_ASSESSMENT.md)
2. Go through each section honestly
3. Count your results
4. Note your biggest risks (the "Critical Risk" items)

**How to verify:** You should have a list of 3-5 priority items to fix.

---

### Task 2: Deploy a Password Manager (1.5 Hours)

**Stop using weak, repeated passwords. Use a password manager instead.**

**What this does:** Stores all your passwords securely, so you only need to remember one strong master password. It can also generate strong passwords for you.

**Why Bitwarden:**
- Free for personal use
- Works on all devices (Windows, Mac, phones, tablets)
- Open source (security experts can verify it's safe)
- Easy to use for non-technical people

**Time:** 1.5 hours (30 min setup + 1 hour migrating passwords)  
**Cost:** $0  
**Difficulty:** Easy

**Step-by-Step Instructions:**

#### Step 2.1: Create Your Bitwarden Account (10 minutes)

1. Go to [bitwarden.com](https://bitwarden.com)
2. Click "Get Started"
3. Enter your email address (use your work email)
4. Create a **strong master password**:
   - At least 12 characters
   - Mix of uppercase, lowercase, numbers, symbols
   - Something memorable but not guessable
   - Example: `BlueCat$Jump2Sky!`
   - **Write this down and store it somewhere safe** — if you forget it, you lose everything
5. Click "Create Account"
6. Verify your email address

#### Step 2.2: Install Bitwarden on Your Computer (10 minutes)

**For Windows:**
1. Go to [bitwarden.com/download](https://bitwarden.com/download)
2. Download the Windows app
3. Run the installer
4. Log in with your email and master password
5. Install the browser extension:
   - Open Chrome, Edge, or Firefox
   - Go to your browser's extension store
   - Search "Bitwarden"
   - Click "Add to [Browser]"
   - Log in to the extension

**For Mac:**
1. Go to [bitwarden.com/download](https://bitwarden.com/download)
2. Download the Mac app
3. Open the downloaded file and drag Bitwarden to Applications
4. Open Bitwarden from Applications
5. Log in with your email and master password
6. Install the Safari/Chrome/Firefox extension (same as Windows)

#### Step 2.3: Install on Phones/Tablets (5 minutes)

1. Open your phone's app store (App Store for iPhone, Google Play for Android)
2. Search "Bitwarden"
3. Install the official Bitwarden app
4. Log in with your email and master password
5. Enable biometric unlock (fingerprint/face) for convenience

#### Step 2.4: Migrate Your Passwords (45 minutes)

**For each important account, do this:**

1. Log into the account normally (Google, Facebook, bank, etc.)
2. Change the password to a strong one:
   - In Bitwarden, click the **+** button
   - Enter the website name
   - Enter your username/email
   - Click the **password generator** icon (looks like a refresh symbol)
   - Set length to 20 characters
   - Click "Select"
   - Save the item in Bitwarden
3. Copy the new password from Bitwarden
4. Paste it into the website's "change password" form
5. Save the change

**Priority order:**
1. Email accounts (most important!)
2. Banking/financial accounts
3. Donor database or CRM
4. Social media accounts
5. Any other work-related accounts

**Don't try to do all at once.** Do 5-10 per day.

#### Step 2.5: Teach Volunteers (30 minutes per person)

For each volunteer who needs access:

1. Have them create their own Bitwarden account
2. Help them install on their devices
3. Show them how to:
   - Save a new password
   - Use the browser extension to auto-fill
   - Generate strong passwords
   - Use the password generator
4. Have them change their work email password using Bitwarden

**How to verify it worked:**
- ✅ You can log into Bitwarden on all your devices
- ✅ Your most important accounts now have unique, strong passwords (20+ characters)
- ✅ Volunteers can use Bitwarden to log into work accounts

---

### Task 3: Enable Two-Factor Authentication (2FA) (2 Hours)

**Add a second layer of security to your most important accounts.**

**What this does:** Even if someone steals your password, they can't log in without also having your phone.

**How it works:** When you log in, you enter your password AND a temporary code from your phone. The code changes every 30 seconds.

**Time:** 2 hours (setup + enrolling all accounts)  
**Cost:** $0  
**Difficulty:** Medium (requires installing an app on phones)

**What is 2FA?** Two-Factor Authentication means proving your identity two ways:
1. Something you know (your password)
2. Something you have (your phone with the code)

This is much safer than just a password.

**Step-by-Step Instructions:**

#### Step 3.1: Install an Authenticator App (10 minutes)

We recommend **Aegis** (Android) or **TOTP** built into iOS password manager.

**For iPhone (iOS 15+):**
1. You can use the built-in authenticator in Passwords settings
2. Or install **Google Authenticator** from the App Store

**For Android:**
1. Install **Aegis Authenticator** from Google Play Store
2. Open Aegis
3. Follow the setup wizard
4. Set a password or biometric lock

#### Step 3.2: Enable 2FA on Your Most Important Accounts (1.5 hours)

Do these in order of importance:

##### Google Workspace / Gmail (30 minutes)

1. Go to [myaccount.google.com](https://myaccount.google.com)
2. Click "Security" on the left
3. Under "Signing in to Google," click "2-Step Verification"
4. Click "Get Started"
5. Enter your password
6. Follow the prompts to add your phone number (backup method)
7. When asked for method, choose "Authenticator app"
8. Open your authenticator app on your phone
9. Tap "Add" or the + button
10. Scan the QR code shown on your computer screen
11. Enter the 6-digit code from your phone into Google
12. Save the backup codes somewhere safe (print them!)
13. Click "Turn On"

**Repeat for all Google Workspace accounts in your organization.**

##### Banking / Financial Accounts (20 minutes)

1. Log into your online banking
2. Look for "Security Settings" or "Two-Factor Authentication"
3. Enable it
4. Choose "Authenticator app" as the method (not SMS if possible)
5. Scan the QR code with your authenticator app
6. Enter the code to verify

##### Donor Database / CRM (15 minutes)

1. Log into your donor management system
2. Find security or account settings
3. Look for 2FA or two-step verification
4. Enable it using your authenticator app

##### Other Important Accounts (15 minutes)

Enable 2FA on these if available:
- Facebook/Meta Business Manager
- Twitter/X
- Instagram
- PayPal
- Stripe
- Any cloud storage (Dropbox, OneDrive)

#### Step 3.3: Store Backup Codes (10 minutes)

**Critical:** When you set up 2FA, most services give you "backup codes."

These are one-time use codes that let you log in if you lose your phone.

**What to do:**
1. Save these codes in Bitwarden
2. Print them and store in a locked drawer
3. Do NOT store them only on your phone (in case phone breaks)

**How to verify it worked:**
- ✅ Try logging out and back into your email — you should be asked for a code from your phone
- ✅ Check that backup codes are stored somewhere safe
- ✅ All admin accounts have 2FA enabled

---

## Week 2: Protect Your Data (3 Hours Total)

---

### Task 4: Secure Your Devices (2 Hours)

**Harden computers and phones against attacks.**

**What this does:** Makes it much harder for malware to infect your devices and for unauthorized people to access them.

See detailed guides:
- [Windows Laptop Security](./03-protect-your-devices/windows-laptop-security.md)
- [Device Security Overview](./03-protect-your-devices/) — includes Mac and phone key steps

**Quick Checklist (all devices):**
- [ ] Automatic updates enabled
- [ ] Built-in antivirus enabled (Windows Defender, Gatekeeper)
- [ ] Screen lock with password/PIN enabled
- [ ] Screen locks after 5 minutes of inactivity
- [ ] Find My Device / Find My Mac enabled

---

### Task 5: Set Up Automated Backups (1 Hour)

**Ensure you can recover from ransomware, theft, or hardware failure.**

**What this does:** Creates copies of your important files in multiple places, so you never lose them.

See: [Backup Your Data](./04-backup-your-data/) — the 3-2-1 rule and backup tooling

**The 3-2-1 Rule:**
- **3** copies of important data
- **2** different types of storage (computer + cloud)
- **1** copy off-site (cloud storage)

**Free tools:**
- Google Drive / Google Workspace (already have)
- rclone (free backup automation)
- Built-in backup tools (Windows Backup, Time Machine)

---

## Week 3: Documentation, Compliance & Training (6 Hours Total)

---

### Task 6: Create an Asset Inventory (1 Hour)

**Know what technology you have and who has access.**

See: [Asset Tracking Template](./05-keep-good-records/asset-tracking-template.md)

**What to track:**
- All computers, phones, tablets
- Who uses what
- Purchase dates and warranty info
- What software is installed

---

### Task 7: Ensure Privacy Compliance (2 Hours)

**Protect your organization from data protection fines and maintain donor trust.**

See: 
- [Compliance Quick Guide](./05-keep-good-records/compliance-quick-guide.md)
- [Incident Response Plan](./05-keep-good-records/incident-response-plan.md)

**Key actions:**
1. **Create privacy notice** — Post on your website and donation pages
2. **Document data retention** — How long to keep donor/volunteer records
3. **Get vendor agreements** — Data Processing Agreements from critical vendors
4. **Prepare for breaches** — 72-hour notification procedures (GDPR requirement)

**Documents to create:**
- Privacy policy (use template in compliance guide)
- Data retention schedule
- Data breach response plan
- Vendor security assessments

---

### Task 8: Train Your Volunteers (2 Hours)

**Your security is only as strong as your least careful volunteer.**

See: [Volunteer Training Guide](./02-secure-your-email/volunteer-training-guide.md)

**Training topics:**
- How to recognize phishing emails
- Password best practices
- What to do if you click something suspicious
- How to report security incidents

---

### Task 9: Set Up Security Monitoring (1 Hour)

**Detect threats early through logging and alerts.**

See: [Security Monitoring Guide](./05-keep-good-records/security-monitoring-guide.md)

**Key actions:**
1. **Enable audit logs** — Google Workspace/Microsoft 365 logging
2. **Set up alerts** — Have I Been Pwned, Google Alerts for your domain
3. **Create review schedule** — Weekly 15-minute security review
4. **Export first reports** — Practice reviewing login and admin logs

**Ongoing:**
- Weekly: Review login failures and admin activity (15 min)
- Monthly: Deep dive into access patterns and OAuth apps (1 hour)
- Quarterly: Full audit and log archive (2 hours)

---

### Task 10: Secure Your Physical Space (2 Hours)

**Protect equipment and paper records from theft and unauthorized access.**

See: [Physical Security Guide](./05-keep-good-records/physical-security-guide.md)

**Key actions:**
1. **Control access** — Inventory keys, consider keypad/smart lock
2. **Protect equipment** — Cable locks for laptops, secure storage
3. **Secure documents** — Lockable filing cabinets, clean desk policy
4. **Safe disposal** — Cross-cut shredder for sensitive papers
5. **Emergency preparedness** — Create emergency action plan

**Quick wins:**
- Install motion-activated lights ($30)
- Implement visitor sign-in log
- Purchase cable locks for laptops ($20 each)
- Set up shred bin system

---

## 📋 Weekly Checklist

### Week 1
- [ ] Take Security Assessment
- [ ] Deploy Bitwarden password manager
- [ ] Enable 2FA on Google Workspace
- [ ] Enable 2FA on banking/financial accounts

### Week 2
- [ ] Harden all Windows/Mac computers
- [ ] Secure all mobile devices
- [ ] Set up automated backups
- [ ] Test restoring a file from backup

### Week 3
- [ ] Complete asset inventory
- [ ] Document all software/services
- [ ] Create privacy notice and data retention policy
- [ ] Get Data Processing Agreements from critical vendors
- [ ] Create incident response and data breach plan
- [ ] Set up security monitoring and log review schedule
- [ ] Secure physical office space
- [ ] Conduct volunteer security training

---

## 🎉 You're Done! What's Next?

After completing this playbook:

1. **Re-take the Security Assessment** — You should see a big improvement
2. **Schedule quarterly reviews** — Check that everything is still working
3. **Onboard new volunteers** using the checklists in [01-protect-your-people/](./01-protect-your-people/)
4. **Stay updated** — Follow the [case studies](./case-studies/) for new threats and solutions

---

## 🆘 Troubleshooting Common Issues

**"I forgot my Bitwarden master password"**
- Unfortunately, Bitwarden cannot recover this
- This is why we told you to write it down and store it safely
- You'll need to create a new account and reset all your passwords

**"My 2FA codes aren't working"**
- Check that your phone's time is set to automatic
- Make sure you're entering the code before it expires (30 seconds)
- Use a backup code to log in, then re-setup 2FA

**"A volunteer left and we can't access their account"**
- This is why offboarding procedures are important
- Contact the service provider (Google, etc.) with proof of organization ownership
- Prevent this: always have admin accounts separate from personal accounts

**"This is overwhelming — where do I start?"**
- Do Task 1 (assessment) first
- Then just do Task 2 (password manager)
- Wait a week, then do Task 3 (2FA)
- Take breaks between tasks

---

**[← Back to Security Assessment](./SECURITY_ASSESSMENT.md)**  
**[Next: Protect Your People →](./01-protect-your-people/)**
