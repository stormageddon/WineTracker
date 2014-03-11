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
    NSArray *smells = @[
                        @"Apple",
                        @"Green Apple",
                        @"Apple Sauce",
                        @"Apricot",
                        @"Jelly",
                        @"Banana",
                        @"Citrus",
                        @"Mango",
                        @"Lemon",
                        @"Lime",
                        @"Crisp",
                        @"Zingy",
                        @"Tart",
                        @"Tangy",
                        @"Sharp",
                        @"Refreshing",
                        @"Bracing",
                        @"Bright",
                        @"Pear",
                        @"Kiwi",
                        @"Peach",
                        @"Melon",
                        @"Pineapple",
                        @"Cranberry",
                        @"Black Cherry",
                        @"Cherry",
                        @"Raspberry",
                        @"Plum",
                        @"Blueberry",
                        @"Blackberry",
                        @"Fig",
                        @"Oaky",
                        @"Toasty",
                        @"Nutty",
                        @"Mocha",
                        @"Coffee",
                        @"Spicy",
                        @"Herbal",
                        @"Floral",
                        @"Vanilla",
                        @"Chocolate",
                        @"Cocunut",
                        @"Sweet",
                        @"Light Bodied",
                        @"Medium Bodied",
                        @"Full Bodied",
                        @"Fruity",
                        @"Sweet",
                        @"Dry",
                        @"Sour",
                        @"Bitter",
                        @"Earthy",
                        @"Diesel"
                    ];
    
    NSArray *tastes = @[
                        @"Apple",
                        @"Green Apple",
                        @"Apple Sauce",
                        @"Apricot",
                        @"Jelly",
                        @"Banana",
                        @"Citrus",
                        @"Mango",
                        @"Lemon",
                        @"Lime",
                        @"Crisp",
                        @"Zingy",
                        @"Tart",
                        @"Tangy",
                        @"Sharp",
                        @"Refreshing",
                        @"Bracing",
                        @"Bright",
                        @"Pear",
                        @"Kiwi",
                        @"Peach",
                        @"Melon",
                        @"Pineapple",
                        @"Cranberry",
                        @"Black Cherry",
                        @"Cherry",
                        @"Raspberry",
                        @"Plum",
                        @"Blueberry",
                        @"Blackberry",
                        @"Fig",
                        @"Oaky",
                        @"Toasty",
                        @"Nutty",
                        @"Mocha",
                        @"Coffee",
                        @"Spicy",
                        @"Herbal",
                        @"Floral",
                        @"Vanilla",
                        @"Chocolate",
                        @"Cocunut",
                        @"Sweet",
                        @"Light Bodied",
                        @"Medium Bodied",
                        @"Full Bodied",
                        @"Fruity",
                        @"Sweet",
                        @"Dry",
                        @"Sour",
                        @"Bitter",
                        @"Earthy",
                        @"Diesel"
                    ];
    
    NSArray *sights = @[
                        @"Red",
                        @"White",
                        @"Bubbles",
                        @"Rose",
                        @"Yellow",
                        @"Gold",
                        @"Thick",
                        @"Light",
                        @"Airy",
                        @"Heavy"
                    ];
    
    
    
    self.sensoryArrays = @[sights, smells, tastes];
    
    self.title = @"Tasting Information";
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

- (void)saveAction
{
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
