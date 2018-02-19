# ichiwa's MOTD

This is forked from [here](https://github.com/samliu/motd).

![screen shot](./screenshot.png)

## Install

Note: This is an opinionated install. You can achieve installation in other ways
too e.g adding the script to `/etc/update-motd.d` which could be simpler.

1. Copy `dynmotd` to `/usr/local/bin`
2. `chmod +x /usr/local/bin/dynmotd`
3. Disable `/etc/motd` by modifying `/etc/ssh/sshd_config` -- set the following:

   ```
   PrintMotd no
   ```

4. Restart sshd (try `/etc/init.d/sshd restart` or `service sshd restart`)
5. Modify PAM to prevent `/etc/motd` after a successful login by commenting out
   lines like this from `/etc/pam.d/login`:

   ```
   #session    optional    pam_motd.so
   ```

6. Append the following to end of `/etc/profile`

   ```
   /usr/local/bin/dynmotd
   ```
