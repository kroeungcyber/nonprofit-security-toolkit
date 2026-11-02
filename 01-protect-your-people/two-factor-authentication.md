# 🔑 Two-Factor Authentication (2FA)

**Add a second layer of security to your most important accounts.**

---

## Why This Matters

**The Problem:** Passwords can be stolen. Hackers might:
- Trick you into giving them your password (phishing)
- Buy stolen passwords from data breaches
- Guess weak passwords

**The Solution:** Two-factor authentication (2FA) requires **something you know** (password) AND **something you have** (your phone). Even if someone steals your password, they can't log in without your phone.

**Real Impact:** 2FA blocks 99.9% of automated attacks.

---

## What You'll Accomplish

- ✅ Understand what 2FA is and why it matters
- ✅ Install an authenticator app on your phone
- ✅ Enable 2FA on your email, banking, and work accounts
- ✅ Store backup codes safely

**Time:** 60-90 minutes  
**Cost:** $0  
**Difficulty:** Medium

---

## What is Two-Factor Authentication?

**Simple explanation:** It's like an ATM. You need two things to get money:
1. Your bank card (something you have)
2. Your PIN (something you know)

Online accounts work the same way with 2FA:
1. Your password (something you know)
2. A code from your phone (something you have)

**Analogy:** Imagine your email is your house. A password is like your house key. 2FA is like adding a security guard who checks your ID before letting you in — even if someone steals your key, they can't get past the guard without your ID.

---

## Types of 2FA

There are several ways to do 2FA. Here's what we recommend for non-profits:

| Method | Security Level | Cost | Our Recommendation |
|--------|---------------|------|-------------------|
| **Authenticator App** (Aegis, Google Authenticator) | High | Free | ✅ **Use this** — Works offline, no phone number needed |
| **SMS/Text Message** | Medium | Free | ⚠️ Acceptable backup method, but not primary — Can be intercepted |
| **Hardware Key** (YubiKey) | Highest | $20-50 each | 💰 Optional upgrade for admin accounts — Not necessary for most volunteers |
| **Email Codes** | Low | Free | ❌ Don't use — If email is hacked, this is useless |

**Our advice:** Use an **authenticator app** as your primary method. Add **SMS as a backup** in case you lose your phone.

---

## Step 1: Install an Authenticator App (10 minutes)

An authenticator app generates temporary codes on your phone. These codes change every 30 seconds.

### For iPhone (iOS)

**Option A: Built-in Passwords App (iOS 15+)**
1. Open **Settings**
2. Tap **Passwords**
3. Tap **Password Options**
4. Turn on **AutoFill Passwords**
5. The built-in authenticator is now active

**Option B: Google Authenticator (More universal)**
1. Open the **App Store**
2. Search **"Google Authenticator"**
3. Install the app (Google LLC)
4. Open the app
5. Tap **"Get Started"**
6. Tap **"Add an account"**

### For Android

We recommend **Aegis Authenticator** — it's open source, secure, and works offline.

1. Open **Google Play Store**
2. Search **"Aegis Authenticator"**
3. Install the app (by Beem Development)
4. Open Aegis
5. Tap **"Let's get started"**
6. Set a password or enable biometric unlock
7. Tap the **+** button to add your first account

**Why Aegis instead of Google Authenticator?**
- Your codes are encrypted
- You can back up your accounts
- Works completely offline
- Open source (security experts can verify it's safe)

---

## Step 2: Enable 2FA on Google Workspace/Gmail (20 minutes)

Your email is the most important account to protect. If someone gets into your email, they can:
- Reset passwords for other accounts
- Read sensitive communications
- Impersonate you to donors and volunteers

### Setup Instructions

1. Go to [myaccount.google.com](https://myaccount.google.com)
2. Click **"Security"** on the left side
3. Under **"How you sign in to Google,"** click **"2-Step Verification"**
4. Click **"Get Started"**
5. Enter your Google password
6. **Set up a backup method first:**
   - Enter your phone number
   - Choose **"Text message"** or **"Phone call"**
   - Google will send you a code
   - Enter the code to verify

### Add Authenticator App

7. On the 2-Step Verification page, scroll down to **"Authenticator app"**
8. Click **"Set up authenticator"**
9. Choose your phone type (**iPhone** or **Android**)
10. Click **"Next"**
11. **Open your authenticator app on your phone**
12. Tap the **+** or **"Add"** button
13. Choose **"Scan a QR code"**
14. Point your phone camera at the QR code on your computer screen
15. Your app will show a 6-digit code
16. Enter that code on your computer
17. Click **"Verify"**
18. Click **"Done"**

### Save Your Backup Codes

19. On the 2-Step Verification page, find **"Backup codes"**
20. Click **"Show codes"** or **"Get new codes"**
21. You'll see 10 backup codes
22. **Print these or write them down**
23. Store them somewhere safe (locked drawer, with other important documents)
24. **Never store them only on your phone** — you need these if you lose your phone
25. Click **"I understand"**

---

## Step 3: Enable 2FA on Other Important Accounts (40 minutes)

Repeat the process for these accounts, in order of importance:

### Banking & Financial (15 minutes)

1. Log into your online banking
2. Look for **"Security,"** **"Settings,"** or **"Profile"**
3. Find **"Two-Factor Authentication,"** **"2FA,"** or **"Two-Step Verification"**
4. Enable it
5. Choose **"Authenticator app"** as your primary method
6. Scan the QR code with your authenticator app
7. Enter the code to verify
8. Save backup codes if provided

**Do this for:**
- Business bank accounts
- PayPal
- Stripe
- Investment accounts
- Credit cards (if they offer 2FA)

### Donor Database / CRM (10 minutes)

Popular non-profit CRMs that support 2FA:
- **Salesforce Nonprofit Success Pack**
- **Bloomerang**
- **DonorPerfect**
- **Little Green Light**
- **Neon CRM**

1. Log into your CRM
2. Go to **Settings** or **Profile**
3. Find **Security** or **Two-Factor Authentication**
4. Enable 2FA using your authenticator app
5. Save backup codes

### Social Media Accounts (10 minutes)

**Facebook:**
1. Settings > Security and Login > Two-Factor Authentication
2. Use authenticator app

**Instagram:**
1. Settings > Security > Two-Factor Authentication
2. Use authenticator app

**Twitter/X:**
1. Settings > Security and account access > Security > Two-factor authentication
2. Use authenticator app

**LinkedIn:**
1. Settings > Account preferences > Two-step verification
2. Use authenticator app

### Cloud Storage (5 minutes)

**Dropbox:**
1. Settings > Security > Two-step verification

**OneDrive (Microsoft):**
1. Account > Security > Advanced security options > Two-step verification

**Box:**
1. Account Settings > Authentication

---

## Step 4: Organize Your Accounts (10 minutes)

As you add accounts to your authenticator app, they can get disorganized. Here's how to keep track:

### In Your Authenticator App

**Rename accounts to be clear:**
- Instead of: "john@gmail.com"
- Use: "Work Email (Gmail)"
- Or: "Animal Rescue - Email"

**Use icons/colors if your app supports it:**
- Red for financial accounts
- Blue for email
- Green for social media

### Create a List

Keep a simple list of which accounts have 2FA enabled:

```
2FA-ENABLED ACCOUNTS

Email:
☑ john@example.org (Google)
☑ info@example.org (Google)

Financial:
☑ Chase Business Checking
☑ PayPal
☑ Stripe

CRM/Database:
☑ Bloomerang

Social Media:
☑ Facebook
☑ Instagram

Cloud Storage:
☑ Google Drive

BACKUP CODES STORED:
☑ In locked drawer at office
☑ In Bitwarden "Secure Notes"
```

---

## How to Use 2FA Daily

### Logging In

1. Go to the website and enter your username/email
2. Enter your password
3. You'll see a screen asking for a **verification code**
4. Open your authenticator app on your phone
5. Find the account you're logging into
6. Enter the 6-digit code shown
7. Click **"Verify"** or **"Sign in"**

**Important:** Codes change every 30 seconds. If your code is about to expire, wait for the next one or enter it quickly.

### When You Get a New Phone

**Before you switch:**
1. Check if your authenticator app has a backup/export feature (Aegis does)
2. Export your accounts
3. Transfer to new phone
4. Test all accounts

**If you didn't back up:**
1. You'll need to use backup codes to log in
2. Then disable and re-enable 2FA on each account
3. Set up your authenticator app again

---

## How to Verify It Worked

✅ **Checklist:**
- [ ] Authenticator app installed and working
- [ ] 2FA enabled on your primary email account
- [ ] 2FA enabled on at least one financial account
- [ ] Backup codes printed and stored safely
- [ ] Tested logging out and back in with 2FA

**Test it:**
1. Log out of your email
2. Log back in
3. You should be asked for a code from your phone
4. Enter the code
5. You should get in

---

## Training Your Team

### Quick Training Script (10 minutes per person)

**Show them:**
1. What 2FA looks like when logging in
2. How to open the authenticator app
3. How to find the right code
4. What to do if their phone is dead or lost (backup codes)

**Explain:**
> "This is like adding a second lock to your door. Even if someone has your key (password), they can't get in without the second lock (your phone)."

**Give them:**
- A printed card with backup codes
- Your contact info for questions
- Permission to ask for help — this can be confusing at first

### Common Volunteer Questions

**"What if my phone battery dies?"**
> "Use one of your backup codes. That's why we printed them. You can also charge your phone and try again."

**"What if I lose my phone?"**
> "Use your backup codes to log in, then we'll help you set up 2FA on your new phone. Always keep those backup codes safe!"

**"This is annoying. Do I really need it?"**
> "I know it adds a step, but it blocks 99.9% of hacking attempts. Without it, one stolen password could give hackers access to everything. This protects our donors and our work."

**"The codes aren't working."**
- Check that their phone's time is set to automatic
- Make sure they're entering the code before it changes (30 seconds)
- Try a backup code instead

---

## Troubleshooting

### "My authenticator codes aren't working"

**Check phone time settings:**
- iPhone: Settings > General > Date & Time > Set Automatically (ON)
- Android: Settings > System > Date & Time > Automatic date & time (ON)

**Make sure you're fast enough:**
- Codes change every 30 seconds
- If the timer is almost out, wait for the next code

### "I lost my phone and don't have backup codes"

This is bad, but not the end of the world:

1. Try logging in using SMS/call backup (if you set it up)
2. Contact the service's support with proof of identity
3. They can help you regain access
4. **Prevention:** Always store backup codes somewhere safe

### "I want to switch to a different authenticator app"

1. Disable 2FA on all your accounts (temporarily)
2. Set up the new app
3. Re-enable 2FA using the new app
4. Save new backup codes

### "Can I use the same authenticator on multiple devices?"

**Yes, but be careful:**
- You can scan the same QR code on multiple phones
- This is good for shared accounts (like social media)
- But don't do this for personal accounts unless necessary
- Each device will generate the same codes

---

## Advanced: Organization Tips

### For Admin Accounts

Consider these extra protections for your most important accounts:

**Require 2FA for all admin access:**
- In Google Workspace Admin console
- Go to Security > Authentication > 2-Step Verification
- Enforce for all admins

**Use hardware keys for the most sensitive accounts:**
- YubiKey (~$50)
- Google Titan Key (~$30)
- These are physical devices you plug in — even more secure than phone apps

### For Shared Accounts

**Social media accounts** often need to be shared among team members:

**Option 1: Shared Authenticator**
- Set up the same authenticator app on multiple trusted devices
- All devices generate the same codes
- Good for: Facebook, Instagram, Twitter admin accounts

**Option 2: Multiple 2FA Methods**
- Set up authenticator app on primary admin's phone
- Add SMS backup to a secondary person's phone
- Either can log in if needed

---

## Next Steps

Now that you have 2FA:
1. **[Create onboarding/offboarding checklists](./volunteer-onboarding-checklist.md)** — Make sure new volunteers set up 2FA
2. **[Secure your email](./../02-secure-your-email/)** — Learn about phishing protection

---

**[← Back to Protect Your People](./README.md)**  
**[Next: Volunteer Onboarding Checklist →](./volunteer-onboarding-checklist.md)**
