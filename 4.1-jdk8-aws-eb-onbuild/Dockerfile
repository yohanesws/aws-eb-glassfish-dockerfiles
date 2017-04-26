FROM        openshift/glassfish:4.1-jdk8

WORKDIR     /var/app

ADD         glassfish-start.sh /

ONBUILD     ADD . /var/app/

RUN chmod -R 777 $GLASSFISH_HOME

CMD         []
ENTRYPOINT  ["/glassfish-start.sh"]
