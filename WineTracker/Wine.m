//
//  Wine.m
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import "Wine.h"

@implementation Wine

- (id)initWithName: (NSString *)name grapeName:(NSString *)grapeName region:(NSString *)region price:(float)price image:(UIImage *)image {
    if ( (self = [super init])) {
        self.name = name;
        self.grapeName  = grapeName;
        self.region = region;
        self.price = price;
        self.image = image;
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.region forKey:@"region"];
    [coder encodeObject:self.grapeName forKey:@"grapeName"];
    [coder encodeFloat:self.price forKey:@"price"];
    [coder encodeObject:self.image forKey:@"image"];
    [coder encodeObject:self.sights forKey:@"sights"];
    [coder encodeObject:self.smells forKey:@"smells"];
    [coder encodeObject:self.tastes forKey:@"tastes"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [self init];
    self.name = [coder decodeObjectForKey:@"name"];
    self.region = [coder decodeObjectForKey:@"region"];
    self.grapeName = [coder decodeObjectForKey:@"grapeName"];
    self.price = [coder decodeFloatForKey:@"price"];
    self.image = [coder decodeObjectForKey:@"image"];
    self.sights = [coder decodeObjectForKey:@"sights"];
    self.smells = [coder decodeObjectForKey:@"smells"];
    self.tastes = [coder decodeObjectForKey:@"tastes"];
    
    return self;
}
    

@end
