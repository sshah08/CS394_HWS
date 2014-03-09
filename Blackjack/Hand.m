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
        _cardsDrawn = [[NSMutableArray alloc]init];
    }
    return self;
}
//draw cards from Deck and add it to cardsDrawn array
-(void) drawCards:(Deck*) deck {
    Card* c = [deck drawFromDeck];
    [_cardsDrawn addObject:c];
}

//get total for card value and display to screen
-(int) getTotal {
    int total = 0;
    bool ace = NO;
    for(Card* temp in _cardsDrawn) {
        if ([temp cardValue]==1){
            ace = YES;
        }
        total = total + [temp cardValue];
    }
    
    if(total <= 11 & ace == NO) {
        total = total + 10;
    }
    return total;
}

//convert Card oBject to strings data so you can use the new line character to display in textField.  return the array.
-(NSMutableArray*) cardsConcat{
    NSMutableArray* stringsCardData = [[NSMutableArray alloc]init];
    for(Card* i in _cardsDrawn){
        [stringsCardData addObject:([NSString stringWithFormat:@"%@ %@ %d",i.suit, i.faceName, i.cardValue])];
        
    }
    return stringsCardData;
}


//reset array cardsDrawn everytime newGame button is pressed
-(void) resetHands {
    [_cardsDrawn removeAllObjects];
}

@end
