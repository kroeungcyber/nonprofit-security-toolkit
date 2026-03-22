# 🚨 Incident Response Plan

**What to do when security incidents and data breaches occur.**

---

## Why This Matters

Security incidents are inevitable. What matters is how you respond.

**Fast response means:**
- Limited damage and data loss
- Maintained donor trust
- Regulatory compliance
- Reduced legal liability
- Faster recovery

**Slow response means:**
- Greater damage and costs
- Lost donors and reputation
- Regulatory fines
- Legal consequences
- Extended downtime

**The 72-hour rule:** GDPR requires notifying authorities within 72 hours of discovering a breach. The clock starts ticking when you become aware, not when the breach occurred.

---

## What You'll Accomplish

- ✅ Recognize and classify security incidents
- ✅ Respond quickly and effectively
- ✅ Meet legal notification requirements
- ✅ Document incidents for compliance
- ✅ Learn from incidents to prevent recurrence

**Time to create:** 2-3 hours  
**Cost:** $0  
**When to use:** Hopefully never, but be ready

---

## Types of Security Incidents

### Severity Levels

**🔴 CRITICAL (Respond Immediately)**
- Data breach affecting 100+ people
- Ransomware attack
- Unauthorized access to donor database
- Financial theft or fraud
- System-wide compromise

**🟠 HIGH (Respond Within 4 Hours)**
- Phishing attack with clicked links
- Lost or stolen laptop with donor data
- Compromised email account
- Malware infection
- Unauthorized access by former staff

**🟡 MEDIUM (Respond Within 24 Hours)**
- Suspicious email reported
- Failed login attempts
- Minor policy violation
- Lost phone (if properly secured)

**🟢 LOW (Respond Within 1 Week)**
- Spam reports
- Minor configuration issues
- Documentation updates needed

---

## The Incident Response Team

**For small non-profits, roles may be combined.**

### Required Roles

**1. Incident Commander**
- **Who:** Executive Director or most senior available person
- **Responsibilities:**
  - Overall decision-making authority
  - Determines severity and response scope
  - Approves external communications
  - Ensures legal compliance

**2. Technical Lead**
- **Who:** IT person, tech-savvy staff, or consultant
- **Responsibilities:**
  - Technical investigation and containment
  - Evidence preservation
  - System recovery
  - Coordinates with vendors

**3. Communications Lead**
- **Who:** Development Director or Communications Manager
- **Responsibilities:**
  - Internal communications
  - Donor/supplier notifications
  - Media inquiries (if applicable)
  - Regulatory notifications

**4. Legal/Compliance Advisor**
- **Who:** Board member with legal background or outside counsel
- **Responsibilities:**
  - Assess legal obligations
  - Review notifications
  - Advise on liability
  - Coordinate with authorities

### Contact Information

```
INCIDENT RESPONSE TEAM CONTACTS

Role                    Name            Phone           Email           Backup Contact
────────────────────────────────────────────────────────────────────────────────────────
Incident Commander      [Name]          [Phone]         [Email]         [Name/Phone]
Technical Lead          [Name]          [Phone]         [Email]         [Name/Phone]
Communications Lead     [Name]          [Phone]         [Email]         [Name/Phone]
Legal Advisor           [Name]          [Phone]         [Email]         [Name/Phone]

EMERGENCY CONTACTS
────────────────────────────────────────────────────────────────────────────────────────
Local Police (non-emergency)    [Number]
FBI Cyber Division              1-855-292-3937
IRS (if tax data involved)      1-800-829-1040
State Attorney General          [Number]
Cyber Insurance                 [Number]
IT Support/Consultant           [Name/Phone]

REGULATORY AUTHORITIES
────────────────────────────────────────────────────────────────────────────────────────
GDPR - EU Data Protection       [Supervisory Authority Website]
CCPA - CA Attorney General      privacy@doj.ca.gov
State Charity Regulator         [Contact Info]

VENDORS (Critical Systems)
────────────────────────────────────────────────────────────────────────────────────────
Google Workspace Support        [Support URL/Phone]
Microsoft 365 Support           [Support URL/Phone]
Donor Database Vendor           [Support URL/Phone]
Website Hosting                 [Support URL/Phone]
Payment Processor               [Support URL/Phone]
```

---

## The Incident Response Process

### Phase 1: Detection & Analysis (Hour 0)

**Step 1: Recognize the Incident**

Signs of a security incident:
- Unexpected login notifications
- Files you can't access (ransomware)
- Slow computer performance
- Unknown programs running
- Emails sent that you didn't send
- Donors reporting suspicious communications
- Alerts from security tools
- Missing or corrupted data

**Step 2: Initial Assessment**

Ask these questions immediately:
1. **What happened?** (Brief description)
2. **When did it happen?** (Or when was it discovered)
3. **What systems/data are involved?**
4. **How many people are affected?**
5. **Is it ongoing?**
6. **Who discovered it?**

**Step 3: Classify Severity**

Use the severity levels above to determine response urgency.

**Step 4: Activate Response Team**

- Notify Incident Commander immediately
- Call response team meeting
- Document start time
- Secure communication channel

---

### Phase 2: Containment (Hours 0-4)

**Goal:** Stop the incident from getting worse.

**Immediate Actions (Do These First):**

**For Account Compromise:**
- [ ] Change passwords for compromised account immediately
- [ ] Enable 2FA if not already enabled
- [ ] Review account activity/logs
- [ ] Sign out all active sessions
- [ ] Check for forwarding rules or changes
- [ ] Notify anyone who received emails from compromised account

**For Malware/Ransomware:**
- [ ] Disconnect infected device from network (unplug cable/disable WiFi)
- [ ] Do NOT turn off the computer (preserves evidence)
- [ ] Isolate the device physically
- [ ] Identify all systems that interacted with infected device
- [ ] Check backup status (don't overwrite good backups!)

**For Lost/Stolen Device:**
- [ ] Remote wipe if possible (Find My Device, Find My Mac)
- [ ] Change all passwords for accounts on device
- [ ] Revoke active sessions
- [ ] File police report (get report number)
- [ ] Check device logs for last access

**For Data Breach:**
- [ ] Stop the unauthorized access
- [ ] Preserve evidence (don't delete logs)
- [ ] Document what data was accessed
- [ ] Identify affected individuals
- [ ] Secure systems to prevent further access

**For Phishing with Credential Entry:**
- [ ] Change compromised password immediately
- [ ] Check for unauthorized changes to account
- [ ] Enable 2FA
- [ ] Review sent emails
- [ ] Alert others who may have received same phishing email

---

### Phase 3: Eradication (Hours 4-24)

**Goal:** Remove the threat completely.

**Step 1: Identify Root Cause**
- How did the attacker get in?
- What vulnerability was exploited?
- Was it user error, software flaw, or configuration issue?

**Step 2: Remove Threat**

**For Malware:**
- [ ] Run full antivirus scan
- [ ] Remove malicious software
- [ ] Delete suspicious files
- [ ] Check browser extensions
- [ ] Reset browsers to default settings

**For Compromised Accounts:**
- [ ] Verify all account settings are correct
- [ ] Remove unauthorized access
- [ ] Review all connected apps/services
- [ ] Update security questions
- [ ] Check for unauthorized data exports

**For Configuration Issues:**
- [ ] Fix security misconfigurations
- [ ] Update software to patch vulnerabilities
- [ ] Change default passwords
- [ ] Review and tighten access controls

**Step 3: Verify Threat is Gone**
- Monitor systems for suspicious activity
- Run additional scans
- Check logs for recurring issues
- Confirm no unauthorized access remains

---

### Phase 4: Recovery (Days 1-7)

**Goal:** Restore normal operations safely.

**Step 1: Restore Systems**
- [ ] Restore from clean backups (verify backups aren't infected)
- [ ] Rebuild systems from scratch if necessary
- [ ] Reinstall software from trusted sources
- [ ] Restore data from before the incident

**Step 2: Verify Integrity**
- [ ] Test all systems function correctly
- [ ] Verify no backdoors remain
- [ ] Check data integrity
- [ ] Validate security controls are working

**Step 3: Resume Operations**
- [ ] Bring systems online gradually
- [ ] Monitor closely for issues
- [ ] Communicate with staff about restored services
- [ ] Update procedures based on lessons learned

**Step 4: Enhanced Monitoring**
- [ ] Increase logging and monitoring
- [ ] Watch for signs of reinfection
- [ ] Monitor affected accounts closely
- [ ] Review access logs regularly

---

### Phase 5: Notification (Hours 0-72)

**Goal:** Meet legal obligations and maintain trust.

**Legal Notification Requirements:**

**GDPR (European Union):**
- Notify supervisory authority within 72 hours
- Notify affected individuals without undue delay if high risk
- Document all decisions

**CCPA (California):**
- No specific timeframe, but "without unreasonable delay"
- Must provide specific information to affected individuals
- Maintain records of breaches

**State Laws:**
- Most states require "reasonable" or "expeditious" notification
- Typically 30-60 days for individual notification
- Some require immediate law enforcement notification

**IRS (if tax data involved):**
- Report to IRS if taxpayer data compromised
- Notify affected taxpayers
- Provide credit monitoring in some cases

**Step 1: Determine Notification Obligations**

Create notification decision tree:

```
NOTIFICATION DECISION CHECKLIST

Is personal information involved?
☐ Yes → Continue
☐ No → Document incident, no notification required

What type of data?
☐ Name + Social Security Number → Notify
☐ Name + Financial account number → Notify
☐ Name + Driver's license number → Notify
☐ Name + Medical information → Notify
☐ Name + Email only → Depends on risk level
☐ Encrypted data → May be exempt from notification

How many individuals affected?
☐ 1-10 people
☐ 11-100 people
☐ 101-1000 people
☐ 1000+ people

What is the risk of harm?
☐ High risk (financial fraud, identity theft likely)
☐ Medium risk (possible misuse)
☐ Low risk (unlikely to cause harm)

NOTIFICATION REQUIRED:
☐ Regulatory authorities (72 hours GDPR)
☐ Affected individuals
☐ Law enforcement
☐ Cyber insurance
☐ Credit reporting agencies (if >1000 people)
☐ Media (if >5000 people or high public interest)
```

**Step 2: Draft Notifications**

**Regulatory Notification (GDPR Supervisory Authority):**

```
Subject: Data Breach Notification - [Organization Name]

Dear [Supervisory Authority],

We are writing to notify you of a personal data breach under Article 33 of the GDPR.

1. NATURE OF THE BREACH
   [Description of what happened]

2. CATEGORIES AND APPROXIMATE NUMBER OF DATA SUBJECTS
   [Categories of data, number of people affected]

3. CATEGORIES AND APPROXIMATE NUMBER OF PERSONAL DATA RECORDS
   [Types of data involved, number of records]

4. LIKELY CONSEQUENCES
   [Risk assessment - what harm could result]

5. MEASURES TAKEN OR PROPOSED
   [Steps taken to contain, eradicate, and prevent recurrence]

6. CONTACT DETAILS
   [Organization contact for more information]

We will provide updates as the investigation progresses.

Sincerely,
[Name]
[Title]
[Organization]
[Date]
```

**Individual Notification Letter:**

```
Subject: Important Security Notice - [Organization Name]

Dear [Name],

We are writing to inform you of a security incident that may have affected your
personal information.

WHAT HAPPENED
On [Date], we discovered that [brief description of incident]. We immediately
took steps to secure our systems and investigate the incident.

WHAT INFORMATION WAS INVOLVED
The following information may have been accessed:
☐ Name and address
☐ Email address
☐ Phone number
☐ [Other specific data types]

The following information was NOT involved:
☐ Social Security numbers
☐ Financial account numbers
☐ Payment card information
☐ [Other sensitive data]

WHAT WE ARE DOING
- We have secured the affected systems
- We are working with cybersecurity experts to investigate
- We have reported this to [authorities if applicable]
- We are implementing additional security measures

WHAT YOU CAN DO
We recommend you take the following precautions:
- Monitor your financial accounts for suspicious activity
- Review your credit reports regularly
- Be cautious of emails or calls asking for personal information
- [Other specific recommendations based on data involved]

We are offering [credit monitoring / identity protection services] at no cost
to you for [time period]. To enroll, visit [URL] or call [phone] and use
enrollment code: [code].

FOR MORE INFORMATION
If you have questions or need assistance:
- Call: [Phone number] (Monday-Friday, 9am-5pm)
- Email: [Email address]
- Visit: [Website with FAQ]

We sincerely apologize for this incident and any inconvenience it may cause.
Protecting your information is extremely important to us, and we are taking
steps to prevent this from happening again.

Sincerely,
[Executive Director Name]
[Title]
[Organization Name]
[Date]

[Enclosures: Credit monitoring enrollment information, Identity theft resources]
```

**Internal Communication:**

```
Subject: Security Incident - Important Information

Team,

We recently experienced a security incident involving [brief description].

WHAT HAPPENED:
[2-3 sentence summary]

WHAT WE DID:
[Summary of response actions]

CURRENT STATUS:
[Current situation - systems status, operations status]

WHAT YOU NEED TO DO:
[Specific instructions for staff]

COMMUNICATION GUIDELINES:
- Refer all media inquiries to [Communications Lead]
- Do not discuss details outside the organization
- Direct donor questions to [contact]

We will keep you updated as we learn more.

Thank you for your cooperation.

[Incident Commander]
```

**Step 3: Send Notifications**
- Send regulatory notifications within required timeframes
- Send individual notifications via mail (required) and email (if available)
- Post information on website if applicable
- Coordinate timing with legal counsel

---

### Phase 6: Post-Incident Review (Week 2)

**Goal:** Learn and improve.

**Step 1: Conduct After-Action Review**

Meeting agenda:
1. **Timeline Review**
   - When was incident discovered?
   - What actions were taken and when?
   - What worked well?
   - What could have been better?

2. **Root Cause Analysis**
   - Why did this happen?
   - What was the underlying vulnerability?
   - Could this have been prevented?

3. **Response Evaluation**
   - Did we follow the incident response plan?
   - Were roles clear?
   - Did we meet notification deadlines?
   - Were communications effective?

4. **Impact Assessment**
   - What was the total cost?
   - How many people were affected?
   - Was any data actually misused?
   - What was the reputational impact?

**Step 2: Document Lessons Learned**

```
POST-INCIDENT REVIEW REPORT

Incident ID: [Number]
Date: [Date]
Incident Type: [Type]
Severity: [Level]

EXECUTIVE SUMMARY
[2-3 paragraph summary]

TIMELINE
[Detailed timeline of discovery, response, and resolution]

ROOT CAUSE
[What caused the incident]

RESPONSE EFFECTIVENESS
Strengths:
- [What went well]
- [Effective decisions]

Areas for Improvement:
- [What could be better]
- [Gaps identified]

IMPACT
- Individuals affected: [Number]
- Systems impacted: [List]
- Data involved: [Types]
- Financial cost: [Amount]
- Reputational impact: [Assessment]

LESSONS LEARNED
1. [Lesson]
2. [Lesson]
3. [Lesson]

RECOMMENDATIONS
1. [Specific action to implement]
   Owner: [Name]
   Due Date: [Date]

2. [Specific action to implement]
   Owner: [Name]
   Due Date: [Date]

UPDATES TO INCIDENT RESPONSE PLAN
[Changes made to this plan based on lessons learned]

APPROVED BY:
[Signatures]
```

**Step 3: Update Security Measures**
- Implement recommendations from review
- Update incident response plan
- Provide additional training
- Enhance security controls
- Update vendor requirements

---

## Incident-Specific Playbooks

### Playbook 1: Ransomware Attack

**Immediate Actions (First Hour):**
1. **Isolate** infected systems immediately (disconnect network)
2. **Preserve evidence** - Don't turn off computers
3. **Alert team** - Activate incident response
4. **Assess scope** - How many systems affected?
5. **Check backups** - Verify clean backups exist

**Critical Decision:** To Pay or Not to Pay?

**Law enforcement position:** Do not pay ransom
- No guarantee you'll get decryption key
- Marks you as willing to pay for future attacks
- May violate sanctions laws
- Funds criminal organizations

**However, consider:**
- Do you have viable backups?
- Can you rebuild systems?
- What is the cost of downtime vs. ransom?
- Consult with legal counsel and cyber insurance

**Recovery Steps:**
1. Restore from clean backups
2. Rebuild systems from scratch if needed
3. Verify no backdoors remain
4. Implement additional security measures
5. Conduct post-incident review

---

### Playbook 2: Phishing Attack (Clicked Link)

**Immediate Actions:**
1. **Change password** for compromised account
2. **Enable 2FA** if not already enabled
3. **Sign out all sessions**
4. **Check for changes:**
   - Forwarding rules
   - Reply-to addresses
   - Auto-responders
   - Delegated access
5. **Review sent items** for unauthorized emails
6. **Scan computer** for malware
7. **Alert others** who may have received same email

**Investigation:**
- Who else received the phishing email?
- Did anyone else click links?
- Was any data accessed?
- Were credentials entered?

---

### Playbook 3: Lost/Stolen Laptop

**Immediate Actions (Within 1 Hour):**
1. **Remote wipe** device (if enrolled in device management)
2. **Change all passwords** for accounts on device
3. **Revoke active sessions** for all accounts
4. **File police report** (get report number)
5. **Notify cyber insurance**
6. **Document serial number** and device details

**Assessment:**
- Was device encrypted?
- What data was stored locally?
- Were passwords saved in browser?
- Was 2FA enabled on accounts?

**Notifications:**
- If donor data on device → Individual notifications
- If encrypted → May not need notification (check state laws)

---

### Playbook 4: Unauthorized Access by Former Staff

**Immediate Actions:**
1. **Disable all access** immediately (don't wait)
2. **Change all shared passwords**
3. **Review access logs** for activity
4. **Document what was accessed**
5. **Preserve evidence** (screenshots, logs)

**Investigation:**
- What accounts did they access?
- What data was viewed or downloaded?
- Did they delete anything?
- Were they acting maliciously or accidentally?

**Legal Considerations:**
- Consult legal counsel
- Determine if law enforcement notification required
- Consider restraining order if ongoing threat
- Document everything for potential legal action

---

## Incident Documentation

### Incident Log

```
SECURITY INCIDENT LOG

Incident #: _______        Date Opened: _______
Status: ☐ Open ☐ Closed   Date Closed: _______
Severity: ☐ Critical ☐ High ☐ Medium ☐ Low

BASIC INFORMATION
─────────────────────────────────────────────────────────────
Incident Type: [Phishing / Malware / Breach / Loss / Other]
Discovery Date/Time: ___________________
Discovery Method: ______________________
Reporter Name: _________________________
Reporter Contact: ______________________

INCIDENT COMMANDER
Name: _________________________________
Phone: ________________________________
Email: ________________________________

DESCRIPTION
─────────────────────────────────────────────────────────────
[Detailed description of what happened]

SYSTEMS/DATA INVOLVED
─────────────────────────────────────────────────────────────
Systems: ______________________________
Data Types: ___________________________
Number of People Affected: ____________

TIMELINE
─────────────────────────────────────────────────────────────
[Date/Time - Action taken]

RESPONSE ACTIONS
─────────────────────────────────────────────────────────────
[What was done to contain, eradicate, recover]

NOTIFICATIONS
─────────────────────────────────────────────────────────────
☐ Regulatory authorities    Date: _______
☐ Affected individuals      Date: _______
☐ Law enforcement          Date: _______
☐ Cyber insurance          Date: _______
☐ Media                    Date: _______

OUTCOME
─────────────────────────────────────────────────────────────
[Result of incident - resolved, contained, etc.]

LESSONS LEARNED
─────────────────────────────────────────────────────────────
[Key takeaways]

FOLLOW-UP ACTIONS
─────────────────────────────────────────────────────────────
[Items to complete]

DOCUMENTED BY: _______________ DATE: _______
REVIEWED BY: _________________ DATE: _______
```

---

## Prevention Checklist

Use this to reduce incident likelihood:

```
INCIDENT PREVENTION CHECKLIST

ACCESS CONTROL
☐ Strong passwords required (12+ characters)
☐ Two-factor authentication on all admin accounts
☐ Role-based access (minimum necessary)
☐ Quarterly access reviews
☐ Immediate access removal for departing staff
☐ Shared account passwords changed regularly

EMAIL SECURITY
☐ SPF/DKIM/DMARC configured
☐ Email filtering enabled
☐ Phishing training completed (quarterly)
☐ Suspicious email reporting process
☐ Email forwarding rules monitored

DEVICE SECURITY
☐ Full disk encryption on all devices
☐ Automatic screen lock (5 minutes)
☐ Automatic updates enabled
☐ Antivirus installed and updated
☐ Find My Device enabled
☐ Devices registered in asset inventory

DATA PROTECTION
☐ Data retention policy implemented
☐ Regular data purging (annual)
☐ Minimal data collection principle
☐ Sensitive data encrypted
☐ Access to donor data restricted
☐ Data Processing Agreements with vendors

BACKUP & RECOVERY
☐ 3-2-1 backup strategy
☐ Automated backups tested monthly
☐ Backup encryption enabled
☐ Offline/air-gapped backups
☐ Recovery procedures tested

MONITORING
☐ Login monitoring enabled
☐ Failed login alerts configured
☐ Regular log review (monthly)
☐ Security software alerts
☐ Unusual activity detection

TRAINING
☐ Security awareness training (annual)
☐ Phishing simulation tests
☐ Incident response training
☐ New staff onboarded securely
☐ Regular refresher communications

VENDOR MANAGEMENT
☐ Data Processing Agreements signed
☐ Vendor security assessments
☐ Vendor access monitoring
☐ Vendor breach notification confirmed
```

---

## Resources & Templates

**Legal Resources:**
- **[compliance-quick-guide.md](./compliance-quick-guide.md)** — Data protection compliance
- **[vendor-security-assessment.md](./vendor-security-assessment.md)** — Vendor security requirements

**Useful Websites:**
- [Cybersecurity & Infrastructure Security Agency (CISA)](https://www.cisa.gov)
- [FBI Internet Crime Complaint Center (IC3)](https://www.ic3.gov)
- [National Cyber Security Centre (NCSC)](https://www.ncsc.gov.uk)
- [Stay Safe Online (National Cybersecurity Alliance)](https://staysafeonline.org)

**Reporting:**
- FBI Cyber Division: 1-855-292-3937
- CISA: https://www.cisa.gov/report
- IC3: https://www.ic3.gov (for internet crime)

---

## Quick Reference Cards

Print and distribute to staff:

```
┌─────────────────────────────────────────────────────────────┐
│                 🚨 SECURITY INCIDENT CARD                    │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  IF YOU SUSPECT A SECURITY INCIDENT:                        │
│                                                              │
│  1. DON'T PANIC — We've trained for this                    │
│                                                              │
│  2. IMMEDIATELY contact:                                    │
│     [Incident Commander Name]                               │
│     [Phone Number]                                          │
│     [Email Address]                                         │
│                                                              │
│  3. DO NOT:                                                 │
│     ❌ Turn off computers (preserves evidence)             │
│     ❌ Delete suspicious files                             │
│     ❌ Discuss on social media                             │
│     ❌ Contact media                                        │
│                                                              │
│  4. DO:                                                     │
│     ✅ Document what you observed                          │
│     ✅ Take screenshots if safe to do so                   │
│     ✅ Write down exact error messages                     │
│     ✅ Note date and time                                  │
│                                                              │
│  5. Wait for instructions from response team                │
│                                                              │
├─────────────────────────────────────────────────────────────┤
│  EMERGENCY CONTACTS                                         │
│  Police (non-emergency): [Number]                          │
│  IT Support: [Name/Number]                                 │
│  Cyber Insurance: [Number]                                 │
└─────────────────────────────────────────────────────────────┘
```

---

**Remember:** The goal is not perfection—it's rapid detection and effective response. Review this plan quarterly and practice with tabletop exercises.

**[← Back to Keep Good Records](./README.md)**  
**[← Back to Compliance Guide](./compliance-quick-guide.md)**
