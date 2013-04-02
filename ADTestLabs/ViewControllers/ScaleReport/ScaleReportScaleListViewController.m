//
//  ScaleReportScaleListViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-12.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ScaleReportScaleListViewController.h"

@interface ScaleReportScaleListViewController ()

@end

@implementation ScaleReportScaleListViewController
{
    NSArray *scaleList;
    
}

@synthesize user;
 


#pragma mark - Actions

- (void)LoadScaleList
{
   	scaleList = [NSArray arrayWithObjects:
                 @"AD8记忆障碍自评量表", //AD8
                 @"痴呆初期征兆的观察列表", //OLD
                 @"MMSE量表",            //MMSE
                 @"蒙特利尔认知评估量表",   //MOCA
                 @"日常生活能力量表",      //ADL
                 @"汉密尔顿抑郁量表",       //HAMND
                 @"哈金斯基缺血量表",      //HIS
                 nil];
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ( [[segue identifier] isEqualToString:@"ShowScaleReport_ScaleHistoryList"])
    {
        NSLog(@"prepareForSegue - ShowScaleReport_ScaleHistoryList");
        
        //NSLog(@"- %@",sender);
        
        ScaleReportScaleHistoryListViewController *destination_Controller = segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSUInteger row = indexPath.row;
 
        //设定量表标识符
        switch (row) {
            case 0:
                //
                destination_Controller.scaleLevleTag = ScaleLevelAD8;
                break;
            case 1:
                //
                destination_Controller.scaleLevleTag = ScaleLevelOLD;
                break;
            case 2:
                //
                destination_Controller.scaleLevleTag = ScaleLevelMMSE;
                break;
            case 3:
                //
                destination_Controller.scaleLevleTag = ScaleLevelMOCA;
                break;
            case 4:
                //
                destination_Controller.scaleLevleTag = ScaleLevelADL;
                break;
            case 5:
                //
                destination_Controller.scaleLevleTag = ScaleLevelHAMND;
                break;
            case 6:
                //
                destination_Controller.scaleLevleTag = ScaleLevelHIS;
                break;
            default:
                break;
        }
        
        //设定所选择的用户
        destination_Controller.user = user;
        
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
    
    //
    self.title =
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@ - 用户量表", user.userName ];
    
    [self LoadScaleList];
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    scaleList = nil;
    
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
    //return 0;
    
    return [scaleList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ScaleCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];//iOS6 only
    
    
    // Configure the cell...
    if (cell == nil)
    {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    NSUInteger row = indexPath.row;
    cell.textLabel.text = [scaleList objectAtIndex:row];
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
    
    
    if ([scaleList count] >0)
    {
        NSUInteger row = indexPath.row;
        
        
        //ADTLabs_User *_userObject =   [scaleList objectAtIndex:row];
        
       // NSLog(@"%@  %d",_userObject.userName, _userObject.userID);
    }
    
}

@end
