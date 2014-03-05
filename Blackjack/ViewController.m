//
//  ViewController.m
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "Deck.h"
#import "Hand.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayCurrentCards;
@property (weak, nonatomic) IBOutlet UILabel *displayFaceName;
@property (weak, nonatomic) IBOutlet UILabel *displayCardValue;
@property (weak, nonatomic) IBOutlet UILabel *card2Suit;
@property (weak, nonatomic) IBOutlet UILabel *card2FaceName;
@property (weak, nonatomic) IBOutlet UILabel *card2Value;
@property (weak, nonatomic) IBOutlet UILabel *dealerSuit;
@property (weak, nonatomic) IBOutlet UILabel *dealerFaceName;
@property (weak, nonatomic) IBOutlet UILabel *dealer2Suit;
@property (weak, nonatomic) IBOutlet UILabel *dealer2FaceName;
@property (weak, nonatomic) IBOutlet UILabel *dealer2Value;
@property (weak, nonatomic) IBOutlet UILabel *dealerValue;
@property (weak, nonatomic) IBOutlet UILabel *totalPoints;
@property (weak, nonatomic) IBOutlet UILabel *card3Suit;
@property (weak, nonatomic) IBOutlet UILabel *card3FaceName;
@property (weak, nonatomic) IBOutlet UILabel *card3Value;
@property (weak, nonatomic) IBOutlet UILabel *dealer3Suit;
@property (weak, nonatomic) IBOutlet UILabel *dealer3FaceName;
@property (weak, nonatomic) IBOutlet UILabel *dealer3Value;

@end

@implementation ViewController




- (IBAction)hitCard:(id)sender {
    [_me drawCards:_deck];
    [_dealer drawCards:_deck];
    Card* cardTemp;
    //Card* dealerTemp;
    NSString* total = [[self totalPoints]text];
    int totVal = total.intValue;
    NSArray* temp = [_me displayCardsForSimulator];
    //NSArray* temp1 = [_dealer displayCardsForSimulator];
    int c3val;
    NSString *cardSuit, *cardFaceName;
    
    if (totVal > 21) {
        [self.totalPoints setText:@"BUSTED!"];
        
    }
    else {
        [_me drawCards:_deck];
        cardTemp = [temp objectAtIndex:2];
        c3val = cardTemp.cardValue;
        totVal = c3val + totVal;
        cardSuit= cardTemp.suit;
        cardFaceName = cardTemp.faceName;
        NSString* cardValueString = [NSString stringWithFormat:@"%i", cardTemp.cardValue];
        NSString* totalString = [NSString stringWithFormat:@"%i", totVal];
        [self.card3Suit setText:cardSuit];
        [self.card3FaceName setText:cardFaceName];
        [self.card3Value setText:cardValueString];
        if (totVal > 21) {
            [self.totalPoints setText:@"BUSTED!"];
        }
        else {
            [self.totalPoints setText:totalString];
            c3val = 0;
        }
        
    }
    
    
    
    
        
    
    
}

- (IBAction)newGame:(id)sender {
    //reset buttons for new game
    [self.displayCurrentCards setText:@" "];
    [self.displayFaceName setText:@" "];
    [self.displayCardValue setText:@" "];
    [self.card2Suit setText:@" "];
    [self.card2FaceName setText:@" "];
    [self.card2Value setText:@" "];
    [self.totalPoints setText:@" "];
    [self.dealerSuit setText:@" "];
    [self.dealerFaceName setText:@" "];
    [self.dealerValue setText:@" "];
    [self.dealer2Suit setText:@" "];
    [self.dealer2FaceName setText:@" "];
    [self.dealer2Value setText:@" "];
    [self.card3Suit setText:@" "];
    [self.card3FaceName setText:@" "];
    [self.card3Value setText:@" "];
    [self.dealer3Suit setText:@" "];
    [self.dealer3FaceName setText:@" "];
    [self.dealer3Value setText:@" "];

    Card* cardTemp;
    Card* cardTemp2;

    NSArray* dealerTemp = [[NSArray alloc]init];
    dealerTemp= [_dealer displayCardsForSimulator];
    NSArray* temp = [_me displayCardsForSimulator];
    NSString *cardSuit, *cardFaceName;
    //int c1val, c2val,totVal;
    cardTemp = [temp objectAtIndex:0];
    cardSuit= cardTemp.suit;
    cardFaceName = cardTemp.faceName;
    //c1val = cardTemp.cardValue;
    int c1val = [_me getTotal];
    NSString* cardValueString = [NSString stringWithFormat:@"%i", cardTemp.cardValue];
    [self.displayCurrentCards setText:cardSuit];
    [self.displayFaceName setText:cardFaceName];
    [self.displayCardValue setText:cardValueString];
    cardTemp2 = [temp objectAtIndex:1];
    cardSuit= cardTemp2.suit;
    cardFaceName = cardTemp2.faceName;
    //c2val = cardTemp2.cardValue;
    //totVal = c1val + c2val;
    NSString* totValueStr = [NSString stringWithFormat:@"%i", c1val];
    NSString* cardValueString2 = [NSString stringWithFormat:@"%i", cardTemp2.cardValue];
    [self.card2Suit setText:cardSuit];
    [self.card2FaceName setText:cardFaceName];
    [self.card2Value setText:cardValueString2];
    [self.totalPoints setText:totValueStr];
    
    
    //dealer
    cardTemp = [dealerTemp objectAtIndex:0];
    cardSuit= cardTemp.suit;
    cardFaceName = cardTemp.faceName;
    NSString* cardValueString3 = [NSString stringWithFormat:@"%i", cardTemp.cardValue];
    [self.dealerSuit setText:cardSuit];
    [self.dealerFaceName setText:cardFaceName];
    [self.dealerValue setText:cardValueString3];
    cardTemp2 = [dealerTemp objectAtIndex:1];
    cardSuit= cardTemp2.suit;
    cardFaceName = cardTemp2.faceName;
    NSString* cardValueString4 = [NSString stringWithFormat:@"%i", cardTemp2.cardValue];
    [self.dealer2Suit setText:cardSuit];
    [self.dealer2FaceName setText:cardFaceName];
    [self.dealer2Value setText:cardValueString4];

    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _deck = [[Deck alloc]init];
    _me = [[Hand alloc]init:_deck];
    _dealer = [[Hand alloc]init:_deck];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
