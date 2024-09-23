FROM debian:12
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git hugo nginx build-essential unar wget
RUN rm -rf /var/www/html
RUN mkdir -p /var/www/html

WORKDIR /tmp
RUN wget https://github.com/tdewolff/minify/releases/download/v2.20.16/minify_linux_amd64.tar.gz
RUN unar minify*tar.gz
RUN mv minify_linux_amd64/minify /usr/local/bin

ADD index.html /var/www/html/
ADD starter /usr/local/bin/


EXPOSE 80
WORKDIR /repo

RUN git clone "$GIT_URL" .
CMD /usr/local/bin/starter