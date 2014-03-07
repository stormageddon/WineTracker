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

@interface WineAddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *regionTextField;
@property (weak, nonatomic) IBOutlet UITextField *grapeNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (nonatomic, weak) id <WineAddViewControllerDelegate> delegate;

@end
