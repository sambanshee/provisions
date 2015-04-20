apache-files-absent:
  file.absent:
    - names:
      - /etc/apache2/conf-enabled/serve-cgi-bin.conf
      - /etc/apache2/sites-enabled/000-default.conf 

khanifest-dir:
  file.directory:
    - name: /opt/www/khanifest
    - user: www-data
    - group: www-data
    - makedirs: True
    - recurse:
      - user
      - group

khanifest-conf:
  file.managed:
    - name: /etc/apache2/sites-enabled/khanifest.conf
    - source: salt://web/khanifest/files/khanifest.conf
    - template: jinja

apache-service:
  service.running:
    - name: apache2
    - enbale: True
    - watch:
      - file: khanifest-conf
