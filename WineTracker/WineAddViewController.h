//
//  WineAddViewController.h
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WineAddViewController;
@class Wine;

@protocol WineAddViewControllerDelegate <NSObject>
- (void)addItemViewController:(WineAddViewController *)controller didFinishSavingItem:(Wine *)item;
@end

@interface WineAddViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) Wine *wine;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *regionTextField;
@property (weak, nonatomic) IBOutlet UITextField *grapeNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (nonatomic, weak) id <WineAddViewControllerDelegate> delegate;
// @property (weak, nonatomic) IBOutlet UIButton *showCameraButton;
@property (weak, nonatomic) IBOutlet UIButton *showCameraButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)cameraButtonTapped:(id)sender;
- (IBAction)saveButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *buyAgainSegmentedControl;

@end
