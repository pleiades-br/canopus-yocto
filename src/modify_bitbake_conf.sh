#!/bin/bash

# bitbake Local conf
ENV_FILE="local.conf"

VAR_NAME="    verdin-imx8mp "

# New variable value
NEW_VALUE="    verdin-imx8mp plds-verdin-imx8mp-canopus"

echo $(pwd)

# Look if we are in the correct dir that contain the file
if [ ! -f "$ENV_FILE" ]; then
  echo "File $ENV_FILE not found! Check if we are the correct directory"
  exit 1
fi

# Do variable upgrade
sed -i.bak "s/^${VAR_NAME}.*/${NEW_VALUE} \\\/" "$ENV_FILE"

# Just Look if everything went fine
if grep -q "^${NEW_VALUE}" "$ENV_FILE"; then
  echo "$VAR_NAME was sucesseful modified to $NEW_VALUE in $ENV_FILE."
else
  echo "We could find $VAR_NAME inside $ENV_FILE."
  exit 1
fi

# Add compile customization at the end of the file
echo "Adding compile configuration customization (ACCEPT_FSL_EULA / BB_NUMBER_THREADS / PARALLEL_MAKE)"
echo ACCEPT_FSL_EULA = \"1\" >> $ENV_FILE
echo BB_NUMBER_THREADS = \"4\" >> $ENV_FILE
echo PARALLEL_MAKE = \"-j 2\" >> $ENV_FILE

echo "Finish job modifying local.conf"
