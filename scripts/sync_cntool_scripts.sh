rsync -zaP -e "ssh" \
    ${CORE_HOST}:${CNODE_HOME}/scripts :${CNODE_HOME}/files \
    ${CNODE_HOME}
