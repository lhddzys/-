//
//  SANModel_MenuStore.h
//  IschoolApp
//
//  Created by apple on 15/6/7.
//  Copyright (c) 2015年 SanFeng. All rights reserved.
//  基础配置

#import <Foundation/Foundation.h>

@interface SANBaseConfig : NSObject
@property (nonatomic,readonly) NSArray *MyMenus;          //我的菜单
@property (nonatomic,readonly) NSString *WebServerURL;    //Web服务的地址

+(instancetype)sharedStore;

@end
