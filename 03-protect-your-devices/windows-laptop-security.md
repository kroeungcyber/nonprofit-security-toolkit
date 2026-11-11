# 🪟 Windows Laptop Security

**Secure Windows 10 and 11 computers for your non-profit.**

---

## Why This Matters

Windows is the most common target for malware and attacks. Properly configured, it's very secure. Left with default settings, it's vulnerable.

**Time:** 45-60 minutes per computer  
**Cost:** $0 (using built-in Windows security)  
**Difficulty:** Easy

---

## Quick Security Checklist

**Do these first (15 minutes):**
- [ ] Enable automatic Windows updates
- [ ] Turn on Windows Defender (antivirus)
- [ ] Enable Windows Firewall
- [ ] Set a strong password or PIN
- [ ] Enable Windows Hello (fingerprint/face if available)

**Then do these (30 minutes):**
- [ ] Enable BitLocker encryption (Windows Pro only)
- [ ] Configure screen lock after 5 minutes
- [ ] Enable Find My Device
- [ ] Review privacy settings
- [ ] Remove unnecessary software

---

## Step 1: Enable Automatic Updates (5 minutes)

**Why:** Updates fix security holes quickly.

**How to enable:**

1. Click **Start** → **Settings** (gear icon)
2. Click **Windows Update** (Windows 11) or **Update & Security** > **Windows Update** (Windows 10)
3. Click **Advanced options**
4. Make sure these are ON:
   - **Receive updates for other Microsoft products**
   - **Download updates over metered connections** (if you have limited internet)
5. Set **Active hours** to when you normally use the computer
6. Close settings

**To check for updates now:**
1. Go to **Windows Update**
2. Click **Check for updates**
3. Install any available updates
4. Restart if prompted

---

## Step 2: Enable Windows Defender (5 minutes)

**What it is:** Free antivirus built into Windows. It's actually very good!

**How to verify it's on:**

1. Click **Start** → **Settings**
2. Click **Privacy & security** > **Windows Security**
3. Click **Open Windows Security**
4. You should see green checkmarks for:
   - Virus & threat protection
   - Account protection
   - Firewall & network protection
   - App & browser control
   - Device security
   - Device performance & health

**If anything shows a warning:**
1. Click on that section
2. Follow the prompts to fix it

**Enable real-time protection:**
1. In Windows Security, click **Virus & threat protection**
2. Under "Virus & threat protection settings," click **Manage settings**
3. Make sure **Real-time protection** is ON
4. Make sure **Cloud-delivered protection** is ON
5. Make sure **Automatic sample submission** is ON

---

## Step 3: Enable Windows Firewall (5 minutes)

**What it does:** Blocks unauthorized network connections.

**How to verify it's on:**

1. In Windows Security, click **Firewall & network protection**
2. You should see:
   - Domain network: On
   - Private network: On
   - Public network: On

**If any are off:**
1. Click on that network type
2. Toggle **Microsoft Defender Firewall** to ON

---

## Step 4: Set a Strong Password or PIN (5 minutes)

**Windows 11:**

1. Click **Start** → **Settings**
2. Click **Accounts** > **Sign-in options**
3. Under **Password**, click **Add** or **Change**
4. Create a strong password:
   - At least 12 characters
   - Mix of uppercase, lowercase, numbers, symbols
   - Not based on personal information
5. Click **Next** and **Finish**

**Set up a PIN (faster than typing password):**
1. In **Sign-in options**
2. Click **PIN (Windows Hello)**
3. Click **Set up** or **Change PIN**
4. Enter a 6+ digit PIN
5. Click **OK**

**Enable Windows Hello (if your device has fingerprint or camera):**
1. In **Sign-in options**
2. Click **Fingerprint recognition** or **Facial recognition**
3. Click **Set up**
4. Follow the prompts

---

## Step 5: Configure Screen Lock (5 minutes)

**Why:** Prevents unauthorized access when you step away.

**How to set:**

1. Click **Start** → **Settings**
2. Click **Personalization** > **Lock screen**
3. Click **Screen timeout settings**
4. Set **Screen** to turn off after 5 minutes
5. Set **Sleep** to after 10-15 minutes

**Require password when waking:**

1. Go back to **Settings** > **Accounts** > **Sign-in options**
2. Under **Additional settings**
3. Set **If you've been away, when should Windows require you to sign in again?**
4. Choose **When PC wakes up from sleep**

**Alternative: Use Windows + L**
- Press **Windows key + L** anytime to lock your screen immediately
- Make this a habit when stepping away

---

## Step 6: Enable BitLocker Encryption (10 minutes)

**⚠️ Only available on Windows 10/11 Pro, Enterprise, or Education.**

**What it does:** Encrypts your hard drive so data is unreadable without your password.

**Why it matters:** If your laptop is stolen, thieves can't access your files.

**How to enable:**

1. Click **Start** → **Settings**
2. Click **Privacy & security** > **Device encryption** OR **BitLocker Drive Encryption**
3. If you see **Device encryption**, turn it ON
4. If you see **BitLocker Drive Encryption**:
   - Click **Turn on BitLocker** next to your C: drive
   - Choose how to back up your recovery key:
     - **Save to Microsoft account** (recommended)
     - **Save to a USB drive**
     - **Print the recovery key**
   - ⚠️ **Important:** Don't lose this recovery key! Store it somewhere safe.
   - Choose **Encrypt used disk space only** (faster)
   - Choose **New encryption mode**
   - Click **Start encryption**

**If you don't have BitLocker option:**
- Your Windows version might be Home edition
- Consider upgrading to Pro if you handle sensitive data
- Or use third-party encryption like VeraCrypt (free)

---

## Step 7: Enable Find My Device (5 minutes)

**What it does:** Helps you locate, lock, or erase a lost or stolen laptop.

**How to enable:**

1. Click **Start** → **Settings**
2. Click **Privacy & security** > **Find my device**
3. Toggle **Find my device** to ON
4. Make sure **Location** is also turned on:
   - Go to **Privacy & security** > **Location**
   - Turn **Location services** ON

**How to use if device is lost:**

1. Go to [account.microsoft.com/devices](https://account.microsoft.com/devices)
2. Sign in with the same Microsoft account
3. Find your device
4. You can:
   - **Locate** — See where it is on a map
   - **Lock** — Lock the device remotely
   - **Erase** — Wipe all data (last resort)

---

## Step 8: Review Privacy Settings (10 minutes)

**Control what data Windows collects:**

1. Click **Start** → **Settings** > **Privacy & security**

**General:**
- Turn OFF: **Let apps show me personalized ads**
- Turn OFF: **Let websites show me locally relevant content**

**Speech:**
- Turn OFF: **Online speech recognition** (unless you use voice features)

**Inking & typing personalization:**
- Turn OFF if you don't want Windows to learn your typing patterns

**Diagnostics & feedback:**
- Set **Diagnostic data** to **Required** (not Optional)
- Turn OFF: **Improve inking and typing**
- Turn OFF: **Tailored experiences**
- Turn OFF: **View diagnostic data**

**Activity history:**
- Turn OFF: **Store my activity history on this device**
- Uncheck your account under "Show activities from accounts"

---

## Step 9: Remove Unnecessary Software (10 minutes)

**Why:** Less software = fewer security risks.

**How to review installed programs:**

1. Click **Start** → **Settings**
2. Click **Apps** > **Installed apps** (Windows 11) or **Apps & features** (Windows 10)
3. Look through the list
4. Uninstall anything you don't recognize or need:
   - Click the app
   - Click **Uninstall**
   - Confirm

**Common things to remove:**
- Trial antivirus software (keep Windows Defender instead)
- Bloatware that came with the computer
- Old software you don't use
- Browser toolbars

**Be careful:** Don't uninstall things you don't recognize if they say "Microsoft" or "Windows" — those are probably important.

---

## Step 10: Secure Your Browser (10 minutes)

**Chrome:**
1. Click three dots → **Settings**
2. **Privacy and security** > **Security**
3. Enable **Standard protection** or **Enhanced protection**
4. Enable **Always use secure connections**
5. **Passwords** — Consider letting Chrome suggest strong passwords

**Edge:**
1. Click three dots → **Settings**
2. **Privacy, search, and services**
3. Set **Tracking prevention** to **Balanced** or **Strict**
4. Enable **Microsoft Defender SmartScreen**
5. Enable **Enhance your security on the web**

**Firefox:**
1. Click three lines → **Settings**
2. **Privacy & Security**
3. Set **Enhanced Tracking Protection** to **Strict**
4. Enable **HTTPS-Only Mode** in all windows

---

## Ongoing Maintenance

**Weekly:**
- Check that Windows Security shows green checkmarks
- Don't ignore update notifications

**Monthly:**
- Run a quick scan: Windows Security > Virus & threat protection > Quick scan
- Review installed apps, remove anything new you don't need

**If something seems wrong:**
- Run a full scan: Windows Security > Virus & threat protection > Scan options > Full scan
- Check for unfamiliar programs
- Review recent browser extensions

---

## Troubleshooting

### "Windows Defender is turned off and won't turn on"

- You might have another antivirus installed
- Uninstall the other antivirus first
- Then Windows Defender will turn on automatically

### "BitLocker isn't available"

- You have Windows Home edition
- Options:
  1. Upgrade to Windows Pro (~$99)
  2. Use VeraCrypt (free third-party encryption)
  3. Ensure strong passwords and physical security

### "Computer is slow after security settings"

- Make sure you have enough RAM (8GB minimum recommended)
- Close unnecessary programs
- Run Disk Cleanup: Start → type "Disk Cleanup" → Run it

### "Forgot my password"

- If you used a Microsoft account: Reset at [account.live.com/password/reset](https://account.live.com/password/reset)
- If you used a local account: You might need help from an admin or IT person

---

## Next Steps

- **[Protect Your Devices](./README.md)** — Mac and phone security guidance
- **[Backup Your Data](../04-backup-your-data/)** — Protect against data loss

---

**[← Back to Protect Your Devices](./README.md)**
