//
//  Deck.h
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject
@property(nonatomic) NSMutableArray * cards;
-(id)init;
-(id)drawFromDeck;

@end
