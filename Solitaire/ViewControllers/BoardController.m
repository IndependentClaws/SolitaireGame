//
//  BoardController.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "BoardController.h"
#import "CardCell.h"
#import "Board.h"
#import "CardViewModel.h"
#import "Card.h"

@interface BoardController ()

@property (strong, atomic) Board* board;

@end

@implementation BoardController

static NSString * const reuseIdentifier = @"Cell";

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.board = [[Board alloc] init];
    

    [self.collectionView registerClass:[CardCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
   
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
        return self.board.maxNumberOfBoardCards;
   
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
        CardCell* cell = (CardCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[CardCell identifier] forIndexPath:indexPath];
    
    
        Card* card = [self.board boardCardAtIndexPath:indexPath];
    
        NSLog(@"Card obtained from faceUpCards: %@",[card description]);
    
        CardViewModel* viewModel = [[CardViewModel alloc] initWith:card];
    
        [cell configureWith:viewModel];
    
        return cell;
    
}


@end
