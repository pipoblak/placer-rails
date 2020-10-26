#pega imagem do ruby alpine linux
FROM ruby:2.7.1-alpine

ENV MUSL_LOCALE_DEPS cmake make musl-dev gcc gettext-dev libintl 
ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

RUN apk add --no-cache \
    $MUSL_LOCALE_DEPS \
    && wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
    && unzip musl-locales-master.zip \
      && cd musl-locales-master \
      && cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
      && cd .. && rm -r musl-locales-master

#install all needed packages
RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python3 \
      tzdata \
      yarn
#install bundler
RUN gem install bundler -v 2.1.4
#diretório de trabalho para o aplicativo no contêiner:
WORKDIR /app 
#copia gemfile e gemfile lock pro docker
COPY Gemfile Gemfile.lock ./
#compila nokogiri
RUN bundle config build.nokogiri --use-system-libraries
#instala gems do projeto
RUN bundle check || bundle install
#copia packages node
#COPY package.json yarn.lock ./
#instala pacotes
#RUN yarn install --check-files

#script de ponto de entrada
COPY . ./
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
