# ichiwa's MOTD

This is forked from [here](https://github.com/samliu/motd).

![screen shot](./screenshot.png)

## Install

Note: This is an opinionated install. You can achieve installation in other ways
too e.g adding the script to `/etc/update-motd.d` which could be simpler.

1. `cp ./dynmotd.sh /usr/local/bin/`
2. `chmod +x /usr/local/bin/dynmotd`
3. `mv /usr/local/bin/dynmotd.sh 30-banner`
4. `update-motd --force`
