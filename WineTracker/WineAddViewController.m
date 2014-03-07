//
//  WineAddViewController.m
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import "WineAddViewController.h"
#import "Wine.h"

@interface WineAddViewController ()

@end

@implementation WineAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        

        
//        
//        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showAddView)];
//        self.navigationItem.rightBarButtonItem = addButton;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveAction {
    NSString *wineName = self.nameTextField.text;
    //NSLog(@"Saving wine: %@",[NSString stringWithFormat:@"Saving wine: %@",wineName]);
    
    NSString *grapeName = self.grapeNameTextfield.text;
    NSString *regionName = self.regionTextField.text;
    float price = [self.priceTextField.text floatValue];
    
    Wine *wineToSave = [[Wine alloc] initWithName:wineName grapeName:grapeName region:regionName price:price];
    
    //NSString *itemToPassBack = @"Pass this value back to ViewControllerA";
    [self.delegate addItemViewController:self didFinishSavingItem:wineToSave];
}

@end
