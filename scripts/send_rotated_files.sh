# Please run this inside container

HOT_SKEY=${CNODE_HOME}/priv/pool/${POOL_NAME}/hot.skey
HOT_VKEY=${CNODE_HOME}/priv/pool/${POOL_NAME}/hot.vkey
OP_CERT=${CNODE_HOME}/priv/pool/${POOL_NAME}/op.cert
KES_START=${CNODE_HOME}/priv/pool/${POOL_NAME}/key.start
COLD_COUNTER=${CNODE_HOME}/priv/pool/${POOL_NAME}/cold.counter


POOL_DIR=${CNODE_HOME}/priv/pool/${POOL_NAME}

scp ${HOT_SKEY} ${CORE_HOST}:${POOL_DIR}
scp ${HOT_VKEY} ${CORE_HOST}:${POOL_DIR}
scp ${OP_CERT} ${CORE_HOST}:${POOL_DIR}
scp ${KES_START} ${CORE_HOST}:${POOL_DIR}
scp ${COLD_COUNTER} ${CORE_HOST}:${POOL_DIR}
