#!/bin/bash

echo "🔍 Buscando stack em todo o repositório..."

detect() {
  PATTERN=$1
  STACK=$2

  echo "🔍 Procurando por: $PATTERN"
  FILE=$(find . -type f -iname "$PATTERN" | head -n 1)

  if [ -n "$FILE" ]; then
    DIR=$(dirname "$FILE")
    echo "✅ Encontrado: $FILE"
    echo "stack=$STACK" >> $GITHUB_OUTPUT
    echo "path=$DIR" >> $GITHUB_OUTPUT
    exit 0
  else
    echo "❌ Não encontrado: $PATTERN"
  fi
}

detect "pom.xml" "java"
detect "build.gradle" "java"
detect "build.sbt" "scala"
detect "*.kt" "kotlin"
detect "*.csproj" "dotnet"
detect "package.json" "node"
detect "requirements.txt" "python"
detect "Makefile" "cpp"
detect "go.mod" "go"
detect "index.php" "php"
detect "Gemfile" "ruby"
detect "*.pl" "perl"
detect "*.swift" "swift"
detect "*.m" "obj-c"
detect "pubspec.yaml" "dart"
detect "*.cfm" "coldfusion"
detect "*.cob" "cobol"
detect "*.cbl" "cobol"
detect "*.abap" "abap"
detect "*.asp" "classic-asp"

echo "❌ Nenhuma stack detectada!"
echo "stack=unknown" >> $GITHUB_OUTPUT
exit 1
