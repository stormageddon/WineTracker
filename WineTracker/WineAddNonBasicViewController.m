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
    
     NSLog(@"NBController viewDidLoad Wine: %@",self.wine);
    
    self.cellTitles = @[@"Sight",@"Smell",@"Taste"];
    
    // Populate sense arrays
    NSArray *smells = @[@"Fruity", @"Floral", @"Spice", @"Vegetable", @"Dirt", @"Wood", @"Weak", @"Strong", @"Smokey", @"Apple", @"Pear", @"Mango", @"Peach", @"Cherry", @"Cranberry", @"Fig", @"Blackberry", @"Blueberry", @"Chocolate", @"Vanilla", @"Toasty"];
    
    NSArray *tastes = @[@"Apple", @"Apple Sauce", @"Apricot", @"Jelly", @"Banana", @"Citrus", @"Mango", @"Lemon", @"Lemon"];
    
    NSArray *sights = @[@"Red", @"White", @"Bubbles"];
    
    
    
    self.sensoryArrays = @[sights, smells, tastes];
    
    self.title = @"Tasting Information";
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

- (void)saveAction {
    //[self.navigationController popViewControllerAnimated:YES];
    
//    NSString *wineName = self.nameTextField.text;
//    NSLog(@"Saving wine: %@",[NSString stringWithFormat:@"Saving wine: %@",wineName]);
//    
//    NSString *grapeName = self.grapeNameTextfield.text;
//    NSString *regionName = self.regionTextField.text;
//    float price = [self.priceTextField.text floatValue];
//    
//    //UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    
//    Wine *wineToSave = [[Wine alloc] initWithName:wineName grapeName:grapeName region:regionName price:price image:[self.imageView image]];
    
    //NSString *itemToPassBack = @"Pass this value back to ViewControllerA";
    //[self.delegate addItemViewController:WineAddViewController didFinishSavingItem:self.wine];
    NSLog(@"SaveAction in AddNonBasic: %@", self.wine.smells);
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WineAddCell" forIndexPath:indexPath];
    cell.textLabel.text = self.cellTitles[indexPath.row];

    return cell;
}

//
// prepareForSegue:sender:
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        NSLog(@"Nonbasic Wine: %@",self.wine.smells);
    if ([[segue identifier] isEqualToString:@"showTastingDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *itemList = [self.sensoryArrays[indexPath.row] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSString *viewTitle = self.cellTitles[indexPath.row];
        
       // Wine *object = _wineList[indexPath.row];
        [[segue destinationViewController] setItemList:itemList];
        [[segue destinationViewController] setTitle:viewTitle];
        [[segue destinationViewController] setWine:self.wine];
    }
}

@end
