# Use base Ubuntu
FROM ubuntu:22.04

# Impede prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Define timezone fixo para evitar bloqueios
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Instala build tools e linguagens suportadas
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
      golang-go

# Instala Node.js via NVM com múltiplas versões
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && \
    nvm install 14 && \
    nvm install 16 && \
    nvm install 18 && \
    nvm install 20 && \
    npm install -g yarn

# Instala .NET SDKs
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

# Limpeza (opcional)
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
