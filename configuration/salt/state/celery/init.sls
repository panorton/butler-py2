install_werkzeug:
  pip.installed:
    - name: werkzeug==0.12.2

celery_install_wheel:
  pip.installed: 
    - name: wheel
    - upgrade: True

install_celery:
  pip.installed: 
    - name: Celery
    - upgrade: True
    
install_celery_bundles:
  pip.installed:
    - name: celery[librabbitmq]

install_celery_flower:
  pip.installed:
    - name: flower
    - upgrade: True
    
postgres-devel:
  pkg.installed:
    - name: postgresql-devel
    
python-psycopg2:
  pkg.installed:
    - name: python-psycopg2