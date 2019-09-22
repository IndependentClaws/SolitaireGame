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

    Card* aCard = [[Card alloc] initWithRank:@"K" andWithSuit:@"Hearts" andWithPointValue:[NSNumber numberWithInt:13]];
    
    CardViewModel* viewModel = [[CardViewModel alloc] initWith:aCard];
    UIImage* image = [viewModel cardImage];
    
    NSLog(@"Image info: %@",[image description]);

}


@end
