# Founq_KeychainIDFA
Founq_KeychainIDFA. 获取idfa标示当设备唯一识别,并保存到keychain中.基本不变.除非刷机. [根据原地址](https://github.com/qixin1106/KeychainIDFA)调整.
原地址中，需要设置 一个 预处理宏定义命令，这样就没有办法使用 cocopods，所以这里做了一个调整。存储的dfa的Keychain标示默认为项目的Identifier，所以 当项目的标识更改后也会不能获取，会重新创建)

### 测试数据

    //第一次:2d54d261-7bae-4014-8b81-3f9ff969b6e1
    //第二次:2d54d261-7bae-4014-8b81-3f9ff969b6e1
    //卸载app启动:2d54d261-7bae-4014-8b81-3f9ff969b6e1
    
    //delete之后:2b8d8afc-7f87-4c9c-ac73-ec64a89fc1a8
    //delete之后2次:2b8d8afc-7f87-4c9c-ac73-ec64a89fc1a8
    //delete之后卸载:2b8d8afc-7f87-4c9c-ac73-ec64a89fc1a8
    
    
### 使用方式
    
    //设置你idfa的Keychain标示,该标示相当于key,而你的IDFA是value
    //在KeychainIDFA.h中定义
    #define IDFA_STRING @"com.qixin.test.idfa"
    
    #import "KeychainIDFA.h"

    [KeychainIDFA IDFA]//获取IDFA
    
    [KeychainIDFA deleteIDFA]//删除Keychain中IDFA(一般不用)
    
### pod 添加：
       >  在Podfile文件中添加下面代码，然后使用：``pod update`` 进行更新就可以了，有可能 ``pod search Founq_KeychainIDFA`` 不能搜索到
    
       pod 'Founq_KeychainIDFA' #idfa获取
    
