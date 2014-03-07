//
//  AddWineView.h
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddWineView : UIView
@property (weak, nonatomic) IBOutlet UITextField *wineNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *regionTextField;
@property (weak, nonatomic) IBOutlet UITextField *grapeNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;

@end
