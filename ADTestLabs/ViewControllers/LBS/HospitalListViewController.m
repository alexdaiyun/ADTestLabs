//
//  HospitalListViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-14.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "HospitalListViewController.h"



@interface HospitalListViewController ()

@end

@implementation HospitalListViewController

@synthesize hospitalList;
@synthesize city;
@synthesize selectHospital;

#pragma mark - Actions

- (void)LoadHospitalListData
{
    [hospitalList removeAllObjects];
    
    ADTLabs_HospitalBLL *hospitalBLL = [[ADTLabs_HospitalBLL alloc] init];
    
    hospitalList = [hospitalBLL getAllHospitalByCity:city];
    
}

#pragma mark - segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowHospitalMapView"])
    {
        NSLog(@"prepareForSegue - ShowHospitalMapView");
        
        HospitalMapViewController *destination_ViewController = segue.destinationViewController;
        
        destination_ViewController.delegate = self;
    
        NSIndexPath *indexPath = [ self.tableView indexPathForSelectedRow];
        NSUInteger row = indexPath.row;
        
        selectHospital = [hospitalList objectAtIndex:row];
        
        destination_ViewController.hospitalObject = selectHospital;
        
    }
}


#pragma mark - HospitalMapViewControllerDelegate

- (void)hospitalMapViewControllerDidCancel:(HospitalMapViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    [self LoadHospitalListData];
    
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
    return [hospitalList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HospitalCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath]; //iOS6 only
    
    if (cell == nil)
    {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell...
    
    NSUInteger row = indexPath.row;
    
    ADTLabs_Hospital *HospitalObject = [hospitalList objectAtIndex:row] ;
    
    
    
    
    UILabel *cellLabel_Hospital = (UILabel *)[cell viewWithTag:1];
    UILabel *cellLabel_City = (UILabel *)[cell viewWithTag:2];
    UILabel *cellLabel_HospitalLevel = (UILabel *)[cell viewWithTag:3];
    UILabel *cellLabel_HospitalType = (UILabel *)[cell viewWithTag:4];
    UILabel *cellLabel_Subject = (UILabel *)[cell viewWithTag:5];
    UILabel *cellLabel_Contacter = (UILabel *)[cell viewWithTag:6];
    UILabel *cellLabel_Professor = (UILabel *)[cell viewWithTag:7];
    UILabel *cellLabel_ProfLevel= (UILabel *)[cell viewWithTag:8];
    
    cellLabel_Hospital.text = HospitalObject.hospitalName;
    cellLabel_City.text = HospitalObject.city;
    
    cellLabel_HospitalLevel.text = @"";
    
    if (HospitalObject.hospitalLevel != nil)
    {
        cellLabel_HospitalLevel.text = HospitalObject.hospitalLevel;
    }
    
    cellLabel_HospitalType.text = HospitalObject.hospitalType;
    
    cellLabel_Subject.text = @"";
    if (HospitalObject.subject != nil)
    {
        cellLabel_Subject.text = HospitalObject.subject;
    }
    
    cellLabel_Contacter.text = @"";
    if (HospitalObject.contacter != nil)
    {
        cellLabel_Contacter.text = HospitalObject.contacter;
    }
    
    cellLabel_Professor.text = @"";
    if (HospitalObject.professor != nil)
    {
        cellLabel_Professor.text = HospitalObject.professor;
    }
    
    cellLabel_ProfLevel.text = @"";
    if (HospitalObject.profLevel != nil)
    {
        cellLabel_ProfLevel.text = HospitalObject.profLevel;
        
    }
    
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
}


@end
