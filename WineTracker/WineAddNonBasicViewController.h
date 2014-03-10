//
//  WineAddNonBasicViewController.h
//  WineTracker
//
//  Created by Michael Caputo on 3/8/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Wine;
@class WineAddViewController;
@class WineAddNonBasicViewController;

@protocol WineAddViewControllerDelegate;

@interface WineAddNonBasicViewController : UITableViewController

@property (nonatomic, strong) Wine *wine;
@property (nonatomic, weak) id <WineAddViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *grapeNameTextfield;

@end
