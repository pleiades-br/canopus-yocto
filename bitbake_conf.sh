#!/bin/bash

BITBAKE_DIR="${HOME}/oe-core"
ROOT_DIR=$(pwd)

if [ ! -d "${BITBAKE_DIR}" ]; then
  echo "${BITBAKE_DIR} does not exist."
  exit 1
fi

echo " Cloning meta-pleiades..."
cd ${BITBAKE_DIR}/layers
git clone https://github.com/pleiades-br/meta-pleiades.git
git clone https://github.com/pleiades-br/meta-pleiades-canopus.git
git clone --single-branch --branch kirkstone https://git.yoctoproject.org/meta-tensorflow



echo " Copying image_type_tezi.bbclass from meta-pleaides to toradex..."
if [ ! -f "${BITBAKE_DIR}/layers/meta-toradex-bsp-common/classes/image_type_tezi.bbclass" ]; then
  echo "File image_type_tezi.bbclass not found, are you shure you init toradex repo?"
  exit 1
fi

cp ${BITBAKE_DIR}/layers/meta-pleiades-canopus/classes/image_type_tezi.bbclass ${BITBAKE_DIR}/layers/meta-toradex-bsp-common/classes/image_type_tezi.bbclass



echo " Creating build dir..."
cd ${BITBAKE_DIR}
. export 
bitbake-layers add-layer ${BITBAKE_DIR}/layers/meta-pleiades/
bitbake-layers add-layer ${BITBAKE_DIR}/layers/meta-pleiades-canopus/
bitbake-layers add-layer ${BITBAKE_DIR}/layers/meta-tensorflow
cd ${BITBAKE_DIR}/build/conf
${ROOT_DIR}/src/modify_bitbake_conf.sh



