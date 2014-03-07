//
//  Wine.h
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wine : NSObject <NSCoding>

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *grapeName;
@property (nonatomic,strong) NSString *region;
@property (nonatomic) float price;

- (id)initWithName: (NSString *)name grapeName:(NSString *)grapeName region:(NSString *)region price:(float)price;

@end
