//
//  SANModel_MenuStore.m
//  IschoolApp
//
//  Created by apple on 15/6/7.
//  Copyright (c) 2015年 SanFeng. All rights reserved.
//

#import "SANBaseConfig.h"




@interface SANBaseConfig()

@property (nonatomic) NSMutableArray *privateItems;

@end
@implementation SANBaseConfig

+(instancetype)sharedStore
{
    static SANBaseConfig *sharedStore = nil;
    if (!sharedStore) {
        sharedStore =[[self alloc] initPrivate];
        
    }
    
    return sharedStore;
}

-(instancetype) init
{
    @throw [NSException exceptionWithName:@"singleton" reason:@"Use + [SANModel_MenuStore sharedStore]" userInfo:nil];
}

-(instancetype)initPrivate
{
    self = [super init];
    if (self) {
        
        
        NSUserDefaults *UD = [NSUserDefaults standardUserDefaults];
        
        //得到我的菜单
        if(!_privateItems)
        {
            _privateItems = [[NSMutableArray alloc] init];
            NSArray *jsonArray = [[NSArray alloc]init];
            NSData *fileData = [[NSData alloc]init];
            
           // if ([UD objectForKey:@"menu"] == nil)
            {
                NSString *path;
                path = [[NSBundle mainBundle] pathForResource:@"SANAppMenu" ofType:@"json"];
                fileData = [NSData dataWithContentsOfFile:path];
                
                [UD setObject:fileData forKey:@"menu"];
                [UD synchronize];
            }
           // else
            {
                fileData = [UD objectForKey:@"menu"];
            }
            
            
            //NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
            jsonArray = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableLeaves error:nil];
            for (NSDictionary *dict in jsonArray) {
                [self.privateItems addObject:dict];
            }
        }
        
        
            //访问域
         //   if ([UD objectForKey:@"WebServerURL"] == nil) {
                [UD setObject:@"http://class.tzdyxx.com/Server/User/Class2User?schoolID=1&userID=187&userType=1" forKey:@"WebServerURL"];
         //   }
          //  else {
                _WebServerURL=[UD objectForKey:@"WebServerURL"];
       // _WebServerURL=@"http://class.tzdyxx.com/Server/User/Class2User?schoolID=1&userID=187&userType=1";
             //              }
       
        
        
    }
    
    return self;
}

-(NSArray *)MyMenus
{
    return self.privateItems;
}
@end
