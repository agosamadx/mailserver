# 例
- mail address: userx@example.com(userx@example.jp) usery@example.com(usery@example.jp)
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
HTTP_PORT=80
HTTPS_PORT=443
$ docker compose build
$ docker compose up -d
```
