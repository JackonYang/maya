# django APP
# do not operate database in APP's docker
# for there would be several apps, sharing one database
#
FROM python:2.7
MAINTAINER JackonYang <i@jackon.me>

# http://stackoverflow.com/questions/23524976/capturing-output-of-python-script-run-inside-a-docker-container
ENV PYTHONUNBUFFERED=0


# https://docs.docker.com/engine/reference/builder/#arg
ARG PIP_HOST=mirrors.aliyun.com
ARG PIP_ROOT_URL=http://mirrors.aliyun.com/pypi/simple/


RUN apt-get update
RUN apt-get install -y supervisor


RUN mkdir ~/.pip/
RUN echo "[global]" > ~/.pip/pip.conf
RUN echo "index-url = $PIP_ROOT_URL" >> ~/.pip/pip.conf
RUN echo "[install]" >> ~/.pip/pip.conf
RUN echo "trusted-host = $PIP_HOST" >> ~/.pip/pip.conf


# upgrade pip to latest version
RUN pip install --upgrade pip

# python packages

# https://www.djangoproject.com/download/#supported-versions
RUN pip install django==1.11.8

# restful framework
# http://www.django-rest-framework.org/topics/release-notes/
RUN pip install djangorestframework==3.7.3
# https://pypi.python.org/pypi/Markdown
RUN pip install markdown==2.6.10
# https://github.com/carltongibson/django-filter/releases
RUN pip install django-filter==1.1

# unittest
# https://docs.pytest.org/en/latest/changelog.html
RUN pip install pytest==3.3.1
# https://pytest-cov.readthedocs.io/en/latest/changelog.html
RUN pip install pytest-cov==2.5.1
# https://pytest-django.readthedocs.io/en/latest/changelog.html
RUN pip install pytest-django==3.1.2

# https://niwinz.github.io/django-redis/latest/#_supported_django_redis_versions
RUN pip install django-redis==4.8.0
RUN pip install pymongo==3.7.0

RUN pip install requests==2.17.3

RUN pip install lxml==4.2.3
RUN pip install bleach==2.0.0


# RUN pip install django-grappelli==2.8.1
# RUN pip install rollbar==0.13.8

COPY ./requirements.txt /src/requirements.txt
WORKDIR /src

# ADD deploy/supervisor/* /etc/supervisor/conf.d/

RUN pip install -r requirements.txt
