//
//  SANSAMenuViewController.m
//  IschoolApp
//
//  Created by apple on 15/6/7.
//  Copyright (c) 2015年 SanFeng. All rights reserved.
//

#import "SANSAMenuViewController.h"
#import "SANBaseConfig.h"

#import "SANSAMenuCell.h"


#import "SANERViewController.h"   //设备报修


@interface SANSAMenuViewController ()

@end

@implementation SANSAMenuViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super init];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"平台应用";
        
        // Create a new bar button item that will send
        // addNewItem: to BNRItemsViewController
        //        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
        //                                                                             target:self
        //                                                                             action:@selector(addNewItem:)];
        //
        //        // Set this bar button item as the right item in the navigationItem
        //        navItem.rightBarButtonItem = bbi;
        
        // navItem.leftBarButtonItem = self.editButtonItem;
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UINavigationItem *navItem=self.navigationItem;
    navItem.title=@"";
    
    
    UINib *nib=[UINib nibWithNibName:@"SANSAMenuCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"SANSAMenuCell"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 9;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return [[[SANBaseConfig sharedStore] MyMenus] count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SANSAMenuCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SANSAMenuCell" forIndexPath:indexPath];
    
    NSArray *menus = [[SANBaseConfig sharedStore] MyMenus];
    
    UIImage *image = [UIImage imageNamed:menus[indexPath.row][@"ImageName"]];
    
    
    cell.menuName.text=menus[indexPath.row][@"Name"];
    
    [cell.menuName sizeToFit];
    cell.menuImage.image=image;
    
    
    return cell;
    
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *menus = [[SANBaseConfig sharedStore] MyMenus];
    NSString *stringClass =  menus[indexPath.row][@"ControllerName"];
    UIViewController  *vc=[[NSClassFromString(stringClass) alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;//隐藏底部的 BottomBar
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
