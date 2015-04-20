wordpress-unzip:
  cmd.run:
    - name: unzip -qq /opt/wordpress.zip 'wordpress/*' -d /opt/www/khanifest/
    - user: www-data


