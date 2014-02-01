/etc/apache2/sites-available/elastic-dash.conf:
  file.symlink:
    - target: /var/www/elastic-dash/config/vhost.conf

/etc/apache2/sites-enabled/elastic-dash.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/elastic-dash.conf