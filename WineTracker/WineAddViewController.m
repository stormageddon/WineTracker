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

    UIBarButtonItem *nextScreenButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextScreenAction)];
    self.navigationItem.rightBarButtonItem = nextScreenButton;
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.saveButton addTarget:self action:@selector(saveWineAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)cancelAction {
    NSLog(@"Cancel");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)nextScreenAction {
    NSString *wineName = self.nameTextField.text;
    NSString *grapeName = self.grapeNameTextfield.text;
    NSString *regionName = self.regionTextField.text;
    float price = [self.priceTextField.text floatValue];
    
    if( self.buyAgainSegmentedControl.selectedSegmentIndex == 0) {
        [self.wine setBuyAgain:YES];
    }
    else {
        [self.wine setBuyAgain:NO];
    }
    
    self.wine = [[Wine alloc] initWithName:wineName grapeName:grapeName region:regionName price:price image:[self.imageView image] buyAgain:(self.buyAgainSegmentedControl.selectedSegmentIndex == 0)];

    WineAddNonBasicViewController *nextScreenController = [self.storyboard instantiateViewControllerWithIdentifier:@"WineAddNonBasicViewController"];
    [nextScreenController setWine:self.wine];
     NSLog(@"Next wine: %@",nextScreenController.wine);
    nextScreenController.delegate = self.delegate;

    [[self navigationController] pushViewController:nextScreenController animated:YES];

}

- (void)saveWineAction {
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
    [self presentViewController:imagePicker animated:YES completion:^{}];
    
}

- (IBAction)saveButtonTapped:(id)sender {
    [self saveWineAction];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
