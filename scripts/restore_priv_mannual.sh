# Please run this at root dir (not inside scripts/)
# Please run this at host (not inside container)

export GPG_TTY=$(tty)

BACKUP_FILE=mannual_backup-20210925150730.gpg
BACKUP_BUCKET=test-maxu-daffy

if  [ -z "$BACKUP_FILE" ]  || [ -z "$BACKUP_BUCKET" ] 
then
  echo "error: BACKUP_FILE or BACKUP_BUCKET not declared"
  exit 0
fi

mkdir -p restores/mannual

gsutil cp gs://${BACKUP_BUCKET}/mannual/${BACKUP_FILE} restores/mannual

gpgtar -d restores/mannual/${BACKUP_FILE}