{% import_yaml 'web/khanifest/databases.yaml' as databases %}

{% for dbname, database in databases.databases.iteritems() %}

{{dbname}}_user:
  mysql_user.present:
    - name: {{ database.username }}
    - host: localhost
    - password: {{ database.password }}
    - connection_user: root
    - connection_pass: {{ databases.root_pw }}
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "ru_RU.utf8"

{{dbname}}_db:
  mysql_database.present:
    - host: localhost
    - name: {{ database.username }}
    - connection_user: root
    - connection_pass: databases.root_pw }}
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "ru_RU.utf8"

{{dbname}}_grants:
  mysql_grants.present:
    - grant: all
    - database: {{ dbname + '.*' }}
    - user: testrail_user
    - host: localhost
    - connection_user: root
    - connection_pass: {{ databases.root_pw }}
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "ru_RU.utf8"

{% endfor %}
