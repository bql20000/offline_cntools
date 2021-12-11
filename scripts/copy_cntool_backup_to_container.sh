# copy backup file from local to docker container

# Please run this at root dir (not inside scripts/)
# Please run this at host (not inside container)

BACKUP_FILE=$1
CONTAINER_NAME=cnode    # change if needed

if  [ -z "$BACKUP_FILE" ]  || [ -z "$CONTAINER_NAME" ] 
then
  echo "error: BACKUP_FILE or CONTAINER_NAME not declared"
  exit 0
fi

docker cp backups/cntools/${BACKUP_FILE}  ${CONTAINER_NAME}:/tmp/cnode/cntools/ 