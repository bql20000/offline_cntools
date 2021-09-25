## Setup - RUN IN TERMINAL

1. Copy config example files and edit correctly
```
cp .env.example .env
cp samples/config.example samples/config
```

2a. Run cnode docker container
```
docker-compose run --name cnode cnode
```

2b. To get into container if it's already running
```
docker exec -it cnode bash
```

3. Copy private key to ssh to core node
```
docker cp <path to private key> cnode:/home/guild/.ssh/id_rsa
``` 

Example: 
```
docker cp ~/.ssh/google_compute_engine cnode:/home/guild/.ssh/id_rsa
```


## Setup - RUN IN DOCKER CONTAINER

1. Install needed packages
```
sudo apt-get update
sudo apt-get install -y rsync grsync openssh-client vim dialog
```

2. Make sure to have necessary permissions for custom files
```
sudo chown guild ~/.ssh/*
sudo chown -R guild $CNODE_HOME
sudo chmod +x $CNODE_HOME/scripts/*
sudo chmod +x ~/scripts/*
```

3. Redirect to cnode home
```
cd $CNODE_HOME
```

3. (Optional, testnet only) Since the image some how cannot regconise correct network, we need to download files from servers
```
sudo rm -r files/
~/scripts/get_config_files.sh
```

## Usage - SCRIPT EXPLAIN

### Scripts run on host

0. Notes
  - Please execute scripts at repo root directory. (not inside `scripts/` folder)

1. Backup `priv/` folder using CNTools
  - Execute backup function in Container's CNTools
  - Make sure `CONTAINER_NAME` is set correctly
  - Execute `scripts/backup_priv_cntools.sh <backup file name>` to copy the file to `backups/cntools` 

2. Backup `priv/`folder mannually
  - Execute `scripts/backup_priv_mannual.sh` to copy the file to `backups/mannual`  

3. Store backups to Cloud Storage (GCP)

  - Beforehands, make sure to install `gsutil` and configured correctly. Also, set the BACKUP_BUCKET name correctly.

```
scripts/sync_backup_to_gcp.sh
```

4. Restore mannual backup

Set the `BACKUP_FILE` and `BACKUP_BUCKET` correctly, then
```
scripts/restore_priv_mannual.sh
```

5. Restore CNTools backup

To be added ...

### Scripts run inside container

4. Send/Receive tmp files to/from remote server (core node).

  - Notes: Transfer file at `/tmp/cnode/cntools` between local/remote
  - Send to remote:
```
~/scripts/send_tmp_file.sh <tmp file name>
```

  - Get file from remote:
```
~/scripts/get_tmp_file.sh <tmp file name>
```

5. Send rotated files to remote:

First use CNTools to rotate necessary files. Then,
```
~/scripts/send_rotated_files.sh
```
