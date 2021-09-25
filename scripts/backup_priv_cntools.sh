# Please backup inside container first and make sure
# /tmp/cnode/cntools/<backup file> exist

# Please run this at root dir (not inside scripts/)
# Please run this at host (not inside container)


mkdir -p backups/cntools

BACKUP_FILE=online_cntools_backup-20210919135707.tar.gz
CONTAINER_NAME=cnode

if  [ -z "$BACKUP_FILE" ]  || [ -z "$CONTAINER_NAME" ] 
then
  echo "error: BACKUP_FILE or CONTAINER_NAME not declared"
else
  docker cp $CONTAINER_NAME:/tmp/cnode/cntools/$BACKUP_FILE backups/cntools
  echo "Latest cntools backup file: ${BACKUP_FILE}"
fi