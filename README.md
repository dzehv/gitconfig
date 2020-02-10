# Git configurations

## Install client pretty settings

``` bash
./git-cli/gitconfig_global.sh
```


## Install git daemon service

Example daemon systemd configuration at file 'git-daemon/git-daemon.service'

```
[Unit]
Description=Start Git Daemon

[Service]
ExecStart=/usr/bin/git daemon --reuseaddr --base-path=/home/git/ /home/git/

Restart=always
RestartSec=500ms

StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=git-daemon

User=git
Group=git

[Install]
WantedBy=multi-user.target
```

Copy file...

``` bash
cp git-daemon/git-daemon.service /etc/systemd/system/git-daemon.service
```

### Enable and start daemon at port 9418

``` bash
systemctl enable git-daemon
systemctl start git-daemon
systemctl status git-daemon
...
```

### Let daemon see bare repository (allow unauthenticated Git server-based access to)

We have installed daemon to watch '/home/git' path as service root

``` bash
cd /home/git/project.git
touch git-daemon-export-ok
```

#### Example of local clone by git:// daemon's protocol

``` bash
git clone git://localhost/project.git
```

## Example configuring gitlabs usage for 'go get'

go get usage for private repositories

``` bash
git config --global url."git@some.addr.com:".insteadOf "https://some.addr.com/"
```
