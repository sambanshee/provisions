swap-file-cmd:
  cmd.run:
    - name: fallocate -l 512M /opt/swap

swap-file-format:
  cmd.wait:
    - name: mkswap /opt/swap
    - watch:
      - cmd: swap-file-cmd

swap-perm:
  file.managed:
    - name: /opt/swap
    - mode: 600

mount-swap:
  mount.swap:
    - name: /opt/swap
    - persist: True

kernel-swappines:
  sysctl.present:
    - name: vm.swappiness
    - value: 5

{% include 'web/khanifest/users.sls' %}

{% include 'web/khanifest/software/apache.sls' %}
{% include 'web/khanifest/software/mysql.sls' %}

{% include 'web/khanifest/apache.sls' %}
{% include 'web/khanifest/mysql.sls' %}

khanifest-pkg:
  pkg.latest:
    - pkgs:
      - bash
      - mc
      - unzip

{% include 'web/khanifest/software/wordpress.sls' %}

