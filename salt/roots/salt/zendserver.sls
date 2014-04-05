zendserver:
    cmd.run:
        - name: echo 'deb http://repos.zend.com/zend-server/deb server non-free' >> /etc/apt/sources.list
        - name: wget http://repos.zend.com/zend.key -O- |apt-key add -
        - name: aptitude update
        - name: aptitude install zend-server-php-5.3
    pkg:
        - installed
    service.running:
        - refresh: True
        - enable: True
        - reload: True