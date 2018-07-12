FROM rhscl/nodejs-8-rhel7

# Author
MAINTAINER Luis Henrique Braz Sobrinho

# Descrições
LABEL author="Luis Henrique Braz Sobrinho" \
versao="1.0" \
descricao="HTTPD 2.4 + NodeJS + Gulp" \
SO="RHEL7"

USER root

RUN source /opt/rh/rh-nodejs8/enable

RUN /opt/rh/rh-nodejs8/root/usr/bin/npm install -g gulp && \
    echo -e "echo \"----> Rodando comando Gulp\" \nnpm run-script gulp prod" >> /usr/libexec/s2i/assemble && \
    echo -e "echo \"----> Corrigindo permissões\" \nfix-permissions ./" >> /usr/libexec/s2i/assemble && \
    mv ./dist/* .

USER 1001
