java:
    pkg.installed:
        - name: openjdk-7-jre-headless


elasticsearch:
    cmd.run:
        - name: wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.9.deb
        - unless: dpkg -i elasticsearch-0.90.9.deb
        - name: /usr/share/elasticsearch/bin/plugin -i elasticsearch/marvel/latest
    pkg:
        - installed
    service.running:
        - refresh: True
        - enable: True
        - reload: True

