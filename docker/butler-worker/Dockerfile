#
# When running this container, you will need to set the following options in 
# your "docker run":
# --add-host postgresql.service.consul:<IP_ADDRESS>
# --add-host rabbitmq.service.consul:<IP_ADDRESS>
#

FROM centos:centos7
MAINTAINER Paul Norton panorton@sdsc.edu

RUN yum -y -q --nogpgcheck install epel-release git postgresql-devel python-psycopg2 python-devel gcc

RUN yum -y -q --nogpgcheck install python2-pip
RUN pip install pip==9.0.3
RUN pip install -U setuptools==43.0.0

# Install Celery
RUN pip install wheel 
RUN pip install Celery 
RUN pip install celery[librabbitmq] 
RUN pip install flower

# Install Airflow
RUN pip install six 
RUN pip install pandas==0.24.2 
RUN pip install flask_cache 
RUN pip install numpy==1.14.6 
RUN pip install apache-airflow==1.8.2 
RUN pip install statsd

# Roll back to older werkzeug for Airflow 1.8.2
RUN pip install werkzeug==0.12.2

# Install cwltool
RUN pip install networkx==2.2
RUN pip install cwlref-runner
RUN pip install schema-salad

# Airflow setup
RUN adduser airflow
RUN mkdir /opt/airflow
RUN chown -R airflow.airflow /opt/airflow
RUN mkdir /var/log/airflow
RUN chown -R airflow.airflow /var/log/airflow
RUN mkdir -p /etc/opt/airflow/dags
COPY airflow.cfg /etc/opt/airflow/airflow.cfg
ADD example-workflows /etc/opt/airflow/dags
RUN chown -R airflow.airflow /etc/opt/airflow
COPY set_airflow_env.sh /etc/profile.d/set_airflow_env.sh

# Butler Tracker setup
RUN mkdir /opt/butler
ADD track /opt/butler
RUN pip install -e /opt/butler/track
RUN ln -s /opt/butler/track/tracker/bin/butler /usr/bin/butler