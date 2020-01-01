FROM ruby:slim

WORKDIR /app

RUN echo "PS1='\n\n>> snapcrawl \W \$ '" >> /root/.bashrc

COPY phantomjs /usr/local/bin/phantomjs
RUN chmod +x /usr/local/bin/phantomjs

# For phantomjs
# Ref: https://stackoverflow.com/questions/53355217/genymotion-throws-libssl-conf-so-cannot-open-shared-object-file-no-such-file-o
ENV OPENSSL_CONF /etc/ssl/

RUN apt-get update -y && apt-get install -y \
    build-essential patch ruby-dev zlib1g-dev liblzma-dev \
    libfontconfig imagemagick

RUN gem install snapcrawl --version 0.4.0

ENTRYPOINT ["snapcrawl"]
