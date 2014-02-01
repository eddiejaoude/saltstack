apache2:
    pkg:
        - installed
    service:
        - running
        - enable: True
        - reload: True
        - watch:
            - pkg: apache2
            - file: /etc/apache2/sites-available/elastic-dash.conf

apache2-modrewrite:
    cmd.run:
        - name: |
            a2enmod rewrite
            service apache2 restart

php5_ppa:
  pkgrepo.managed:
    - ppa: ondrej/php5

php5:
    pkg.latest:
        - refresh: True
        - require:
            - pkgrepo: php5_ppa

php5-pkgs:
    pkg.installed:
        - names:
              - php5-mysql
              - php5-curl
              - php5-cli
              - php5-cgi
              - php5-dev
              - php-pear
              - php5-gd

