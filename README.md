# ichiwa's MOTD

This is forked from [here](https://github.com/samliu/motd).

![screen shot](./screenshot.png)

## Install

Note: This is an opinionated install. You can achieve installation in other ways
too e.g adding the script to `/etc/update-motd.d` which could be simpler.

1. `cp ./dynmotd.sh /usr/local/bin/`
2. Update your banner text.
3. `chmod +x /usr/local/bin/dynmotd`
4. `mv /usr/local/bin/dynmotd.sh /etc/update-motd.d/30-banner`
5. `update-motd --force`
