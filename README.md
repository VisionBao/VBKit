# VBKit

[![Build Status][image-1]][1] ![Cocoapods][image-2]

[1]:	https://travis-ci.org/VisionBao/VBKit

[image-1]:	https://travis-ci.org/VisionBao/VBKit.svg?branch=master
[image-2]:	https://img.shields.io/badge/cocoapods-v0.1.3-blue.svg

[TOC]

## 说明

​	整个Kit已经模块化,所以你可以使用其中单一模块,提升与工程的兼容性.避免引入过多模块导致与原工程冲突.具体见使用方法.

## 功能及结构(整理中...)

- VBUI
  - Base		
  - VBAlertView
- VBManagers
  - VBDBManager
  - VBFileManager
  - VBHTTPManager
  - VBLocationManager
  - VBUMengAnalyticsManager
- VBFoundation

   

- VBCategories

   ​


## 使用方法

### 1.在Podfile中加入 
```
  pod 'VBKit'
```
或
```
  pod 'VBKit', :tag => '0.1.3'
```

如果你只需要单一模块

```
  pod 'VBKit/VBUI'
```

或

```
  pod 'VBKit/VBManagers/VBHTTPManager'
```

### 2.下载文件引入工程

​	需要手动管理依赖的库,具体看错误信息.
