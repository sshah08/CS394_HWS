//
//  Deck.m
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//

#import "Deck.h"

@implementation Deck
-(id) init {
    self = [super init];
    _cards = [[NSMutableArray alloc]init];
    
    //Spades
    //Ace is given facevalue of 1
    for (int i = 1; i < 11; ++i) {
        Card* temp = [[Card alloc]init];
        [temp setSuit:@"Spade"];
        [temp setCardValue:i];
        NSString* convertFaceValue = [NSString stringWithFormat:@"%d", i];
        [temp setFaceName:convertFaceValue];
        [_cards addObject:temp];
    }
    Card* spadeJack = [[Card alloc]init];
    [spadeJack setSuit:@"Spade"];
    [spadeJack setCardValue:10];
    [spadeJack setFaceName:@"Jack"];
    [_cards addObject:spadeJack];
    
    Card* spadeQueen = [[Card alloc]init];
    [spadeQueen setSuit:@"Spade"];
    [spadeQueen setCardValue:10];
    [spadeQueen setFaceName:@"Queen"];
    [_cards addObject:spadeQueen];
    
    Card* spadeKing = [[Card alloc]init];
    [spadeKing setSuit:@"Spade"];
    [spadeKing setCardValue:10];
    [spadeKing setFaceName:@"King"];
    [_cards addObject:spadeKing];
    //Hearts
    for (int i = 1; i < 11; ++i) {
        Card* temp = [[Card alloc]init];
        [temp setSuit:@"Hearts"];
        [temp setCardValue:i];
        NSString* convertFaceValue = [NSString stringWithFormat:@"%d", i];
        [temp setFaceName:convertFaceValue];
        [_cards addObject:temp];
    }
    Card* heartsJack = [[Card alloc]init];
    [heartsJack setSuit:@"Spade"];
    [heartsJack setCardValue:10];
    [heartsJack setFaceName:@"Jack"];
    [_cards addObject:heartsJack];
    
    Card* heartsQueen = [[Card alloc]init];
    [heartsQueen setSuit:@"Hearts"];
    [heartsQueen setCardValue:10];
    [heartsQueen setFaceName:@"Queen"];
    [_cards addObject:heartsQueen];
    
    Card* heartsKing = [[Card alloc]init];
    [heartsKing setSuit:@"Hearts"];
    [heartsKing setCardValue:10];
    [heartsKing setFaceName:@"King"];
    [_cards addObject:heartsKing];
    //Diamonds
    for (int i = 1; i < 11; ++i) {
        Card* temp = [[Card alloc]init];
        [temp setSuit:@"Diamonds"];
        [temp setCardValue:i];
        NSString* convertFaceValue = [NSString stringWithFormat:@"%d", i];
        [temp setFaceName:convertFaceValue];
        [_cards addObject:temp];
    }
    Card* diamondsJack = [[Card alloc]init];
    [diamondsJack setSuit:@"Diamonds"];
    [diamondsJack setCardValue:10];
    [diamondsJack setFaceName:@"Jack"];
    [_cards addObject:diamondsJack];
    
    Card* diamondsQueen = [[Card alloc]init];
    [diamondsQueen setSuit:@"Diamonds"];
    [diamondsQueen setCardValue:10];
    [diamondsQueen setFaceName:@"Queen"];
    [_cards addObject:diamondsQueen];
    
    Card* diamondsKing = [[Card alloc]init];
    [diamondsKing setSuit:@"Diamonds"];
    [diamondsKing setCardValue:10];
    [diamondsKing setFaceName:@"King"];
    [_cards addObject:diamondsKing];
    
    //Clubs
    for (int i = 1; i < 11; ++i) {
        Card* temp = [[Card alloc]init];
        [temp setSuit:@"Clubs"];
        [temp setCardValue:i];
        NSString* convertFaceValue = [NSString stringWithFormat:@"%d", i];
        [temp setFaceName:convertFaceValue];
        [_cards addObject:temp];
    }
    Card* clubsJack = [[Card alloc]init];
    [clubsJack setSuit:@"Clubs"];
    [clubsJack setCardValue:10];
    [clubsJack setFaceName:@"Jack"];
    [_cards addObject:clubsJack];
    
    Card* clubsQueen = [[Card alloc]init];
    [clubsQueen setSuit:@"Clubs"];
    [clubsQueen setCardValue:10];
    [clubsQueen setFaceName:@"Queen"];
    [_cards addObject:clubsQueen];
    
    Card* clubsKing = [[Card alloc]init];
    [clubsKing setSuit:@"Clubs"];
    [clubsKing setCardValue:10];
    [clubsKing setFaceName:@"King"];
    [_cards addObject:clubsKing];
    
    return self;
}

-(id) drawFromDeck {
    int index = rand()%[_cards count];
    Card* cardAtCurrentIndex = [_cards objectAtIndex:index];
    [_cards removeObjectAtIndex:index];
    return cardAtCurrentIndex;
}
@end
