# App quickly starter archetype

> 前段时间由于业务需求需要频繁的创建新项目, 考虑到公司业务特点每次都要干下面三件事情
> - 拷贝一份 POM 配置文件
> - 拷贝一份 appication.properties 
> - 拷贝一份 日志配置文件
> - 创建一份 启动类 OR  特定的目录结构

> 这些工作干多了不免让人烦躁. 总得干点什么让自己轻松一点, 多打点酱油

本系统用于展示如何使用 mvn archetype:create-from-project 命令从 Maven 项目创建项目骨架.  

## 项目结构

> 项目基于 spring boot 构建, 其配置文件和文件结构组织具有 spring/个人 特色, 你不需要照搬, 这只是一个示例

```
├── archetype.properties    # spring boot 默认配置文件
├── archetype.sh            # 关键脚本, 为了简化操作和方便记忆 : 将相关命令写入该文件中 
├── pom.xml                 # Maven 项目 pom 文件
├── readme.md
└── src
    ├── main
    │   ├── java            # 文件为目标项目的模本文件, 其包括了 controler/service/mapper(dao)/entity 四类目录 以及一个启动类
    │   │   └── org
    │   │       └── cokebook
    │   │           └── xyz
    │   │               ├── Bootstrap.java
    │   │               ├── controller
    │   │               │   └── package-info.java         # 放置该文件是为了避免 空文件件被忽略
    │   │               ├── entity
    │   │               │   └── package-info.java
    │   │               ├── mapper
    │   │               │   └── package-info.java
    │   │               └── service
    │   │                   ├── impl
    │   │                   │   └── package-info.java
    │   │                   └── package-info.java
    │   └── resources       # 资源文件
    │       ├── application.properties
    │       ├── logback.xml
    │       ├── mybatis
    │       └── spring
    │           └── template                              # 放置该文件是为了避免 空文件件被忽略
    └── test              
        └── java            # 测试文件及其模板
            └── org
                └── cokebook
                    └── xyz
                        └── BootstrapTest.java

```


## 运行

- 1 进入当前项目目录
- 2 执行 sh archetype.sh (目前仅有 linux 版本启动命令, windows 版本后续新增)
- 3 在你的 Mvn 仓库查看你的 archetype jar.


### archetype.sh 说明

`````

#!/bin/sh

mvn clean  

# 由于我的 Logback 配置在跑过测试用例以后会生产该目录
rm -rf logs     
 
mvn clean archetype:create-from-project -Darchetype.properties=archetype.properties

# 通过情况 我们都是使用IDE工具编写项目, 这些工具通常会带入一些工具自定义的文件通过编写脚本删除这部分文件
# 我使用的IDEA 工具是 IntelliJ IDEA, 故编写以下文件移除命令
# 根据你的项目结构,你可以新增一些新的移除指令

rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/.idea
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/*.iml
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/logs
rm -rf target/generated-sources/archetype/src/main/resources/archetype-resources/*.sh

cd target/generated-sources/archetype

mvn clean install

```



