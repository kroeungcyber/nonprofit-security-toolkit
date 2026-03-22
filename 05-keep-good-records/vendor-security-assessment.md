# 🔍 Vendor Security Assessment

**Evaluating and managing security risks from third-party vendors and service providers.**

---

## Why This Matters

Your security is only as strong as your weakest vendor.

**Real examples:**
- A non-profit's donor database was breached through their email marketing vendor
- A small charity lost all their donor records when their cloud provider had a ransomware attack
- An organization's donation page was compromised through their payment processor

**Vendor risks include:**
- Data breaches at vendor exposing your donor information
- Vendor employees accessing your data inappropriately
- Vendor going out of business or losing your data
- Vendor compliance failures affecting you
- Vendor security practices not meeting your standards

**Regulatory requirement:** GDPR and other privacy laws require you to ensure vendors protect personal data appropriately.

---

## What You'll Accomplish

- ✅ Identify which vendors pose security risks
- ✅ Assess vendor security practices
- ✅ Ensure appropriate security requirements
- ✅ Document vendor relationships for compliance
- ✅ Reduce third-party security risks

**Time to implement:** 3-4 hours initial assessment, then 1 hour annually  
**Cost:** $0 (using assessment templates)

---

## Step 1: Identify Your Vendors

### Create a Vendor Inventory

List all third parties who:
- Store or process your data
- Have access to your systems
- Handle donor or beneficiary information
- Provide critical business services

```
VENDOR INVENTORY
[Organization Name] | Last Updated: [Date]

VENDOR          SERVICE          DATA ACCESSED    CRITICAL?  RISK LEVEL  DPA?  LAST REVIEW
────────────────────────────────────────────────────────────────────────────────────────────
Google Workspace    Email/Storage    All data         Yes        Medium      Yes   [Date]
Mailchimp           Email Marketing  Donor emails     Yes        Medium      Yes   [Date]
Stripe              Payments         Payment data     Yes        High        Yes   [Date]
QuickBooks          Accounting       Financial        Yes        High        Yes   [Date]
[Vendor]            [Service]        [Data]           [Y/N]      [Level]     [Y/N] [Date]

Risk Levels:
- Low: No sensitive data, public information only
- Medium: Some personal data, limited access
- High: Sensitive data (donor info, payments, SSNs)
- Critical: Core systems, all organizational data
```

### Critical Vendor Categories

**High-Risk Vendors (Always Assess):**
- Cloud storage and email (Google Workspace, Microsoft 365)
- Donor management systems (Salesforce, Bloomerang, Little Green Light)
- Payment processors (Stripe, PayPal, Network for Good)
- Email marketing (Mailchimp, Constant Contact)
- Accounting software (QuickBooks Online)
- Website hosting and CMS
- Background check providers
- IT support/consultants with system access

**Medium-Risk Vendors (Assess if handling personal data):**
- Event registration platforms
- Survey tools (SurveyMonkey, Google Forms)
- Project management tools (Asana, Trello)
- Communication tools (Slack, Zoom)
- File sharing services (Dropbox, Box)

**Lower-Risk Vendors (Basic assessment):**
- Office supplies
- Utilities
- General software without data access
- One-time contractors

---

## Step 2: Categorize by Risk Level

### Risk Assessment Matrix

| Risk Factor | Low Risk | Medium Risk | High Risk |
|-------------|----------|-------------|-----------|
| **Data Sensitivity** | Public info only | Contact info, donation history | SSN, financial data, health info |
| **Data Volume** | <100 records | 100-1,000 records | >1,000 records |
| **System Access** | No system access | Read-only access | Administrative access |
| **Business Critical** | Service easily replaceable | Some disruption if lost | Operations halt if lost |
| **Vendor Size** | Large, established company | Mid-size or well-funded startup | Small/new vendor |

**Scoring:**
- 0-5 points = Low Risk
- 6-10 points = Medium Risk
- 11-15 points = High Risk
- 16+ points = Critical Risk

### Critical Vendor Identification

Any vendor is **CRITICAL** if they:
- Store donor personal information (names, addresses, donation history)
- Process payments or financial data
- Have administrative access to your core systems
- Handle beneficiary/client data
- Are essential to daily operations
- Would cause major disruption if compromised

---

## Step 3: Security Assessment Questionnaire

Send this to all high and critical risk vendors:

```
VENDOR SECURITY ASSESSMENT QUESTIONNAIRE
[Your Organization Name] | Date Sent: [Date]

Vendor Name: _________________________________
Contact Person: ______________________________
Email: ______________________________________
Phone: ______________________________________

SECTION 1: COMPANY INFORMATION
─────────────────────────────────────────────────────────────

1. Company Details
   - Years in business: ___________
   - Number of employees: ___________
   - Annual revenue: ___________
   - Headquarters location: ___________

2. Business Stability
   - Is the company profitable? ☐ Yes ☐ No
   - Any bankruptcies or major financial issues in past 5 years? ☐ Yes ☐ No
   - If yes, please explain: ___________________________________

3. Insurance
   - Cyber liability insurance: ☐ Yes ☐ No
   - Coverage amount: $__________
   - Errors & omissions insurance: ☐ Yes ☐ No

SECTION 2: SECURITY CERTIFICATIONS & COMPLIANCE
─────────────────────────────────────────────────────────────

4. Security Certifications (check all that apply)
   ☐ SOC 2 Type I
   ☐ SOC 2 Type II
   ☐ ISO 27001
   ☐ PCI DSS (if handling payments)
   ☐ HIPAA (if handling health data)
   ☐ Other: ___________________

   Please provide certificate or report: ___________________

5. Compliance Standards
   Does your organization comply with:
   ☐ GDPR (EU data protection)
   ☐ CCPA/CPRA (California privacy)
   ☐ SOC 2 Trust Services Criteria
   ☐ Other: ___________________

6. Audit History
   - Date of last security audit: ___________
   - Audit type (internal/external): ___________
   - Any critical findings? ☐ Yes ☐ No
   - If yes, were they remediated? ☐ Yes ☐ No ☐ N/A

SECTION 3: DATA PROTECTION
─────────────────────────────────────────────────────────────

7. Data Encryption
   - Encryption at rest: ☐ Yes ☐ No
     If yes, what standard? ___________________
   - Encryption in transit: ☐ Yes ☐ No
     If yes, what protocol? (TLS 1.2+, etc.) ___________________

8. Data Storage
   - Where is data stored? (regions/countries) ___________________
   - Do you use third-party data centers? ☐ Yes ☐ No
   - If yes, who? ___________________

9. Data Retention & Deletion
   - Data retention period: ___________
   - Data deletion procedure: ___________________
   - Can you return/delete all our data on request? ☐ Yes ☐ No
   - How long does deletion take? ___________

10. Data Access Controls
    - Role-based access controls? ☐ Yes ☐ No
    - Multi-factor authentication required? ☐ Yes ☐ No
    - Principle of least privilege? ☐ Yes ☐ No
    - Regular access reviews? ☐ Yes ☐ No (frequency: _______)

11. Who can access our data?
    - Number of employees with access: ___________
    - Background checks performed? ☐ Yes ☐ No
    - Confidentiality agreements signed? ☐ Yes ☐ No

SECTION 4: INCIDENT RESPONSE & SECURITY MONITORING
─────────────────────────────────────────────────────────────

12. Security Monitoring
    - 24/7 security monitoring? ☐ Yes ☐ No
    - Intrusion detection systems? ☐ Yes ☐ No
    - Log retention period: ___________

13. Incident Response
    - Formal incident response plan? ☐ Yes ☐ No
    - Incident response team? ☐ Yes ☐ No
    - Average time to detect security incidents: ___________
    - Average time to respond to incidents: ___________

14. Breach Notification
    - Will you notify us within 24 hours of discovering a breach? ☐ Yes ☐ No
    - Will you provide details of what data was affected? ☐ Yes ☐ No
    - Do you assist with breach notifications to affected individuals? ☐ Yes ☐ No

15. Historical Breaches
    - Any security breaches in past 3 years? ☐ Yes ☐ No
    - If yes, please describe:
      Date: _________ Nature: ___________________________
      Data affected: ___________________________
      Resolution: ___________________________

SECTION 5: BUSINESS CONTINUITY & RECOVERY
─────────────────────────────────────────────────────────────

16. Backup & Recovery
    - Data backup frequency: ___________
    - Backup retention period: ___________
    - Backup encryption: ☐ Yes ☐ No
    - Offsite backup storage: ☐ Yes ☐ No
    - Recovery Time Objective (RTO): ___________
    - Recovery Point Objective (RPO): ___________

17. Business Continuity
    - Business continuity plan? ☐ Yes ☐ No
    - Disaster recovery plan? ☐ Yes ☐ No
    - When last tested? ___________
    - Redundant systems/locations? ☐ Yes ☐ No

18. Service Availability
    - Historical uptime (last 12 months): _______%
    - Scheduled maintenance frequency: ___________
    - Notice period for maintenance: ___________

SECTION 6: SUBPROCESSORS & THIRD PARTIES
─────────────────────────────────────────────────────────────

19. Sub-processors
    - Do you use sub-processors (companies processing our data)? ☐ Yes ☐ No
    - If yes, list them: ___________________
    - Do they meet the same security standards? ☐ Yes ☐ No

20. Fourth-Party Risk
    - Do you conduct security assessments of your vendors? ☐ Yes ☐ No
    - Do you notify us before adding new sub-processors? ☐ Yes ☐ No

SECTION 7: CONTRACT & LEGAL
─────────────────────────────────────────────────────────────

21. Data Processing Agreement (DPA)
    - Can you sign a Data Processing Agreement? ☐ Yes ☐ No
    - Do you provide Standard Contractual Clauses for international transfers? ☐ Yes ☐ No

22. Liability
    - Limitation of liability cap: $___________
    - Cyber liability insurance coverage: $___________

23. Contract Terms
    - Contract length: ___________
    - Termination notice period: ___________
    - Data return/deletion upon termination: ☐ Yes ☐ No

SECTION 8: SECURITY PRACTICES
─────────────────────────────────────────────────────────────

24. Security Training
    - Employee security awareness training? ☐ Yes ☐ No
    - Training frequency: ___________
    - Phishing simulations? ☐ Yes ☐ No

25. Vulnerability Management
    - Regular vulnerability scanning? ☐ Yes ☐ No (frequency: _______)
    - Penetration testing? ☐ Yes ☐ No (frequency: _______)
    - Patch management process? ☐ Yes ☐ No

26. Physical Security
    - Data center physical security controls? ☐ Yes ☐ No
    - Office building security? ☐ Yes ☐ No
    - Laptop/device encryption required? ☐ Yes ☐ No

SECTION 9: ADDITIONAL INFORMATION
─────────────────────────────────────────────────────────────

27. Please describe your information security program:
    __________________________________________________________________
    __________________________________________________________________

28. Are there any known security issues or concerns we should be aware of?
    __________________________________________________________________

29. Additional comments:
    __________________________________________________________________

─────────────────────────────────────────────────────────────

CERTIFICATION

I certify that the information provided in this questionnaire is accurate
to the best of my knowledge.

Name: ___________________________ Title: ___________________________

Signature: ______________________ Date: ___________________________

Please return completed questionnaire to:
[Your Organization Name]
[Email Address]
[Phone Number]
```

---

## Step 4: Evaluate Vendor Responses

### Scoring Rubric

Score each vendor 1-5 on each category:

| Category | 1 (Poor) | 2 (Fair) | 3 (Good) | 4 (Very Good) | 5 (Excellent) |
|----------|----------|----------|----------|---------------|---------------|
| **Security Posture** | No formal program | Basic controls | Good controls | Strong program | Industry leading |
| **Compliance** | Non-compliant | Some gaps | Mostly compliant | Fully compliant | Exceeds requirements |
| **Transparency** | Won't answer | Limited info | Answers most | Very open | Fully transparent |
| **Track Record** | Recent breaches | Some issues | Clean 1-2 years | Clean 3+ years | Clean 5+ years |
| **Business Stability** | Financial issues | Struggling | Stable | Growing | Well-established |

**Total Score Interpretation:**
- 20-25: Excellent - Approved for use
- 15-19: Good - Approved with standard monitoring
- 10-14: Fair - Approved with additional safeguards
- 5-9: Poor - Not approved or requires significant remediation
- <5: Unacceptable - Do not use

### Red Flags 🚩

**Automatic Disqualifiers:**
- Won't complete security questionnaire
- Recent data breach (within 2 years) with poor response
- No encryption for data at rest or in transit
- No formal incident response plan
- No backup/disaster recovery plan
- Refuses to sign Data Processing Agreement
- Located in high-risk country without adequate safeguards
- Poor financial stability (likely to fail)

**Major Concerns:**
- No security certifications or audits
- Won't provide evidence of security controls
- Unwilling to notify of breaches
- No data deletion capability
- Excessive sub-processors without transparency
- Weak access controls
- No background checks on employees

---

## Step 5: Vendor Risk Rating

### Risk Rating Matrix

```
VENDOR RISK RATING

Vendor: ________________________________ Date: ___________

SCORING
─────────────────────────────────────────────────────────────
Security Posture:       _____ / 5
Compliance:             _____ / 5
Transparency:           _____ / 5
Track Record:           _____ / 5
Business Stability:     _____ / 5
─────────────────────────────────────────────────────────────
TOTAL SCORE:            _____ / 25

RISK RATING: ☐ Low (20-25) ☐ Medium (15-19) ☐ High (10-14) ☐ Critical (<10)

ASSESSMENT SUMMARY
─────────────────────────────────────────────────────────────
Strengths:
- 
- 

Weaknesses:
- 
- 

Red Flags Identified:
- 
- 

RECOMMENDATION
─────────────────────────────────────────────────────────────
☐ APPROVED - No additional safeguards needed
☐ APPROVED WITH CONDITIONS - See requirements below
☐ NOT APPROVED - Use alternative vendor
☐ PENDING - Need more information

CONDITIONS/APPROVAL REQUIREMENTS:
1. 
2. 
3. 

MONITORING REQUIREMENTS:
☐ Annual reassessment
☐ Quarterly check-ins
☐ Continuous monitoring
☐ Incident notification required

REVIEWED BY: __________________ DATE: _______
APPROVED BY: __________________ DATE: _______
```

---

## Step 6: Ongoing Vendor Management

### Vendor Review Schedule

```
VENDOR REVIEW CALENDAR

CRITICAL VENDORS (Quarterly Review)
- Google Workspace: Jan / Apr / Jul / Oct
- Payment Processor: Feb / May / Aug / Nov
- Donor Database: Mar / Jun / Sep / Dec

HIGH RISK VENDORS (Semi-Annual Review)
- Email Marketing: Jan / Jul
- Accounting Software: Feb / Aug
- Website Hosting: Mar / Sep

MEDIUM RISK VENDORS (Annual Review)
- Survey Tools: Q1
- Project Management: Q2
- File Sharing: Q3
- Communication Tools: Q4
```

### Annual Vendor Review Checklist

```
ANNUAL VENDOR SECURITY REVIEW

Vendor: ____________________________ Review Date: ___________
Last Assessment Score: _____/25

☐ Review vendor's security certifications (still valid?)
☐ Check for any reported breaches in past year
☐ Verify cyber insurance still active
☐ Review any audit reports provided
☐ Confirm DPA is signed and current
☐ Check for changes in sub-processors
☐ Review vendor's security updates/changes
☐ Verify contact information is current
☐ Assess if risk level has changed
☐ Update vendor inventory

Current Issues or Concerns:
_____________________________________
_____________________________________

Action Items:
_____________________________________
_____________________________________

Next Review Date: ___________
Reviewed By: ___________
```

### Continuous Monitoring

**Stay informed about vendor security:**

1. **Subscribe to Security Advisories**
   - Sign up for vendor security newsletters
   - Follow vendor security Twitter accounts
   - Monitor security forums and news

2. **Use Monitoring Services (Free)**
   - [Have I Been Pwned](https://haveibeenpwned.com) - Check if vendor breached
   - Google Alerts for "[Vendor Name] data breach"
   - Vendor status pages for outages

3. **Regular Check-ins**
   - Quarterly: Brief email asking about any security changes
   - Annually: Full reassessment questionnaire
   - After incidents: Immediate review

---

## Step 7: Data Processing Agreements

### What is a DPA?

A Data Processing Agreement is a contract that:
- Defines how the vendor can use your data
- Requires them to protect the data
- Specifies breach notification requirements
- Governs data deletion at contract end
- Meets GDPR Article 28 requirements

### When You Need a DPA

**Always required for:**
- Cloud storage and email providers
- Donor management systems
- Payment processors
- Email marketing services
- Any vendor processing personal data on your behalf

**Not typically required for:**
- Utilities
- General office suppliers
- One-time contractors (if no ongoing data access)

### DPA Checklist

Ensure your DPA includes:

**✅ Processing Instructions:**
- Vendor processes data only on your documented instructions
- No use for vendor's own purposes
- No sharing with third parties without approval

**✅ Security Measures:**
- Encryption requirements
- Access controls
- Security training
- Vulnerability management

**✅ Sub-processors:**
- List of approved sub-processors
- Same level of protection required
- Notification before adding new ones

**✅ Confidentiality:**
- Staff confidentiality agreements
- Background check requirements
- Data access limitations

**✅ Data Subject Rights:**
- Vendor assists with access requests
- Vendor assists with deletion requests
- No unreasonable delays

**✅ Breach Notification:**
- Notify within 24-48 hours
- Provide details of breach
- Cooperate with investigation
- Assist with notifications

**✅ Audit Rights:**
- Right to audit vendor security
- Right to review certifications
- Access to security documentation

**✅ Data Return/Deletion:**
- Return or delete data at contract end
- Certification of deletion
- No retention of copies

### Template DPA Request Email

```
Subject: Data Processing Agreement Required - [Organization Name]

Dear [Vendor Contact],

[Organization Name] takes data protection seriously and is required to maintain
Data Processing Agreements (DPAs) with all vendors who process personal data
on our behalf.

Under the GDPR and our internal data protection policies, we need a signed DPA
that addresses:

• Processing only on our documented instructions
• Appropriate technical and organizational security measures
• Confidentiality obligations for staff
• Sub-processor management and notification
• Assistance with data subject rights requests
• Breach notification within 24 hours
• Data return or deletion at contract termination
• Audit and inspection rights

Please provide your standard DPA or let me know if you need us to send you
our template. We require this to be executed by [date].

If you have any questions or need to discuss specific terms, please don't
hesitate to contact me.

Thank you for your partnership in protecting personal data.

Best regards,
[Your Name]
[Title]
[Organization Name]
[Email] | [Phone]
```

---

## Vendor Risk Management Best Practices

### 1. Principle of Least Privilege
- Give vendors minimum access necessary
- Use read-only access when possible
- Separate admin accounts from regular use
- Regularly review and revoke unnecessary access

### 2. Data Minimization
- Only share data vendor actually needs
- Anonymize data when possible
- Don't share sensitive data unless required
- Use aggregate data for reporting when possible

### 3. Monitoring & Logging
- Enable audit logs for vendor access
- Review logs regularly (monthly)
- Set alerts for unusual activity
- Document all vendor actions

### 4. Exit Strategy
- Always have a plan to migrate away
- Ensure you can export your data
- Regular data backups independent of vendor
- Know how to terminate and transition

### 5. Contract Protections
- Include security requirements in contracts
- Right to terminate for security breaches
- Liability caps that make sense
- Clear data ownership and return procedures

---

## Vendor Management Templates

### Vendor Onboarding Checklist

```
VENDOR ONBOARDING CHECKLIST

☐ Vendor added to inventory
☐ Risk level determined
☐ Security assessment completed
☐ Risk rating approved
☐ Data Processing Agreement signed
☐ Security requirements communicated
☐ Access credentials created (minimum privilege)
☐ Training provided (if needed)
☐ Monitoring configured
☐ Incident notification contacts exchanged
☐ Backup/exit procedures documented
☐ Review date scheduled

Vendor Name: ___________________________
Onboarding Date: _______________________
Onboarded By: __________________________
```

### Vendor Offboarding Checklist

```
VENDOR OFFBOARDING CHECKLIST

☐ Termination notice sent
☐ All access revoked
☐ Data export completed
☐ Data deletion confirmed
☐ Final payment processed
☐ DPA/archive secured
☐ Removed from vendor inventory
☐ Lessons learned documented
☐ Alternative vendor identified (if still needed)

Vendor Name: ___________________________
Termination Date: ______________________
Data Returned/Deleted: _________________
Offboarded By: _________________________
```

### Vendor Incident Notification Template

```
Subject: URGENT: Security Incident Notification - [Vendor Name]

Dear [Organization Contact],

We are writing to notify you of a security incident that may have affected
your data held by [Vendor Name].

INCIDENT SUMMARY
- Discovery Date: [Date]
- Incident Type: [Breach / Ransomware / Unauthorized Access / Other]
- Systems Affected: [Description]

YOUR DATA
- Data Types Potentially Affected: [List]
- Approximate Number of Records: [Number]
- Date Range of Affected Data: [Dates]

IMMEDIATE ACTIONS TAKEN
1. [Action taken]
2. [Action taken]
3. [Action taken]

INVESTIGATION STATUS
- Current status of investigation: [Ongoing / Complete]
- Law enforcement notified: ☐ Yes ☐ No
- Forensic investigation: ☐ Yes ☐ No

NEXT STEPS
- We will provide updates every [frequency] until resolved
- We are available for call at [phone] or [email]
- We will assist with any notifications required

We sincerely apologize for this incident and are taking all necessary steps
to prevent recurrence.

[Vendor Contact]
[Title]
[Phone]
[Email]
```

---

## Compliance Documentation

### GDPR Article 28 Requirements

**What you must document:**
1. ✅ Vendor name and contact details
2. ✅ Categories of processing (what they do)
3. ✅ Types of personal data involved
4. ✅ Categories of data subjects (donors, volunteers, etc.)
5. ✅ Technical and organizational security measures
6. ✅ Data Processing Agreement signed
7. ✅ Sub-processor list (if applicable)
8. ✅ Transfer safeguards (for international transfers)

### Vendor File Contents

Each vendor should have a file containing:
- ✅ Security assessment questionnaire and responses
- ✅ Risk rating and approval documentation
- ✅ Signed Data Processing Agreement
- ✅ Security certifications (SOC 2, ISO 27001, etc.)
- ✅ Cyber insurance certificate
- ✅ Sub-processor list
- ✅ Annual review records
- ✅ Incident reports (if any)
- ✅ Contract and amendments

---

## Quick Reference

### High-Risk Vendors by Category

**Donor Management:**
- Bloomerang, Little Green Light, Neon CRM, Salesforce Nonprofit Cloud
- **Risk:** HIGH - Contains all donor data
- **Must Have:** DPA, encryption, SOC 2 or equivalent

**Payment Processing:**
- Stripe, PayPal, Square, Network for Good, Classy
- **Risk:** CRITICAL - Handles financial data
- **Must Have:** PCI DSS compliance, DPA, encryption

**Email/Cloud:**
- Google Workspace, Microsoft 365
- **Risk:** HIGH - Contains all organizational data
- **Must Have:** DPA, encryption, strong security

**Email Marketing:**
- Mailchimp, Constant Contact, Emma
- **Risk:** MEDIUM-HIGH - Donor contact info
- **Must Have:** DPA, opt-out compliance

**Accounting:**
- QuickBooks Online, Xero, Sage
- **Risk:** HIGH - Financial and donor data
- **Must Have:** DPA, encryption, access controls

---

## Resources

**Related Documents:**
- **[compliance-quick-guide.md](./compliance-quick-guide.md)** — Data protection compliance
- **[incident-response-plan.md](./incident-response-plan.md)** — Responding to vendor-related breaches

**Useful Standards:**
- [Shared Assessments](https://www.sharedassessments.org) - Standardized vendor assessments
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)
- [ISO 27001](https://www.iso.org/isoiec-27001-information-security.html)

---

**Remember:** Vendor security is your security. Take it seriously, document everything, and review regularly.

**[← Back to Keep Good Records](./README.md)**  
**[← Back to Compliance Guide](./compliance-quick-guide.md)**
