//
//  TastingListViewViewController.m
//  WineTracker
//
//  Created by Michael Caputo on 3/9/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import "TastingListViewViewController.h"
#import "Wine.h"

@interface TastingListViewViewController ()

@property NSMutableArray *selectedItems;

@end

@implementation TastingListViewViewController

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
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    self.selectedItems = [[NSMutableArray alloc] init];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
}

- (void)saveAction {
    
            // Sight
            if ([self.title isEqualToString:@"Sight"]) {
                self.wine.sights = self.selectedItems;
            }
            // Smell
            else if ([self.title isEqualToString:@"Smell"]) {
                self.wine.smells = self.selectedItems;
            }
            // Taste
            else if ([self.title isEqualToString:@"Taste"]) {
                self.wine.tastes = self.selectedItems;
           }
   
    
    //self.wine.smells = self.selectedItems;
    //NSLog(@"Number of selected items:%d", self.selectedItems.count);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        if([self.selectedItems containsObject:[tableView cellForRowAtIndexPath:indexPath]]) {
            [self.selectedItems removeObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
        }
    }else{
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;

        [self.selectedItems addObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
        NSLog(@"selected: %d", self.selectedItems.count);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //if (section == 0) {
    //    return self.item
    //}
    return self.itemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SenseItemTitle";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    if (indexPath.section == 0) {
//        cell.textLabel.text = self.wine.sights[indexPath.row];
//    }
//    else if (indexPath.section == 1) {
//        cell.textLabel.text = self.wine.smells[indexPath.row];
//    }
//    else {
//        cell.textLabel.text = self.wine.tastes[indexPath.row];
//    }
    cell.textLabel.text = self.itemList[indexPath.row];
    
    // Configure the cell...
    
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
