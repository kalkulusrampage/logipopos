[Unit]
Description=Logitech Configuration Daemon
StartLimitIntervalSec=0
After=multi-user.target
Wants=multi-user.target

[Service]
Type=simple
ExecStart=${CMAKE_INSTALL_PREFIX}/bin/logid --config $ENV{HOME}/.config/logipopos/logid.cfg
User=root
ExecReload=/bin/kill -HUP $MAINPID
Restart=on-failure

[Install]
WantedBy=graphical.target
