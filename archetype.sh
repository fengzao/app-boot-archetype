#!/bin/sh

mvn clean

# 使用 archetype:create-from-project 从 Maven 项目中构建 Archetype 项目
# -Darchetype.properties 用于指定配置文件
# 关于配置参数见官方文档 http://maven.apache.org/archetype/maven-archetype-plugin/create-from-project-mojo.html
mvn clean archetype:create-from-project -Darchetype.properties=archetype.properties

rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/.idea
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/*.iml
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/logs
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/*.sh

cd target/generated-sources/archetype

mvn clean install


