{% load_yaml 'web/khanifest/users.yaml' as users_yaml -}
{% for user in users_yaml %}
user-present-{{user.name}}:
  user.present:
    - name: {{user.name}}
    - shell: /bin/bash
    - home: /home/{{user.name}}
    - fullname: {{user.name}}
    - password: '{{user.password}}'
    - groups:
      - sudo
      - admin
{% endfor %}
