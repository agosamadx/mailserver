#
- mail address: user@example.com
- smtp: mail.example.com
- imap: mail.example.com
```
$ mv dot.env.sample .env
$ vi .env
MAIL_DOMAIN=example.com
MAIL_SERVER_DOMAIN=mail.example.com
USERS=userx:passwordx usery:passwordy
$ docker-compose build
$ docker-compose up -d
```
