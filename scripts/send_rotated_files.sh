# Please run this inside container

HOT_SKEY=${CNODE_HOME}/priv/pool/${POOL_NAME}/hot.skey
OP_CERT=${CNODE_HOME}/priv/pool/${POOL_NAME}/op.cert
POOL_DIR=${CNODE_HOME}/priv/pool/${POOL_NAME}


scp ${HOT_SKEY} ${CORE_HOST}:${POOL_DIR}
scp ${OP_CERT} ${CORE_HOST}:${POOL_DIR}
