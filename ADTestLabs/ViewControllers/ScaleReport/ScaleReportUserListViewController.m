//
//  ScaleReportUserListViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-12.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ScaleReportUserListViewController.h"

@interface ScaleReportUserListViewController ()

@end

@implementation ScaleReportUserListViewController

@synthesize userList;
@synthesize userListCounter;
@synthesize selectRow;

#pragma mark - Actions

- (IBAction)RefreshUserListData:(id)sender
{
    NSLog(@"RefreshUserListData");
    [self LoadUserListData];
    [self.tableView reloadData];
    
}

- (void)LoadUserListData
{
    [self.userList removeAllObjects];
    
    ADTLabs_UserBLL *_userBLL = [[ADTLabs_UserBLL alloc] init];
    
    NSMutableArray *_userList = [ _userBLL getAllUser];
    
    self.userList = _userList;
    
    
    
    
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ( [[segue identifier] isEqualToString:@"ShowScaleReport_ScaleList"])
    {
        NSLog(@"prepareForSegue - ShowScaleReport_ScaleList");
        
        //NSLog(@"- %@",sender);
        
        ScaleReportScaleListViewController *destination_Controller = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSUInteger row = indexPath.row;
        
        ADTLabs_User *_userObject =   [userList objectAtIndex:row];
        
        
        
        destination_Controller.user = _userObject;
        
    }
}

#pragma mark - View lifecyle

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    userListCounter = 0;
    
    //self.title = @"评测记录";
    
    
    //cellImage = [UIImage imageNamed:@""];
    //self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    
    //加载用户列表数据
    [self LoadUserListData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"viewWillDisappear");
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"viewDidDisappear");
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    return 0;
    
    userListCounter = [ userList count];
    return userListCounter;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UserListCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];//iOS6 only
    
    if (cell == nil)
    {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    
    // Configure the cell...
    
    NSUInteger row = indexPath.row;
    cell.textLabel.text = [[userList objectAtIndex:row] userName];
    // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    
    if ([userList count] >0)
    {
        NSUInteger row = indexPath.row;
        
        
        ADTLabs_User *_userObject =   [userList objectAtIndex:row];
        
        NSLog(@"%@  %d",_userObject.userName, _userObject.userID);
    }
    
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // [self performSegueWithIdentifier: @"EditUser" sender: [tableView cellForRowAtIndexPath:indexPath]];
 //   NSLog(@"accessoryButtonTappedForRowWithIndexPath - %d",indexPath.row);
    
 //   [self performSegueWithIdentifier:@"ShowScaleReport_ScaleList" sender:[tableView cellForRowAtIndexPath:indexPath]];
    
    
}

@end
