#!/bin/bash

mkdir ${HOME}/oe-core
cd ${HOME}/oe-core
repo init -u git://git.toradex.com/toradex-manifest.git -b kirkstone-6.x.y -m tdxref/default.xml
repo sync