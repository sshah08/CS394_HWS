//
//  Card.h
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property(nonatomic) int cardValue;
@property(nonatomic) NSString* suit;
@property(nonatomic) NSString* faceName;

-(id)init: (NSString*) s
suitValue: (int) val
 faceName: (NSString*) face;
@end
