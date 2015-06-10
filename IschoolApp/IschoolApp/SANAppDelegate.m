//
//  AppDelegate.m
//  IschoolApp
//
//  Created by apple on 15/6/7.
//  Copyright (c) 2015年 SanFeng. All rights reserved.
//

#import "SANAppDelegate.h"

#import "SANODRecViewController.h"   //最新100个公文

#import "SANSAMenuViewController.h"  //每个登录用用户的功能性菜单（按角色来划分）


#import "SANERViewController.h"

@interface SANAppDelegate ()

@end

@implementation SANAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //初始化一个tabBar控制器
    UITabBarController *tb=[[UITabBarController alloc]init];
    
    
        //最新公文
    SANODRecViewController *od1=[[SANODRecViewController alloc]init];
    
    
    UINavigationController *c1=[[UINavigationController alloc] initWithRootViewController:od1];
   
    //c1.view.backgroundColor=[UIColor grayColor];
    //c1.view.backgroundColor=[UIColor greenColor];
    c1.tabBarItem.title=@"最新";
    c1.tabBarItem.image=[UIImage imageNamed:@"zuixin"];
    c1.tabBarItem.badgeValue=@"53";
    
    
    
    
    //应用模块
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(90, 110);
   
     layout.sectionInset = UIEdgeInsetsMake(5, 2, 2, 2);
 
    
    
  
      SANSAMenuViewController *menuVc = [[SANSAMenuViewController alloc] initWithCollectionViewLayout:layout];
 
     menuVc.collectionView.backgroundColor=[UIColor whiteColor];
    
   
  
     UINavigationItem *navItem2= menuVc.navigationItem;
     navItem2.title= @"应用";
   
    
    
    
    UINavigationController *c2=[[UINavigationController alloc] initWithRootViewController:menuVc];
    
       
    c2.tabBarItem.title=@"应用";
    c2.tabBarItem.image=[UIImage imageNamed:@"yinyong"];
    
    //联系
    UIViewController *c3=[[UIViewController alloc]init];
    c3.tabBarItem.title=@"联系";
    c3.tabBarItem.image=[UIImage imageNamed:@"lianxi"];
    
    
    //我
    UIViewController *c4=[[UIViewController alloc]init];
    c4.tabBarItem.title=@"我";
    
    c4.tabBarItem.image=[UIImage imageNamed:@"wo"];
    
    
    tb.viewControllers=@[c1,c2,c3,c4];
    
    
    
    //设置上在的导航条的背景颜色与字体颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    
    //设置控制器为Window的根控制器
    self.window.rootViewController=tb;

    
    [self.window makeKeyAndVisible];
    return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end



