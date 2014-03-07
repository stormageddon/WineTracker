//
//  WineListCell.h
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WineListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *wineNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;

@end
