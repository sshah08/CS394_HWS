//
//  ViewController.h
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Hand.h"
@interface ViewController : UIViewController
@property(nonatomic) Deck * deck;
@property(nonatomic) Hand* me;
@property(nonatomic) Hand* dealer;
@property(nonatomic) int bet;
@property(nonatomic) int numOfGamesPlayed;
@end
