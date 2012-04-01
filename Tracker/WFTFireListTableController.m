//
//  WFTFireListTableController.m
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WFTFireListTableController.h"
#import "WFTJSONRequest.h"


@interface WFTFireListTableController ()

@end

@implementation WFTFireListTableController

@synthesize fires;

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
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];

    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        fires = [WFTJSONRequest readPoints:self];
    });
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (!fires)
        return 1;
    else 
        return [fires count] - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"fireListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (fires)
    {
        WFTPoint *point = (WFTPoint*)[fires objectAtIndex:indexPath.row];
        
        if (point)
        {
            if (point.message)
                cell.textLabel.text = point.message;
            else {
                cell.textLabel.text = @"No user-submitted message";
                cell.textLabel.textColor = [UIColor lightGrayColor];
            }
        
            if (point.magnitude)
            {
                switch ([point.magnitude intValue]) {
                    case 0:
                    {
                        //fucking smoke
                        cell.imageView.image = [UIImage imageNamed:@"Fire0"];
                        break;
                    }
                    case 1:
                    {   //fucking smoke and a little fire
                        cell.imageView.image = [UIImage imageNamed:@"Fire1"];
                        break;
                    }
                    case 2:
                    {
                        //fucking smoke and more fire
                        cell.imageView.image = [UIImage imageNamed:@"Fire2"];
                        break;
                    }
                    case 3:
                    {
                        //holy fuck the world is ending
                        cell.imageView.image = [UIImage imageNamed:@"Fire3"];
                        break;
                    }
                        
                    default:
                        NSLog(@"Buggy shitfuck");
                        break;
                }
            }
        }
    }

    if (cell)
        return cell;
    else
        return [[UITableViewCell alloc] init];
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
