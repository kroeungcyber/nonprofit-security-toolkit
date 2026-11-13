# Case Study: Regional Food Pantry Network — Stopping an AI Voice-Clone Wire Fraud Attempt

## Organization Profile

| Attribute | Details |
|-----------|---------|
| **Organization Type** | Regional Food Pantry Network |
| **Size** | 12 paid staff, 40+ regular volunteers |
| **Annual Budget** | $650,000 |
| **Tech Environment** | Google Workspace, QuickBooks Online, donor CRM, 8 shared laptops |
| **Location** | Mid-size metro area, USA |
| **Website** | riversidefoodpantry.example (name changed for privacy) |

---

## The Situation (Before)

Riverside had already done the basics. A year earlier they'd worked through this toolkit's [Implementation Playbook](../IMPLEMENTATION_PLAYBOOK.md): Bitwarden was deployed org-wide, 2FA was enabled on all admin accounts, SPF/DKIM/DMARC were configured, and every new hire got the phishing training in the [Volunteer Training Guide](../02-secure-your-email/volunteer-training-guide.md).

**Their Security Assessment before the incident:**

✅ Passwords & Accounts — Strong
✅ Email Security — Strong
✅ Device Security — Strong
🟡 Documentation & Processes — Needs Attention (no incident response plan yet)
🟡 Privacy & Compliance — Needs Attention (no verification protocol for financial requests)

They felt confident. Their training covered classic phishing red flags — urgent language, generic greetings, suspicious links. What it hadn't covered yet: what happens when the "urgent request" arrives as a phone call in a voice that sounds exactly like the Executive Director.

### The Incident

On a Tuesday afternoon, Maria, the bookkeeper, received a phone call. Caller ID showed an unfamiliar number, but the voice on the line was unmistakably their Executive Director, David — same tone, same slight rasp, even his habit of clearing his throat before making a request.

"Maria, I'm in the middle of finalizing the new refrigeration truck deal with the vendor and I need you to wire $18,000 today to secure the contract before the price goes up. I'm about to lose cell signal in this warehouse — text me once it's done, don't call, I won't be able to pick up."

The request wasn't outlandish — Riverside *was* in the middle of shopping for a refrigerated delivery truck, information that had been mentioned in a recent newsletter and a local news interview featuring David, which included several minutes of him speaking on camera.

Maria almost proceeded. The voice was right. The context was right. The urgency felt real.

**What stopped her:** three months earlier, Riverside had updated their training using this toolkit's guidance on AI-era threats — specifically the rule that *a familiar voice is not proof of identity*, and that any financial request must be verified through a channel other than the one it arrived on, using a phone number already on file rather than calling back the number that had just called her.

Maria didn't call back the number. She texted David's assistant on a separate, known number: "Did David just call me about a wire transfer?" The reply came back within two minutes: "No — David's been in a board meeting since 1pm with his phone off."

No funds were transferred.

---

## The Implementation

### Immediate Response (Same Day) — 45 minutes

- Maria ended the call without providing any information or confirming account details
- She reported the call to the Incident Commander (the Executive Director's assistant, per their new [Incident Response Plan](../05-keep-good-records/incident-response-plan.md)) within 10 minutes
- The team followed the newly added **Playbook 5: Suspected AI Voice/Video Impersonation** — documented the caller's number, the exact wording used, and the platform (a spoofed local number)
- No money moved, no credentials were shared — so no regulatory notification was required, but the incident was logged for pattern tracking

### Follow-Up (Week 1) — 3 hours

**Formalized a verbal safe word (30 minutes)**
Riverside adopted a safe word known only to staff who could authorize financial transactions. Any urgent request to move money — by phone, video, or email — now requires the safe word before action, regardless of how convincing the caller sounds.

**Required dual approval for wire transfers (1 hour)**
Previously, David alone could authorize wires under $25,000. They changed policy so any wire transfer, regardless of amount, requires sign-off from two people — David and the Board Treasurer — confirmed through separate channels.

**Retrained the whole team (1.5 hours)**
Using the updated [Volunteer Training Guide](../02-secure-your-email/volunteer-training-guide.md) section on AI-changed threats, they ran a session for all staff and key volunteers covering:
- Why grammar/tone/voice are no longer reliable identity signals
- The second-channel verification rule
- The new safe word procedure
- A live replay of Maria's call (with her permission) as the training example

### Ongoing (Month 1+)

- Reviewed public-facing video/audio content (news interviews, webinars, recorded board meetings) and discussed reducing how much extended, clean audio of leadership voices was publicly available — while balancing the org's need for public visibility and fundraising
- Added "AI voice/video impersonation" to the quarterly refresher training rotation
- Updated the [Vendor Security Assessment](../05-keep-good-records/vendor-security-assessment.md) process to flag if any vendor communications channel could plausibly be spoofed

---

## Results

| Metric | Before | After |
|--------|:------:|:-----:|
| Verification protocol for financial requests | None | Second-channel verification + safe word required |
| Wire transfer authorization | Single approver | Dual approval, any amount |
| AI impersonation awareness training | Not covered | Included in onboarding + quarterly refresher |
| Documented incident response for deepfake/impersonation | None | Playbook 5 in Incident Response Plan |
| Financial loss from this incident | — | **$0** |

**Time invested:** ~4 hours total (response + policy update + retraining)
**Cost:** $0

---

## Challenges & Solutions

### Challenge 1: Staff Skepticism ("That Sounds Like Science Fiction")

**The Problem:** Some volunteers initially found it hard to believe a voice could be convincingly cloned from public recordings.

**The Solution:** Playing back a short, consented AI-voice-clone demo (created from David's own public interview clip, with his permission, for training purposes only) made the risk immediately concrete. After hearing it, skepticism disappeared.

### Challenge 2: Balancing Public Visibility with Impersonation Risk

**The Problem:** Riverside relies on media interviews and public speaking for fundraising and visibility — exactly the kind of content that makes voice cloning easier.

**The Solution:** They didn't stop doing outreach. Instead, they accepted the exposure as a fact of operating publicly and focused entirely on the verification protocol, since that protects against impersonation regardless of how much audio exists publicly.

### Challenge 3: "Won't Dual Approval Slow Us Down?"

**The Problem:** David worried requiring two approvers for every wire would create bottlenecks during genuinely urgent situations.

**The Solution:** They pre-authorized the Board Treasurer with a mobile approval process (a two-line text confirmation) so dual approval typically adds under 15 minutes — far less than the cost of a successful fraud attempt.

---

## What Worked Well

✅ **The second-channel verification rule** — the single change that stopped the fraud attempt cold, despite a highly convincing voice clone.

✅ **A pre-established safe word** — removed all ambiguity; if the caller can't provide it, the request is not legitimate, full stop.

✅ **Training before the incident, not after** — Riverside had updated their training weeks before this call came in. Had they waited, the outcome could have been very different.

✅ **A documented incident response playbook** — Maria knew exactly who to notify and what to record, even though nothing was actually lost.

---

## What They'd Do Differently

🔄 **Would have added the verification protocol sooner** — it existed as guidance in this toolkit for months before Riverside adopted it; they now review new toolkit updates quarterly instead of annually.

🔄 **Would loop in the Board Treasurer on dual-approval setup earlier** — some initial friction could have been avoided with more advance notice.

---

## Maria's Advice to Other Non-Profits

> "I almost sent that money. The voice was perfect — pauses, tone, even a laugh that sounded exactly like him. If I hadn't had a specific rule to follow — text a different number, don't call the one that just called me — I honestly don't know if I would have caught it in time.
>
> Don't train your team to spot 'weird' emails anymore. Train them to always verify money requests through a second channel, no matter how real the request sounds or looks. That's the only thing that still works."

---

## Next Steps for Riverside

- [ ] Extend dual-approval requirement to gift card purchases and vendor payment changes
- [ ] Run an announced simulated AI-voice-clone test with staff consent
- [ ] Review public video/audio footprint annually as part of the vendor/media review cycle
- [ ] Security assessment re-take with the updated AI-threat questions

---

**Questions about this case study?**
Open an issue or contribute your own story!

**[← Back to Case Studies](./README.md)**
