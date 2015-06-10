//
//  SANODRecViewController.m
//  IschoolApp
//
//  Created by apple on 15/6/7.
//  Copyright (c) 2015年 SanFeng. All rights reserved.
//

#import "SANODRecViewController.h"
#import "SANERViewController.h"
#import "SANBaseConfig.h"

@interface SANODRecViewController ()
@property (nonatomic) NSMutableArray *privateRecArticles;
@end

@implementation SANODRecViewController


- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"最新公文";
        
        if(!_privateRecArticles){
            _privateRecArticles=[[NSMutableArray alloc] init];
        }
        
        NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
        _session=[NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];

       
        [self fetchFeed];
        
        
       
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



-(NSArray *)allRecArticles{
    return self.privateRecArticles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self allRecArticles] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    
    
    NSArray *arry1 = [self allRecArticles];
   
    
    cell.textLabel.text=arry1[indexPath.row][@"Name"];
    
    
    return cell;

}



-(void)fetchFeed{
    
    
    NSUserDefaults *UD = [NSUserDefaults standardUserDefaults];
    NSString *URLWithString= [[SANBaseConfig sharedStore].WebServerURL stringByAppendingString:@""];
    
    NSURLSessionDataTask *dataTask=[self.session dataTaskWithHTTPGetRequest:[NSURL URLWithString:URLWithString]                                                          completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *json=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
       
        
        NSDictionary *jsonObject=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.privateRecArticles=jsonObject[@"Data"];
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    
    [dataTask resume];
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    SANERViewController *detailViewController = [[SANERViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
