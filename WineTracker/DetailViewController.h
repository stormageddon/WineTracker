//
//  DetailViewController.h
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wine;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Wine *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *regionDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapeDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceDetailLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
