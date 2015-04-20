wordpress-unzip:
  cmd.run:
    - name: unzip -qq /opt/wordpress.zip 'wordpress/*' /opt/www/khanifest/
    - user: www-data


