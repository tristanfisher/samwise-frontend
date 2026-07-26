#!/usr/bin/env bash

echoerr() { echo "$@" 1>&2; }

function make_509_cert(){
  # notes:
  # - CN is not the FQDN
  # days and x509 added because we want to create a key/cert, not a CSR
  openssl req \
    -x509 \
    -days 3650 \
    -new \
    -nodes \
    -keyout ./tls/server.key \
    -out ./tls/server.crt \
    -config san.cnf

  if [ $? -gt 0 ]; then
    echoerr "failed to run openssl command"
    exit 1
  fi

  cat ./tls/server.crt ./tls/server.key > ./tls/server.pem && chmod 0600 ./tls/server.pem

  openssl x509 -in ./tls/server.crt -text -noout
}

make_509_cert
