# Canopus Yocto compiles the container

## Overview
This repository is used to maintain the docker container responsible for compiling the Yocto image for the Canopus board. Also included scripts to download all the repositories and do the initial configuration for Bitbake


## Features
- Ubuntu Container with all necessary packages to make a clean Yocto compilation
- Scripts to make almost one click download and Yocto configuration for Canopus board. 

## Usage
You will need docker installed in your system to use this repository. 
After downloading and properly installing Docker, access the repository folder and execute the command below to build the container. 
If you use VS Code, you can use the dev containers extension to do the next steps for you

```bash
docker build -f ./devcontainer/Dockerfile
```

And to access the container after the build is finished.

```bash
docker exec -it <mycontainer> bash
```

Inside the container, execute the following commands below to download and configure the yocto
```bash
cd /workspace/canopus-yocto/
./init_toradex_kirkstone.sh
./bitbake_conf.sh
```

### Compile the image
Be sure to have at least 40GB of free space in your hard driver before executing the command
To compile the image, just insert the commands below:
```bash
cd /home/developer/oe-core
. export
MACHINE="plds-verdin-imx8mp-canopus" bitbake tdx-reference-multimedia-image
```
The compilation will take a while, so grab your ☕ and take a 🚶
```bash
ls /home/developer/oe-core/build/deploy/images/plds-verdin-imx8mp-canopus/
```

After finishing the image will be found inside the directory below

## Dependencies
- Docker
- A bit of Yocto knowledge
## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License 
This project is licensed under the MIT License - see the LICENSE file for details.
