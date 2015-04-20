wordpress-unzip:
  cmd.run:
    - name: unzip -n -qq /opt/wordpress.zip 'wordpress/*' -d /tmp/
    - user: www-data

worpdress-copy:
  cmd.run:
    - name: rsync -avzr /tmp/wordpress/* /opt/khanifest/
    - user: www-data 

wordpress-sample-conf:
  file.absent:
    - name: /opt/www/khanifest/wp-config-sample.php

wordpress-conf:
  file.managed:
    - name: /opt/www/khanifest/wp-config.php
    - source:  salt://web/khanifest/files/wp-config.php
    - user: www-data
    - cwd: /opt/www
    - template: jinja
    - mode: 0600

