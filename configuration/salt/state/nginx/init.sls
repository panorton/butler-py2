allow_nginx_connect:
  selinux.boolean:
    - name: httpd_can_network_connect
    - value: 1
    - persist: true

nginx:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/config/nginx.conf
    - user: root
    - group: root
    - mode: 640
    