#!/bin/sh

mvn clean

rm -rf logs

mvn clean archetype:create-from-project -Darchetype.properties=archetype.properties

rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/.idea
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/*.iml
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/logs
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/*.sh

cd target/generated-sources/archetype

mvn clean install


