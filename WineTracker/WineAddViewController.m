//
//  WineAddViewController.m
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import "WineAddViewController.h"
#import "Wine.h"
#import "CameraControllerViewController.h"
#import "WineAddNonBasicViewController.h"

@interface WineAddViewController ()

@end

@implementation WineAddViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"Basic Information"];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
    self.navigationItem.leftBarButtonItem = cancelButton;
// 
//    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
//    self.navigationItem.rightBarButtonItem = saveButton;
    UIBarButtonItem *nextScreenButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextScreenAction)];
    self.navigationItem.rightBarButtonItem = nextScreenButton;
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.saveButton addTarget:self action:@selector(saveWineAction) forControlEvents:UIControlEventTouchUpInside];
    
    //self.saveButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] targetForAction:@selector(saveAction) withSender:UIControlEventTouchUpInside] ;
    //[myButton addTarget:something action:@selector(myAction) forControlEvents:UIControlEventTouchUpInside];
    //self.saveButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] targetForAction:@selector(saveAction) withSender:self];
    
    
}

- (void)cancelAction {
    NSLog(@"Cancel");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)nextScreenAction {
    NSString *wineName = self.nameTextField.text;
    //NSLog(@"Saving wine: %@",[NSString stringWithFormat:@"Saving wine: %@",wineName]);
    
    NSString *grapeName = self.grapeNameTextfield.text;
    NSString *regionName = self.regionTextField.text;
    float price = [self.priceTextField.text floatValue];
    
    //UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.wine = [[Wine alloc] initWithName:wineName grapeName:grapeName region:regionName price:price image:[self.imageView image]];
    
     NSLog(@"Wine: %@",self.wine);
    
    WineAddNonBasicViewController *nextScreenController = [self.storyboard instantiateViewControllerWithIdentifier:@"WineAddNonBasicViewController"];
    [nextScreenController setWine:self.wine];
     NSLog(@"Next wine: %@",nextScreenController.wine);
    nextScreenController.delegate = self.delegate;
    //[nextScreenController setView:
    
    //[self.navigationController popToViewController:nextScreenController animated:YES];
    [[self navigationController] pushViewController:nextScreenController animated:YES];
    
    
    //NSString *itemToPassBack = @"Pass this value back to ViewControllerA";
    //[self.delegate addItemViewController:self didFinishSavingItem:wineToSend];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveWineAction {
//    NSString *wineName = self.nameTextField.text;
//    NSLog(@"Saving wine: %@",[NSString stringWithFormat:@"Saving wine: %@",self.wine.smells]);
//    
//    NSString *grapeName = self.grapeNameTextfield.text;
//    NSString *regionName = self.regionTextField.text;
//    float price = [self.priceTextField.text floatValue];
    
    //UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //self.wine = [[Wine alloc] initWithName:wineName grapeName:grapeName region:regionName price:price image:[self.imageView image]];
    
   // wineToSave.smells =
    
    //NSString *itemToPassBack = @"Pass this value back to ViewControllerA";
    [self.delegate addItemViewController:self didFinishSavingItem:self.wine];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    [self.imageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:^{}];
}


- (IBAction)cameraButtonTapped:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    [self presentViewController:imagePicker animated:YES completion:^{
        NSLog(@"Camera finished");
    }];
    //[self presentModalViewController:imagePicker animated:YES];
}

- (IBAction)saveButtonTapped:(id)sender {
    [self saveWineAction];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Hide the keyboard");
    [textField resignFirstResponder];
    return YES;
}
@end
