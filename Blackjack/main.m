//
//  main.m
//  Blackjack
//
//  Created by Shalin Shah on 3/1/14.
//  Copyright (c) 2014 Shalin Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hand.h"
#import "Deck.h"
#import "Card.h"
#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        Deck* deck = [[Deck alloc]init];
        
        Hand* player = [[Hand alloc]init:deck];
        
        //
        //        int choice, myTotal, dealerTotal;
        //
        //        bool stay;
        
        [player displayCards];
        //[dealer displayCards];
        
        
        
        
        
        
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
