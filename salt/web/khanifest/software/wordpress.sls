wordpress-unzip:
  cmd.run:
    - name: unzip -n -qq /opt/wordpress.zip 'wordpress/*' -d /opt/www/khanifest/
    - user: www-data

wordpress-sample-conf:
  file.absent:
    - name: /opt/www/khanifest/wordpress/wp-config-sample.php

wordpress-conf:
  file.managed:
    - name: /opt/www/khanifest/wp-config.php
    - source:  salt://web/khanifest/files/wp-config.php
    - user: www-data
    - template: jinja
    - mode: 0600

