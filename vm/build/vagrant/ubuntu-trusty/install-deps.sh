#!/bin/bash

set -o nounset
set -o errexit

use_pre_built_projects() {
    local API_WARFILE_PATH=$(ls /vagrant/pre-build/seldon-server-*.war)
    mkdir -p ${INSTALL_DEPS_SELDON_SERVER_HOME}/server/target
    cp -v $API_WARFILE_PATH ${INSTALL_DEPS_SELDON_SERVER_HOME}/server/target/

    local SELDON_SPARK_JARFILE_PATH=$(ls /vagrant/pre-build/seldon-spark-*-with-dependencies.jar)
    mkdir -p ${INSTALL_DEPS_SELDON_SERVER_HOME}/offline-jobs/spark/target
    cp -v $SELDON_SPARK_JARFILE_PATH ${INSTALL_DEPS_SELDON_SERVER_HOME}/offline-jobs/spark/target/
}

STARTUP_DIR="$( cd "$( dirname "$0" )" && pwd )"

export INSTALL_DEPS_DIR=/vagrant/install-deps
export INSTALL_DEPS_DOCKER_USER=vagrant
export INSTALL_DEPS_TOMCAT_HOME=/home/vagrant/apps/tomcat
export INSTALL_DEPS_SPARK_HOME=/home/vagrant/apps/spark
export INSTALL_DEPS_SELDON_SERVER_HOME=/home/vagrant/seldon-server

##${INSTALL_DEPS_DIR}/install-locale.sh
##${INSTALL_DEPS_DIR}/install-linux-image-extra.sh
#${INSTALL_DEPS_DIR}/install-docker.sh
#${INSTALL_DEPS_DIR}/install-vim.sh
#${INSTALL_DEPS_DIR}/install-jdk7.sh
#${INSTALL_DEPS_DIR}/install-tomcat.sh
#${INSTALL_DEPS_DIR}/install-spark.sh
#${INSTALL_DEPS_DIR}/install-bash-profile.sh
#${INSTALL_DEPS_DIR}/install-python-deps.sh
#${INSTALL_DEPS_DIR}/install-misc.sh

use_pre_built_projects
#${INSTALL_DEPS_DIR}/install-seldon-api-webapps.sh

