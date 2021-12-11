# outdated since we're not using GCP anymore

# Please run this at root dir (not inside scripts/)
# Please run this at host (not inside container)

BACKUP_BUCKET=

if [ -z "$BACKUP_BUCKET" ]
then
  echo "error: BACKUP_BUCKET not declared"
  exit 0
fi
  
gsutil rsync -r backups gs://${BACKUP_BUCKET}
