sudo chmod o+w /usr/bin

scp ${CORE_HOST}:/home/${CORE_USER}/.cabal/bin/cardano-cli /usr/bin
scp ${CORE_HOST}:/home/${CORE_USER}/.cabal/bin/cardano-address /usr/bin
scp ${CORE_HOST}:/home/${CORE_USER}/.cabal/bin/bech32 /usr/bin

echo "Successfully download binary files to usr/bin (cardano-cli, bech32, cardano-address)."

sudo chmod o+w /usr/local/bin 
sudo rsync -zaP -e "ssh -F ${SSH_CONFIG_FILE}" \
    --exclude='python3.8' ${CORE_HOST}:/usr/local/lib/ /usr/local/lib

echo "Successfully download binary files to usr/local/lib (libsodium)"