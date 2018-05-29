#!/usr/bin/env bash

if [[ "${ORACLEUSERNAME}" == "" ]]; then
    read  -p "Enter your Oracle Support username: " ORACLEUSERNAME
fi

if [[ "${ORACLEPASSWD}" == "" ]]; then
    read  -s -p "Enter your Oracle Support password: " ORACLEPASSWD
fi

make build oracleusername="${ORACLEUSERNAME}" oraclepasswd="${ORACLEPASSWD}"
