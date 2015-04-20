wordpress-unzip:
  cmd.run:
    - name: unzip -qq /srv/salt/web/khanifest/files/wordpress.zip /opt/www/khanifest/
    - user: www-data


