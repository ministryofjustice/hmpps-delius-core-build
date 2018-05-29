#!/usr/bin/env bash

MODE=$1

currentDIR='.'
echo "currentDIR ${currentDIR}"
PROJECT_ROOT="$(git rev-parse --show-toplevel)"
source "${PROJECT_ROOT}/gpg/properties"

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, please supply args of init, adduser, encryptedFiles or unlock"
    exit 1
fi

case $MODE in
  init)
    echo "Initializing repo"
    git-crypt init
    ;;
  encryptedFiles)
    echo "Search repo for protected files"
    ENCRYPTED=$(grep -r 'GIT_ENCRYPT_ENABLED' ${currentDIR} | grep -v 'README.md\|setup.sh' | cut -d':' -f1 | cut -c 3-)
    for file in ${ENCRYPTED}
    do
        echo "Found ${file}"
        > ${currentDIR}/${GIT_CRYPT_ATTRIBUTES}
        echo "${file} filter=git-crypt diff=git-crypt" >> ${currentDIR}/${GIT_CRYPT_ATTRIBUTES}
    done
    ;;
  adduser)
    echo "Adding user to repo"
    for id in ${GPG_IDS}
    do
        echo "Adding key: ${id}"
        git-crypt add-gpg-user ${id}
    done
    ;;
  showusers)
    echo "Users with access"
    pushd "${PROJECT_ROOT}/.git-crypt/keys/default/0"; for file in *.gpg; do echo "${file} : " && git log -- ${file} | sed -n 9p; done; popd
    ;;
  unlock)
    echo "Initializing repo"
    git-crypt unlock
    ;;
esac
