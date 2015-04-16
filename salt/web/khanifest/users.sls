{% import_yaml 'web/khanifest/users.yaml' as users_yaml %}
{% for username, user in users_yaml.iteritems() %}
user-present-{{user.name}}:
  user.present:
    - name: {{user.name}}
    - shell: /bin/bash
    - home: /home/{{user.name}}
    - fullname: {{user.name}}
    - password: '{{user.password}}'
    - groups:
      - sudo
{% endfor %}
