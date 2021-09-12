# Notes

## Docker

### ARG/ENV trick

Use build-args as ENVs later in the container:  ``docker build --build-arg PG_MAJOR=10``

````
ARG PG_MAJOR
ENV PG_MAJOR=${PG_MAJOR:-11}
````

### ADD or COPY

- Always use `COPY` unless you know you need `ADD`
- `COPY` each file individually to enable best use of layers

### CMD

Provides defaultvalues for the `Entrypoint`:

````
CMD ["executable","param1","param2"]
````

- Could be a script too: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#entrypoint

## Bash

### $@

`$@` is a special variable that expands all passed arguments as strings. Can be used in Scripts to form parameters

````
#/usr/bin/env bash
echo $@
````

````
./script.sh one two three
# output: "one two three"
````

### exec

`exec` is a bash buit-in command that replaces the current shell with the parameter of exec.

````
#/usr/bin/env bash
exec echo "one"
echo "two"
````

````
./script.sh one two three
# output: "one"
````

`echo "two"` never runs because the script gets repaces by `echo one`, which exits after outputting "one".

Funfact: This can be used to use a script as `ENTRYPOINT` [inside a docker container](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#entrypoint).

## VIM

### jump to next occurence of  word under cursor

`*`

### open file in text

- `gf` -> open file in current window
- `:bf` -> go back to previous file
- `STRG+w -> gw` open file in new tab

- `gt` or `STRG+O` -> go to next tab

https://vim.fandom.com/wiki/Using_tab_pages

https://stackoverflow.com/questions/133626/how-do-you-return-from-gf-in-vim

## E-Mail

- https://th-h.de/net/usenet/faqs/headerfaq/#headerzeilen
- https://conference.c3w.at/media/MacLemon_PW18_-_Email_wie_funktioniert_das_eigentlich.pdf
-

### HowTo Newsletter & Header

- https://documentation.mailgun.com/en/latest/user_manual.html#sending-via-smtp
- https://downloads.mailchimp.com/guides/Guide_Deliverability.pdf

#### List-Unsubscribe


to enable one-click unsubscriptions requires
- working *DKIM*
- `List-Unsubscribe-Post` Header
- `List-Unsubscribe` Header

##### links
- https://datatracker.ietf.org/doc/html/rfc8058
- https://certified-senders.org/wp-content/uploads/2017/07/CSA_list_unsubscribe.pdf
- https://help.emarsys.com/hc/de/articles/360016272377-Best-practices-List-Unsubscribe-
- https://mailtrap.io/blog/list-unsubscribe-header/

#### X-Auto-Response-Suppress

Surpresses Auto-Responses from MS Exchange

- https://it.cornell.edu/outlook2016mac-outlook2016win-outlook-web/technical-details-auto-reply-exceptions

### Newsletter/Sending Domains

It's best practice to separate mass-mails from the website. A random collection for reference:

| Website URL                | From                                | Reply-To                     | Return-Path                                                  | Notes                |
| -------------------------- | ----------------------------------- | :--------------------------- | ------------------------------------------------------------ | -------------------- |
| www.humblebundle.com       | contact@mailer.humblebundle.com     | -                            | bounces+<USERNAME>@mailer.humblebundle.com                   |                      |
| www.kik.de                 | newsletter@reply.kik-newsletter.com | -                            | suite11@xpressus.emsmtp.com                                  |                      |
| linuxacademy.com           | marketing@linuxacademy.com          | support@linuxacademy.com     | bounces+<ID>@rp.linux-academy-inc.intercom-mail.com          |                      |
| www.asos.com               | asos@fashion.asos.com               | reply@fashion.asos.com       | asos@fashion.asos.com                                        |                      |
| www.mydealz.de             | nicht-antworten@mydealz.de          | nicht-antworten@mydealz.de   | <UUID>@mail.mydealz.de                                       |                      |
| www.uber.com               | noreply@uber.com                    | -                            | bounces+<HASH>-<USERNAME>@em.uber.com                        |                      |
| linuxfoundation.org        | no-reply@linuxfoundation.org        | no-reply@linuxfoundation.org | <HASH>@8112310m.linuxfoundation.org                          |                      |
| education.github.com       | education@github.com                | education@github.com         | bounce-mc.us<HASH>@mcmail.github.com                         |                      |
| www.qwertee.com            | newsletter@qwertee.com              | newsletter@qwertee.com       | <UUID>@eu-west-1.amazonses.com                               |                      |
| www.mein-grundeinkommen.de | no-reply@mein-grundeinkommen.de     | -                            | SRS0=XZQA12=MO=mailing.mein-grundeinkommen.de=bounces+<HASH>-<USERNAME>=<USER_MAIL>@<USER_DOMAIN> | how does this work?! |

### random header

| Name                     | Value                                              | Found in                        | Notes                                     |
| ------------------------ | -------------------------------------------------- | ------------------------------- | ----------------------------------------- |
| X-Auto-Response-Suppress | OOF, AutoReply                                     | newsletter(linuxacademy,GitHub) | surpresses autoresponses from MS Exchange |
| X-Mailgun-Variables      | app_id,conversation_id,intercom_message_id,user_id | newsletter(linuxacademy)        |                                           |
| X-Report-Abuse           | Please report spam or abuse to abuse@intercom.io   | newsletter(linuxacademy)        |                                           |
| X-Mailgun-Tag            | <ID>                                               | newsletter(linuxacademy)        | mailgun tracking                          |

