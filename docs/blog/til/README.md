# Today I learned

## 10.05.20
!> Don't use exit(0) during development!

Exitcode 0 doesn't trigger the CI to fail! I used it during development and pushed it to production. Ouch.

## 15.01.20
!> When stuck while debugging: change user/privileges!

Shell Script failed. Tested it as root without any issues, changing the user to a non-root immediately gave enough hints to solve the issue.
Test with a non-root user when stuck!


## 18.12.19
!> Have replacement Parts on premise!

Non ATX PSU failed - older machine, no replacement on hand. 24h shipping was delayed; no 2. to ship in stock.
It can be cheaper to buy replacement parts you never need.

## 19.05.19
!> Don't be afraid! Just ship the MVP!

Even after I thought [admindojo.org](https://admindojo.org) was ready for public, it took me days to publish a post at [reddit](https://www.reddit.com/r/linuxadmin/comments/bq4v33/admindojoorg_handson_sysadmin_training_feedback/) or hackernews.
After finally publishing posts, it only got [a single comment at hackernews](https://news.ycombinator.com/item?id=19949053). I was so afraid, that I totally forgot how hard it is to even get feedback.
The feedback is worth it! Don't wait to get it.


## 01.05.19
!> Check the file format while debugging config files!

After debugging a configuration, I finally noticed that the configuration file had the wrong extension. Even when the content is almost the same - even Linux tools will handle `$.ini` different than  `$.conf`.


