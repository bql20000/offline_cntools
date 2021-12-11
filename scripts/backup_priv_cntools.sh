# Mannually backup entire priv/ folder 

# Please backup inside container first and make sure
# /tmp/cnode/cntools/<backup file> exist

# Please run this at root dir (not inside scripts/)
# Please run this at host (not inside container)


mkdir -p backups/cntools

BACKUP_FILE=$1
CONTAINER_NAME=cnode    # change if needed

if  [ -z "$BACKUP_FILE" ]  || [ -z "$CONTAINER_NAME" ] 
then
  echo "error: BACKUP_FILE or CONTAINER_NAME not declared"
  exit 0
fi

docker cp ${CONTAINER_NAME}:/tmp/cnode/cntools/${BACKUP_FILE} backups/cntools

echo "Latest cntools backup file: ${BACKUP_FILE}"