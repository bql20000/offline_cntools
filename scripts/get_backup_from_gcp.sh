# Please run this at root dir (not inside scripts/)
# Please run this at host (not inside container)

BACKUP_BUCKET=

if [ -z "$BACKUP_BUCKET" ]
then
  echo "error: BACKUP_BUCKET not declared"
  exit 0
fi

mkdir -p backups
  
gsutil rsync -r gs://${BACKUP_BUCKET} backups
