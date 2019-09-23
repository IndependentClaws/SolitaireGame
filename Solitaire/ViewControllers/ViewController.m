//
//  ViewController.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "Deck.h"
#import "CardViewModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    Deck* deck1 = [[Deck alloc] init];
    Deck* deck2 = [[Deck alloc] init];
    
    Deck* deck3 = [[Deck alloc] initWithRanks:@[@"K",@"Q",@"J"] andWithSuits:@[@"red",@"blue"] andWithPointValues:@[
        [NSNumber numberWithInt:10],
        [NSNumber numberWithInt:20],
        [NSNumber numberWithInt:30]
                                                                        
        ]];
    
    Deck* deck4 = [[Deck alloc] initWithRanks:@[@"K",@"Q",@"J"] andWithSuits:@[@"red",@"blue"] andWithPointValues:@[
        [NSNumber numberWithInt:10],
        [NSNumber numberWithInt:20],
        [NSNumber numberWithInt:30]
        ]];
    
    
    Deck* deck5 = [[Deck alloc] initWithRanks:@[@"K",@"Q",@"J"] andWithSuits:@[@"red",@"blue",@"green"] andWithPointValues:@[
        [NSNumber numberWithInt:10],
        [NSNumber numberWithInt:20],
        [NSNumber numberWithInt:30]
        ]];

    NSLog(@"deck1 equals deck2 TRUE: %@",[deck1 isEqual:deck2] ? @"true":@"false");
    NSLog(@"deck1 equals deck3 FALSE: %@",[deck1 isEqual:deck3] ? @"true":@"false");
    NSLog(@"deck3 equals deck4 TRUE: %@",[deck3 isEqual:deck4] ? @"true":@"false");
    NSLog(@"deck4 equals deck5 FALSE: %@",[deck4 isEqual:deck5] ? @"true":@"false");
    




}


@end
