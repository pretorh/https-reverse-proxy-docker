host=${1?need hostname as the first parameter}
AGREEMENT=https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf

acme-client -a $AGREEMENT -Nnmv $host
