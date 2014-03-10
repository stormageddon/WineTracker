//
//  TastingListViewViewController.h
//  WineTracker
//
//  Created by Michael Caputo on 3/9/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wine;

@interface TastingListViewViewController : UITableViewController

@property (nonatomic, copy)NSArray *itemList;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)Wine *wine;

@end
