# Mannually backup entire priv/ folder 

# Please run this at root dir (not inside scripts/)
# Please run this at host (not inside container)

export GPG_TTY=$(tty)

mkdir -p backups/mannual

CURRENT_EPOCH_TIME=`date +%Y%m%d%H%M%S`
BACKUP_FILE="mannual_backup-${CURRENT_EPOCH_TIME}.gpg"

gpgtar -ec -o backups/mannual/${BACKUP_FILE} priv

echo "Latest mannual backup file: ${BACKUP_FILE}"

