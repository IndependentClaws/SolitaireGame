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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSLog(@"Before shuffle:");
    Deck* deck1 = [[Deck alloc] init];
    NSLog([deck1 description]);
    
    [deck1 shuffle];
    
    NSLog(@"After shuffle:");
    NSLog([deck1 description]);

}


@end
