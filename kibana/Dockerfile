FROM os_ubuntu18_base:latest

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

WORKDIR ./

COPY ./provision.sh ./
RUN chmod +x ./provision.sh && ./provision.sh


### Entrypoint
CMD /bin/bash
