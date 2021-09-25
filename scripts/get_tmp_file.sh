# Please run this inside container
# Assumption: Transfer file at /tmp/cnode/cntools between local/remote

FILE_TO_TRANSFER=$1

if [ -z "$FILE_TO_TRANSFER" ]
then
  echo "error: FILE_TO_TRANSFER to declared"
  exit 0
fi

scp ${CORE_HOST}:${TMP_DIR}/${FILE_TO_TRANSFER} ${TMP_DIR}/