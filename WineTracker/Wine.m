//
//  Wine.m
//  WineTracker
//
//  Created by Michael Caputo on 3/6/14.
//  Copyright (c) 2014 Bad Wolf Inc. All rights reserved.
//

#import "Wine.h"

@implementation Wine

//NSString *name;
//NSString *grapeName;
//NSString *region;
//float *price;

- (id)initWithName: (NSString *)name grapeName:(NSString *)grapeName region:(NSString *)region price:(float)price {
    if ( (self = [super init])) {
        self.name = name;
        self.grapeName  = grapeName;
        self.region = region;
        self.price = price;
    }
    
    return self;
}

//- (id)initWithMapName:(NSString *)name player:(Trainer *)player;
//
//{
//    if ( (self = [super init]) ) {
//
//    }
//}


- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.region forKey:@"region"];
    [coder encodeObject:self.grapeName forKey:@"grapeName"];
    [coder encodeFloat:self.price forKey:@"price"];
    
//    [coder encodeBool:isBoardGame forKey:@"isBoardGame"];
//    [coder encodeObject:name    forKey:@"name"];
//    [coder encodeObject:players forKey:@"players"];
//    [coder encodeObject:ogres   forKey:@"ogres"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [self init];
    self.name = [coder decodeObjectForKey:@"name"];
    self.region = [coder decodeObjectForKey:@"region"];
    self.grapeName = [coder decodeObjectForKey:@"grapeName"];
    self.price = [coder decodeFloatForKey:@"price"];
//    self.isBoardGame = [coder decodeBoolForKey:@"isBoardGame"];
//    self.name    = [coder decodeObjectForKey:@"name"];
//    self.players = [coder decodeObjectForKey:@"players"];
//    NSDictionary *ogreDict = [coder decodeObjectForKey:@"ogres"];
//    self.ogres   = [[NSMutableDictionary alloc] initWithDictionary:ogreDict copyItems:YES];
    return self;
}
    

@end
