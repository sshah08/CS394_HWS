//
//  Hand.h
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"
@interface Hand : NSObject {
}
@property(nonatomic) NSMutableArray * cards;
-(id)init: (Deck*) deck;
-(void) drawCards:(Deck*) deck;
-(int) getTotal;
-(NSArray*) displayCardsForSimulator;
-(void) displayCards;

@end
