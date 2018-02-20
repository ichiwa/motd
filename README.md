# ichiwa's MOTD

This is forked from [here](https://github.com/samliu/motd).

![screen shot](./screenshot.png)

## Usage

1. `git clone https://github.com/ichiwa/motd.git`
2. `chmod +x ./motd/dynmotd.sh`
3. `mv ./motd/dynmotd.sh /etc/update-motd.d/30-banner`
4. Set your `hostname`.
5. [Create AA](http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=DEV) and update your banner.
6. `update-motd --force`

### Appendix

```crontab
*/5 * * * * /usr/sbin/update-motd --force
```
