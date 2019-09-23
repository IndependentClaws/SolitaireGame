//
//  GameViewController.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/22/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "GameViewController.h"
#import "GameCardCell.h"
#import "Board.h"


@interface GameViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *boardCollectionView;
@property (strong,nonatomic) Board* board;

@end

@implementation GameViewController

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
 
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.board = [[Board alloc] init];
    
    [self.boardCollectionView registerClass:[GameCardCell class] forCellWithReuseIdentifier:[GameCardCell identifier]];
   
  
    NSLog(@"Collection View Info: %@",[_boardCollectionView description]);
    NSLog(@"Number of visible cells: %d",[[_boardCollectionView visibleCells] count]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.board.maxNumberOfBoardCards;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GameCardCell* cell = (GameCardCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[GameCardCell identifier] forIndexPath:indexPath];
    
    
    Card* card = [self.board boardCardAtIndexPath:indexPath];
    
    CardViewModel* viewModel = [[CardViewModel alloc] initWith:card];
    
    [cell configureWith:viewModel];
    
    [cell setHidden:NO];
    
    if(cell){
        NSLog(@"Information about cell %@",[cell description]);

    } else {
        NSLog(@"The cell is nil");
    }
    
    return cell;
}


@end
