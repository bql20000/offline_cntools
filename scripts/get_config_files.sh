# Please run this inside container
# Use for testnet only

rsync -zaP -e "ssh" \
    ${CORE_HOST}:${CNODE_HOME}/files ${CNODE_HOME}
