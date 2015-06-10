//
//  SANODStore.m
//  IschoolApp
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 SanFeng. All rights reserved.
//

#import "SANODStore.h"
#import "SANBaseConfig.h"
#import "SANODRecViewController.h"
@interface SANODStore()

@property (nonatomic) NSMutableArray *privateRecArticles;
@end
@implementation SANODStore


+(instancetype)sharedStore
{
    static SANODStore *sharedStore = nil;
    if (!sharedStore) {
        
        sharedStore =[[self alloc] initPrivate];
        
    }
    
    return sharedStore;
}
-(instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateRecArticles = [[NSMutableArray alloc] init];
        
           }
    return self;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[SANODStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

-(NSArray *)allRecArticles{
    return self.privateRecArticles;
}




@end
