FROM ubuntu:22.04

RUN apt-get update && \
  apt-get install -y wget curl unzip zip git build-essential software-properties-common make gcc g++ clang cmake \
  maven gradle ant python3 python3-pip python3-venv ruby-full php perl golang-go

# Node.js (NVM)
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
ENV NVM_DIR /root/.nvm
RUN . "$NVM_DIR/nvm.sh" && \
  nvm install 14 && \
  nvm install 16 && \
  nvm install 18 && \
  nvm install 20 && \
  npm install -g yarn

# .NET SDKs
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
  dpkg -i packages-microsoft-prod.deb && \
  apt-get update && \
  apt-get install -y dotnet-sdk-6.0 dotnet-sdk-7.0 dotnet-sdk-8.0

# PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Ruby Bundler
RUN gem install bundler

# Perl CPANM
RUN apt-get install -y cpanminus

# Scala SBT
RUN curl -L -o sbt.deb https://github.com/sbt/sbt/releases/download/v1.8.2/sbt-1.8.2.deb && \
    dpkg -i sbt.deb || apt-get install -y -f && rm sbt.deb

# Flutter / Dart - Observação: Rodar no host ou runner, pois Snap nem sempre funciona em container
