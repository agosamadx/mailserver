# 例
- mail address: user1@example.com(user1@example.jp) user2@example.com(user2@example.jp)
- mx record: mail.example.com
- smtp: smtp.example.com
- imap: imap.example.com
- webmail: mail.example.com
```
$ mv dot.env.sample .env
$ vi .env
MAIL_DOMAIN=example.com
MX_DOMAIN=mail.example.com
SMTP_DOMAIN=smtp.example.com
IMAP_DOMAIN=imap.example.com
USERS=userx:passwordx usery:passwordy
ADDITIONAL_MAIL_DOMAINS=example.jp
$ docker compose build
$ docker compose up -d
```
