//
//  WineAddNonBasicViewController.m
//  WineTracker
//
//  Created by Michael Caputo on 3/8/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import "WineAddNonBasicViewController.h"
#import "Wine.h"
#import "WineAddViewController.h"
#import "TastingListViewViewController.h"

@interface WineAddNonBasicViewController ()

@property NSArray *cellTitles;
@property NSArray *sensoryArrays;

@end

@implementation WineAddNonBasicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.cellTitles = @[@"Sight",@"Smell",@"Taste"];
    
    // Populate sense arrays
    NSArray *smells = @[@"Fruity", @"Floral", @"Spice", @"Vegetable", @"Dirt", @"Wood", @"Weak", @"Strong", @"Smokey", @"Apple", @"Pear", @"Mango", @"Peach", @"Cherry", @"Cranberry", @"Fig", @"Blackberry", @"Blueberry", @"Chocolate", @"Vanilla", @"Toasty"];
    
    NSArray *tastes = @[@"Apple", @"Apple Sauce", @"Apricot", @"Jelly", @"Banana", @"Citrus", @"Mango", @"Lemon", @"Lemon"];
    
    NSArray *sights = @[@"Red", @"White", @"Bubbles"];
    
    
    
    self.sensoryArrays = @[sights, smells, tastes];
    
    self.title = @"Tasting Information";
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WineAddCell" forIndexPath:indexPath];
    cell.textLabel.text = self.cellTitles[indexPath.row];
    //WineListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //NSDate *object = _objects[indexPath.row];
//    Wine *currWine = _wineList[indexPath.row];
//    cell.wineNameLabel.text = [currWine name];//[object description];
//    cell.grapeNameLabel.text = [currWine grapeName];
//    cell.regionLabel.text = [currWine region];
    //cell.imageView = [currWine image];
    //if ([currWine image] != Nil) {
    //    [cell.imageView setImage:[currWine image]];
    //}
    
    return cell;
}

//
// prepareForSegue:sender:
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showTastingDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *itemList = [self.sensoryArrays[indexPath.row] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSString *viewTitle = self.cellTitles[indexPath.row];
        
       // Wine *object = _wineList[indexPath.row];
        [[segue destinationViewController] setItemList:itemList];
        [[segue destinationViewController] setTitle:viewTitle];
    }
}

@end
