wordpress-unzip:
  cmd.run:
    - name: unzip -qq /opt/wordpress.zip 'wordpress/*' -d /opt/www/khanifest/
    - user: www-data

wordpress-sample-conf:
  file.absent:
    - name: /opt/www/khanifest/wordpress/wp-config-sample.php

wordpress-conf:
  file.managed:
    - name: salt://web/khanifest/files//wp-config.php
    - user: www-data
    - template: jinja
    - mode: 0600

