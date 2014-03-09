//
//  Card.m
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//

#import "Card.h"

@implementation Card
//initialize Card object with suit, faceName, and card value
-(id)init: (NSString*) s
suitValue: (int) val
 faceName: (NSString*) face {
    self = [super init];
    if (self) {
        _cardValue = val;
        _suit = s;
        _faceName = face;
    }
    
    return self;
    
}


@end
