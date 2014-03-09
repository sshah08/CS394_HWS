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
@property (nonatomic) NSMutableArray* cardsDrawn;
-(id)init;
-(id)drawFromDeck;
-(void) shuffle;

@end
