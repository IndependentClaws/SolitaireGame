//
//  GameViewController.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/22/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "GameViewController.h"
#import "CardCell.h"
#import "Board.h"


@interface GameViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *boardCollectionView;
@property (strong,nonatomic) Board* board;

@end

@implementation GameViewController

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self.boardCollectionView setDataSource:self.board];
    [self.boardCollectionView setDelegate:self.board];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.board = [[Board alloc] init];
    [self.boardCollectionView registerClass:[CardCell class] forCellWithReuseIdentifier:[CardCell identifier]];
   
    // Do any additional setup after loading the view.
    [self.boardCollectionView reloadData];
   
    [self.boardCollectionView reloadData];
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


@end
