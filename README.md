# ------------ RUN IN TERMINAL ___________________________

# run cnode docker container
docker-compose run --name cnode cnode

# to get into container if it's already running
docker exec -it cnode bash

# Copy private key to ssh to core node
docker cp <path to private key> cnode:/home/guild/.ssh/id_rsa
# e.g. docker cp ~/.ssh/cardano-testnet cnode:/home/guild/.ssh/id_rsa


# ------------ RUN IN DOCKER CONTAINER -------------------

# install needed packages
sudo apt-get update
sudo apt-get install -y rsync grsync openssh-client vim dialog


# make sure to have necessary permissions for custom files
sudo chown guild ~/.ssh/*
sudo chown -R guild $CNODE_HOME
sudo chmod +x $CNODE_HOME/scripts/*
sudo chmod +x ~/scripts/*


# redirect to cnode home
cd $CNODE_HOME

# (Optional if run on testnet) 
# Since the image some how cannot regconise correct network, we need to download files from servers
sudo rm -r files/
~/scripts/get_config_files.sh

# (optional) to change env variable, update .env file (local host or in container)
# Then reload the file (inside container)
source ~/.env
