//
//  Hand.m
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//
#import "ViewController.h"
#import "Hand.h"

@implementation Hand
-(id) init:(Deck*) deck {
    self = [super init];
    if (self) {
        _cards = [[NSMutableArray alloc]init];
        [self drawCards: deck];
        [self drawCards: deck];
    }
    return self;
}

-(void) drawCards:(Deck*) deck {
    Card* c = [deck drawFromDeck];
    [_cards addObject:c];
}

-(int) getTotal {
    int total = 0;
    bool ace = NO;
    for(Card* temp in _cards) {
        if ([temp getPoint]==1){
            ace = YES;
        }
        total = total + [temp getPoint];
    }
    
    if(total <= 11 & ace == NO) {
        total = total + 10;
    }
    return total;
}

-(void)displayCards {
     Card* valuesOfAllCards;
        for (int i = 0; i < [_cards count]; ++i) {
            valuesOfAllCards = [_cards objectAtIndex:i];
            NSLog(@"Value of Card %d, Suit: %@ and Facename: %@", valuesOfAllCards.cardValue, valuesOfAllCards.suit, valuesOfAllCards.faceName);
    }
    
}
-(NSArray*)displayCardsForSimulator {
//    Card* valuesOfAllCards;
//    for (int i = 0; i < [_cards count]; ++i) {
//        valuesOfAllCards = [_cards objectAtIndex:i];
//        NSLog(@"Value of Card %d, Suit: %@ and Facename: %@", valuesOfAllCards.cardValue, valuesOfAllCards.suit, valuesOfAllCards.faceName);
//    }
    return _cards;
}
@end
