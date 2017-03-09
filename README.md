# VBKit

[![Build Status][image-1]][1] ![Cocoapods][image-2]

[1]:	https://travis-ci.org/VisionBao/VBKit

[image-1]:	https://travis-ci.org/VisionBao/VBKit.svg?branch=master
[image-2]:	https://img.shields.io/badge/cocoapods-v0.1.0-blue.svg

[TOC]

## 说明

​	整个Kit已经模块化,所以你可以使用其中单一模块,提升与工程的兼容性.避免引入过多模块导致与原工程冲突.具体见使用方法.

## 功能及结构(整理中...)

1. VBUI

   {0}. Base		
   {0}. VBAlertView

2. VBManagers

   {0}. VBDBManager
   {0}. VBFileManager
   {0}. VBHTTPManager
   {0}. VBLocationManager
   {0}. VBUMengAnalyticsManager

3. VBFoundation

   ​

4. VBCategories

   ​



##使用方法

###1.在Podfile中加入 
```
  pod 'VBKit', :git => 'https://github.com/VisionBao/VBKit.git'
```
或
```
  pod 'VBKit', :git => 'https://github.com/VisionBao/VBKit.git' , :tag => '0.1.0'
```

如果你只需要单一模块

```
  pod 'VBKit/VBUI', :git => 'https://github.com/VisionBao/VBKit.git' 
```

或

```
  pod 'VBKit/VBManagers/VBHTTPManager', :git => 'https://github.com/VisionBao/VBKit.git' 
```

### 2.下载文件引入工程

​	需要手动管理依赖的库,具体看错误信息.