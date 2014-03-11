//
//  DetailViewController.m
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import "DetailViewController.h"
#import "Wine.h"
#import "sensesDetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.title = [self.detailItem name];
        self.detailDescriptionLabel.text = [NSString stringWithFormat:@"%@,%@",[self.detailItem name], [self.detailItem region]];
        self.regionDetailLabel.text = [self.detailItem region];
        self.grapeDetailLabel.text = [self.detailItem grapeName];
        self.priceDetailLabel.text = [NSString stringWithFormat:@"$%.2f",[self.detailItem price]];
        [self.imageView setImage:[self.detailItem image]];
        
        if( [self.detailItem buyAgain] == NO ) {
            self.buyAgainLabel.text = @"Don't buy....";
        }
        
        NSLog(@"Wine smells: %@", self.detailItem.smells);
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIBarButtonItem *tasteDetailButton = [[UIBarButtonItem alloc] initWithTitle:@"Taste Detail" style:UIBarButtonItemStylePlain target:self action:@selector(showDetailView)];
    self.navigationItem.rightBarButtonItem = tasteDetailButton;
    
    [self configureView];
}

- (void)showDetailView {
    
    sensesDetailViewController *nextScreenController = [self.storyboard instantiateViewControllerWithIdentifier:@"sensesDetailViewController"];
    [nextScreenController setDetailItem:self.detailItem];
    
    [[self navigationController] pushViewController:nextScreenController animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"sensesDetailSegue"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [[segue destinationViewController] setDetailItem:self.detailItem];
    }
}


@end
