#!/bin/bash -e
./osixia/service/ssl-helper/install.sh

LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends openssl

# Fix files permission
chmod 600 /osixia/service/ssl-helper-openssl/assets/certificate-authority/docker_baseimage_cakey.pem
chmod 644 /osixia/service/ssl-helper-openssl/assets/certificate-authority/docker_baseimage_cacert.pem

# Link certificats et private keys
ln -s /osixia/service/ssl-helper-openssl/assets/certificate-authority/docker_baseimage_cacert.pem /etc/ssl/certs/docker_baseimage_cacert.pem
ln -s /osixia/service/ssl-helper-openssl/assets/certificate-authority/docker_baseimage_cakey.pem /etc/ssl/private/docker_baseimage_cakey.pem
