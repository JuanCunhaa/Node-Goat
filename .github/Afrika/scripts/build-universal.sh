#!/bin/bash

STACK=$1
DIR=$2

echo "⚙️ Build universal para stack: $STACK na pasta: $DIR"

cd "$DIR"

case $STACK in
  java)
    mvn clean package && exit 0
    ./gradlew build && exit 0
    ant build && exit 0
    ;;
  scala)
    sbt compile && sbt package && exit 0
    ;;
  kotlin)
    ./gradlew build && exit 0
    ;;
  node)
    for NODE in 14 16 18 20; do
      . "$NVM_DIR/nvm.sh" && nvm use $NODE
      npm ci && npm run build && exit 0
      yarn install && yarn build && exit 0
    done
    ;;
  dotnet)
    dotnet build && exit 0
    ;;
  python)
    pip install -r requirements.txt && exit 0
    ;;
  cpp)
    cmake . && make && exit 0
    make && exit 0
    gcc *.c -o app && exit 0
    ;;
  go)
    go build && exit 0
    ;;
  php)
    composer install || true
    zip -r source.zip .
    ;;
  ruby)
    bundle install || true
    rake build || true
    zip -r source.zip .
    ;;
  perl)
    cpanm --installdeps . || true
    zip -r source.zip .
    ;;
  swift|obj-c|dart)
    echo "⚠️ Requer macOS ou ambiente específico!"
    ;;
  coldfusion|cobol|abap|classic-asp)
    echo "📦 Compactando fonte puro..."
    zip -r source.zip .
    ;;
  *)
    echo "❌ Stack desconhecida!"
    exit 1
    ;;
esac

echo "✅ Build finalizado!"
