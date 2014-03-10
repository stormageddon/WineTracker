//
//  MasterViewController.m
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "Wine.h"
#import "WineListCell.h"

@interface MasterViewController () {
    NSMutableArray *_wineList;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if( _wineList == nil) {
        [self loadData];
    }
    
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAddView)];
    self.navigationItem.rightBarButtonItem = addButton;

}

- (void)showAddView {
    WineAddViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"WineAddViewController"];   //[[WineAddViewController alloc] initWithNibName:@"WineAddViewController" bundle:Nil];
    controller.delegate = self;
    //[self performSegueWithIdentifier:@"addWineSegue" sender:self];
    [[self navigationController] pushViewController:controller animated:YES];
}

- (void)insertNewObject:(id)sender newWine:(Wine *) newWine
{
    if (!_wineList) {
        _wineList = [[NSMutableArray alloc] init];
    }

    [_wineList insertObject:newWine atIndex:0];
    NSLog(@"New wine: %@", newWine.smells);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _wineList.count;
}

- (WineListCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    WineListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //NSDate *object = _objects[indexPath.row];
    Wine *currWine = _wineList[indexPath.row];
    cell.wineNameLabel.text = [currWine name];//[object description];
    cell.grapeNameLabel.text = [currWine grapeName];
    cell.regionLabel.text = [currWine region];
    //cell.imageView = [currWine image];
    //if ([currWine image] != Nil) {
    //    [cell.imageView setImage:[currWine image]];
    //}

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_wineList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self saveWine];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Wine *object = _wineList[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

- (void)saveWine {
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] initWithCapacity:3];
    if (_wineList != nil) {
        [dataDict setObject:_wineList forKey:@"_wineList"];  // save the games array
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    [NSKeyedArchiver archiveRootObject:dataDict toFile:filePath];
}


- (void)addItemViewController:(WineAddViewController *)controller didFinishSavingItem:(Wine *)item
{
    NSLog(@"This was returned from ViewControllerB %@",item.smells);
    [self insertNewObject:self newWine:item];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self saveWine];
    });

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadData {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *savedData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if ([savedData objectForKey:@"_wineList"] != nil) {
            _wineList = [[NSMutableArray alloc] initWithArray:[savedData objectForKey:@"_wineList"]];
        }
    }
}

@end
