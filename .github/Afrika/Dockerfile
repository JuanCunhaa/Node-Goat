# Usa base Ubuntu 22.04
FROM ubuntu:22.04

# Impede prompts interativos (resolve tzdata)
ENV DEBIAN_FRONTEND=noninteractive

# Configura timezone fixo (UTC)
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Instala dependências gerais e ferramentas de build
RUN apt-get update && \
    apt-get install -y \
      wget \
      curl \
      unzip \
      zip \
      git \
      build-essential \
      software-properties-common \
      make \
      gcc \
      g++ \
      clang \
      cmake \
      maven \
      gradle \
      ant \
      python3 \
      python3-pip \
      python3-venv \
      ruby-full \
      php \
      perl \
      golang-go \
      lsb-release \
      apt-transport-https \
      gnupg

# Instala Node.js globalmente (última LTS) + Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

# Se quiser múltiplas versões no PATH:
# Instala Node 14, 16, 18 com nvm e copia pro PATH global
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && \
    nvm install 14 && cp /root/.nvm/versions/node/v14*/bin/node /usr/local/bin/node14 && \
    nvm install 16 && cp /root/.nvm/versions/node/v16*/bin/node /usr/local/bin/node16 && \
    nvm install 18 && cp /root/.nvm/versions/node/v18*/bin/node /usr/local/bin/node18

# Mantém o Node principal como v20.x do NodeSource + Yarn global
# Node 14, 16, 18 acessíveis como `node14`, `node16`, `node18` se precisar

# Instala .NET SDK 8.0 via feed oficial Microsoft + outras versões com dotnet-install.sh
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/prod.list -O /etc/apt/sources.list.d/microsoft-prod.list && \
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    rm microsoft.gpg && \
    apt-get update && \
    apt-get install -y dotnet-sdk-8.0

# Usa dotnet-install.sh para versões 6 e 7
ENV PATH="/root/.dotnet:${PATH}"

RUN curl -sSL https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh && \
    chmod +x dotnet-install.sh && \
    ./dotnet-install.sh --version 6.0.420 && \
    ./dotnet-install.sh --version 7.0.400 && \
    rm dotnet-install.sh

# Instala PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instala Ruby Bundler
RUN gem install bundler

# Instala Perl CPANM
RUN apt-get install -y cpanminus

# Instala Scala SBT
RUN curl -L -o sbt.deb https://github.com/sbt/sbt/releases/download/v1.8.2/sbt-1.8.2.deb && \
    dpkg -i sbt.deb || apt-get install -y -f && rm sbt.deb

# Limpa cache pra reduzir tamanho final
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
