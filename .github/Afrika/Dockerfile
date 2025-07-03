# Usa base Ubuntu 22.04
FROM ubuntu:22.04

# Impede prompts interativos (resolve travamento do tzdata)
ENV DEBIAN_FRONTEND=noninteractive

# Configura timezone fixo pra UTC
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

# Instala Node.js via NVM com múltiplas versões + Yarn
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && \
    nvm install 14 && \
    nvm install 16 && \
    nvm install 18 && \
    nvm install 20 && \
    npm install -g yarn

# Instala .NET SDKs (método oficial 2024/2025)
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/prod.list -O /etc/apt/sources.list.d/microsoft-prod.list && \
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    rm microsoft.gpg && \
    apt-get update && \
    apt-get install -y dotnet-sdk-6.0 dotnet-sdk-7.0 dotnet-sdk-8.0

# Instala PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instala Ruby Bundler
RUN gem install bundler

# Instala Perl CPANM
RUN apt-get install -y cpanminus

# Instala Scala SBT
RUN curl -L -o sbt.deb https://github.com/sbt/sbt/releases/download/v1.8.2/sbt-1.8.2.deb && \
    dpkg -i sbt.deb || apt-get install -y -f && rm sbt.deb

# Limpa cache do APT pra reduzir imagem final
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
