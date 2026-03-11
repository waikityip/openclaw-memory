# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod

### Email

- **My email**: clawandrew81@gmail.com (created by Andrew)
- **Send via**: Gmail SMTP
- **Gmail App Password**: kgvu ckpr skjd xjcp

**Andrew's emails:**
- **Personal (default)**: waikityip@gmail.com ← *Use this if not specified*
- **Work**: wkandrewyip@hkhs.com

**⚠️ 重要提醒**: 發送郵件時使用 `exec` + Python smtplib，例如：
```python
python3 << 'PYEOF'
import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

sender_email = "clawandrew81@gmail.com"
receiver_email = "waikityip@gmail.com"
password = "kgvu ckpr skjd xjcp"

msg = MIMEMultipart()
msg['From'] = sender_email
msg['To'] = receiver_email
msg['Subject'] = "Subject here"
msg.attach(MIMEText("Body here", 'plain', 'utf-8'))

context = ssl.create_default_context()
with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
    server.login(sender_email, password)
    server.sendmail(sender_email, receiver_email, msg.as_string())
print("Email sent successfully")
PYEOF
```
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.
