//
//  sensesDetailViewController.h
//  WineTracker
//
//  Created by Michael Caputo on 3/9/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Wine;

@interface sensesDetailViewController : UITableViewController

@property (strong, nonatomic) Wine *detailItem;

@end
