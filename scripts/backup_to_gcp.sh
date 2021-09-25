# Please run this at root dir (not inside scripts/)
# Please run this at host (not inside container)

BACKUP_BUCKET=test-maxu-daffy

if [ -z "$BACKUP_BUCKET" ]
then
  echo "error: BACKUP_BUCKET not declared"
else
  gsutil rsync -r backups gs://${BACKUP_BUCKET}
fi