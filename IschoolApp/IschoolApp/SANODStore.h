//
//  SANODStore.h
//  IschoolApp
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 SanFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SANODStore : NSObject


@property (nonatomic,copy) NSArray *allRecArticles;

+(instancetype)sharedStore;
-(instancetype)initPrivate;
-(void)fetchFeed;

@end
