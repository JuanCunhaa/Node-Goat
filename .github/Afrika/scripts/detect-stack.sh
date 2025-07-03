#!/bin/bash

echo "🔍 Buscando stack em todo o repositório..."

detect() {
  FILE=$1
  PATTERN=$2
  STACK=$3
  if find . -name "$PATTERN" | grep -q .; then
    FILE=$(find . -name "$PATTERN" | head -n 1)
    DIR=$(dirname "$FILE")
    echo "stack=$STACK" >> $GITHUB_OUTPUT
    echo "path=$DIR" >> $GITHUB_OUTPUT
    exit 0
  fi
}

detect "pom.xml" "pom.xml" "java"
detect "build.gradle" "build.gradle" "java"
detect "build.sbt" "build.sbt" "scala"
detect "*.kt" "*.kt" "kotlin"
detect "*.csproj" "*.csproj" "dotnet"
detect "package.json" "package.json" "node"
detect "requirements.txt" "requirements.txt" "python"
detect "Makefile" "Makefile" "cpp"
detect "go.mod" "go.mod" "go"
detect "index.php" "index.php" "php"
detect "Gemfile" "Gemfile" "ruby"
detect "*.pl" "*.pl" "perl"
detect "*.swift" "*.swift" "swift"
detect "*.m" "*.m" "obj-c"
detect "pubspec.yaml" "pubspec.yaml" "dart"
detect "*.cfm" "*.cfm" "coldfusion"
detect "*.cob" "*.cob" "cobol"
detect "*.cbl" "*.cbl" "cobol"
detect "*.abap" "*.abap" "abap"
detect "*.asp" "*.asp" "classic-asp"

echo "stack=unknown" >> $GITHUB_OUTPUT
exit 1
