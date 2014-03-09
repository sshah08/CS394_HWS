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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *hitButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *standButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *betButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *startGame;

@property (weak, nonatomic) IBOutlet UISlider *betSlider;


@property (weak, nonatomic) IBOutlet UITextView *playerField;
@property (weak, nonatomic) IBOutlet UITextView *dealerField;
@property (weak, nonatomic) IBOutlet UILabel *playerPoints;
@property (weak, nonatomic) IBOutlet UILabel *dealerPoints;
@property (weak, nonatomic) IBOutlet UILabel *playerMoneyLeft;
@property (weak, nonatomic) IBOutlet UILabel *betMoney;
@property (weak, nonatomic) IBOutlet UILabel *statusOfGame;



@end

@implementation ViewController
- (IBAction)betSliderValue:(id)sender {
    //display sliderValue from slider...
    int valueOfSlider = self.betSlider.value;
    NSString* convertValueOfSlider = [NSString stringWithFormat:@"%i", valueOfSlider];
    [self.betMoney setText:convertValueOfSlider];
}
- (IBAction)hitMe:(id)sender {
    [_me drawCards:_deck];
    [self.playerField setText:[[_me cardsConcat ] componentsJoinedByString:@"\n"]];
    [self.playerPoints setText:([NSString stringWithFormat:@"%d", [_me getTotal]])];
    //losing and wining conditions after hit me....enable and disable buttons based on conditions so users cant access buttons
    if ([_me getTotal] > 21) {
        [self.statusOfGame setText: @"BUSTED!"];
        [self.hitButton setEnabled:NO];
        [self.startGame setEnabled:YES];
        [self.standButton setEnabled:NO];
        int valueofSlider = self.betSlider.value;
        _bet = _bet - valueofSlider;
        [self.playerMoneyLeft setText: ([NSString stringWithFormat:@"$%i", _bet])];
    }
    if ([_me getTotal] == 21) {
        [self.statusOfGame setText:@"You Won!"];
        [self.hitButton setEnabled:NO];
        [self.startGame setEnabled:YES];
        [self.standButton setEnabled:NO];
        int valueofSlider = self.betSlider.value;
        _bet = _bet + valueofSlider;
        [self.playerMoneyLeft setText: ([NSString stringWithFormat:@"$%i", _bet])];
    }
    [self.betButton setEnabled:NO];
}
- (IBAction)stand:(id)sender {
    [self.startGame setEnabled:YES];
    [self.hitButton setEnabled:NO];
    [self.betButton setEnabled:NO];
    [self.standButton setEnabled:NO];
    [self.dealerField setText:[[_dealer cardsConcat ] componentsJoinedByString:@"\n"]];
    [self.dealerPoints setText:([NSString stringWithFormat:@"%d", [_dealer getTotal]])];
    //conditions of wining and losing!!
    while ([_dealer getTotal] < 17) {
        [_dealer drawCards:_deck];
        [self.dealerField setText:[[_dealer cardsConcat ] componentsJoinedByString:@"\n"]];
        [self.dealerPoints setText:([NSString stringWithFormat:@"%d", [_dealer getTotal]])];
    }
    if ([_dealer getTotal] > 21) {
        [self.statusOfGame setText:@"Dealer Busted! You WON!"];
        int valueofSlider = self.betSlider.value;
        _bet = _bet + valueofSlider;
        [self.playerMoneyLeft setText: ([NSString stringWithFormat:@"$%i", _bet])];
    }
    else if ([_me getTotal] > [_dealer getTotal]) {
        [self.statusOfGame setText:@"You WON!"];
        int valueofSlider = self.betSlider.value;
        _bet = _bet + valueofSlider;
        [self.playerMoneyLeft setText: ([NSString stringWithFormat:@"$%i", _bet])];
    }
    else if([_me getTotal] < [_dealer getTotal]) {
        [self.statusOfGame setText:@"Dealer WON!"];
        int valueofSlider = self.betSlider.value;
        _bet = _bet - valueofSlider;
        [self.playerMoneyLeft setText: ([NSString stringWithFormat:@"$%i", _bet])];
    }
    //if points equal then obviously tied so bet money isnt added or subtracted from total money
    else {
        [self.statusOfGame setText:@"Hand Tied!"];
    }
    
}
- (IBAction)bet:(id)sender {
    [self.betSlider setEnabled:YES];
    [self.statusOfGame setText:Nil];
    [self.hitButton setEnabled:YES];
    [self.standButton setEnabled:YES];
    
}

- (IBAction)startGame:(id)sender {
    [self.statusOfGame setText:@"Press Bet and use Slider"];
    _betSlider.maximumValue = _bet;
    //shuffle deck after 5 games and set it to 0 again
    _numOfGamesPlayed = _numOfGamesPlayed + 1;
    if (_numOfGamesPlayed > 5) {
        [_deck shuffle];
        _numOfGamesPlayed = 0;
    }
    
    //clear inputted random text for testing purposes
    [self.playerField setText:Nil];
    [self.dealerField
     setText:Nil];
    [self.playerPoints setText:Nil];
    [self.dealerPoints setText:Nil];
    [self.betMoney setText:Nil];
    [self.betButton setEnabled:YES];

    [_me resetHands];
    [_me drawCards:_deck];
    [_me drawCards:_deck];
    
    [self.playerField setText:[[_me cardsConcat ] componentsJoinedByString:@"\n"]];
    [self.playerPoints setText:([NSString stringWithFormat:@"%d", [_me getTotal]])];
    [_dealer resetHands];
    [_dealer drawCards:_deck];
    [_dealer drawCards:_deck];
    [self.dealerField setText:[NSString stringWithFormat:@"%@ \n FaceDown 2nd Card", [[_dealer cardsConcat]objectAtIndex:0]]];
    
    [self.startGame setEnabled:NO];
}




- (void)viewDidLoad
{
    //initializes everything when first starting app
    [super viewDidLoad];
    _deck = [[Deck alloc]init];
    _me = [[Hand alloc]init:_deck];
    _dealer = [[Hand alloc]init:_deck];
    _betSlider.minimumValue = 1;
    _betSlider.maximumValue = 100;
    _bet = 100;
    _numOfGamesPlayed = 0;
    [self.hitButton setEnabled:NO];
    [self.standButton setEnabled:NO];
    [self.betButton setEnabled:NO];
    [self.playerMoneyLeft setText:([NSString stringWithFormat:@"$%i", _bet])];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
