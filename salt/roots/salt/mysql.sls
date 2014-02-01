mysql:
    pkg.installed:
        - name: mysql-server
    service:
        - running
        - enable: True
        - reload: True
        - watch:
            - pkg: mysql

mysql-client:
    pkg:
        - installed

mysql-conf:
    cmd.run:
        - name: sed -i "s/bind-address.*=.*/bind-address=0.0.0.0/" /etc/mysql/my.cnf
        - unless: dpkg -i elasticsearch-0.90.9.deb