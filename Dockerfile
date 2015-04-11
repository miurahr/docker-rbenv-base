FROM ubuntu:14.04.2
MAINTAINER miurahr@linux.com
COPY setup-rbenv-base.sh /tmp/
RUN chmod +x /tmp/setup-rbenv-base.sh
RUN /tmp/setup-rbenv-base.sh
