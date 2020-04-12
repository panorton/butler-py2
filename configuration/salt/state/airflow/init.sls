prereqs_pip:
  pkg.latest:
    - pkgs: 
      - python2-pip
      - gcc
      - python-devel
      - python-psycopg2

install_six:
  pip.installed:
    - name: six
    - upgrade: True

install_pandas:
  pip.installed:
    - name:  pandas==0.24.2
    - upgrade: True

install_flask_cache:
  pip.installed: 
    - name: flask_cache
    - upgrade: True

install_werkzeug:
  pip.installed:
    - name: werkzeug==0.12.2
    - upgrade: True
  
install_numpy:
  pip.installed: 
    - name: numpy==1.14.6
    - upgrade: True
    
  
install_airflow:
  pip.installed: 
    - name: apache-airflow==1.8.2
    - upgrade: True
    
install_statsd:
  pip.installed: 
    - name: statsd
    - upgrade: True

airflow_group:
  group.present:
    - name: airflow

airflow_user:
  user.present:
    - name: airflow
    - home: /home/airflow
    - gid_from_name: True
    - empty_password: True
    
{{ pillar['airflow_home'] }}:
  file.directory:    
    - user: airflow
    - group: airflow
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True 

/var/log/airflow:
  file.directory:    
    - user: airflow
    - group: airflow
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True 

{{ pillar['airflow_config'] }}:
  file.managed:
    - source: salt://airflow/config/airflow.cfg
    - user: airflow
    - group: airflow
    - mode: 600
    - makedirs: True
    - template: jinja
    
/etc/sysconfig/airflow:
  file.managed:
    - source: salt://airflow/config/airflow
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - template: jinja
        
/etc/profile.d/set_airflow_env.sh:
  file.managed:
    - source: salt://airflow/config/set_airflow_env.sh
    - user: root
    - group: root
    - mode: 700
    - makedirs: True
    - template: jinja


