#!/bin/sh

PID_FILE=$GLASSFISH_HOME/glassfish/domains/domain1/config/pid

# when deploying a directory, Glassfish expect all submodules to be extracted
# which is usually not the case for EARs
# zip app back into a bundle and let Glassfish handle it

if ! [ -z $GLASSFISH_LIB_FOLDER ];then
  cp $GLASSFISH_LIB_FOLDER/* $GLASSFISH_HOME/glassfish/domains/domain1/lib
fi

if ! [ -z $GLASSFISH_CONFIG ];then
  cp $GLASSFISH_CONFIG/* $GLASSFISH_HOME/glassfish/domains/domain1/config
fi

asadmin start-domain
# asadmin deploy --contextroot / --name current-app /var/app.zip
#read db config value


if ! [ -z $GLASSFISH_APP_FOLDER ];then
  cp $GLASSFISH_APP_FOLDER/* $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy
fi

inotifywait -qq -e delete_self $PID_FILE
