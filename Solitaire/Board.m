//
//  Board.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "Board.h"
#import "Deck.h"
#import "Card.h"
#import "CardCell.h"

@interface Board ()

@property (atomic,strong) Deck* deck;
@property NSMutableArray<Card*>* faceUpCards;
@property NSMutableArray<Card*>* selectedCards;
@property (readonly) int maxNumberOfFaceUpCards;

@end


@implementation Board

-(id)init{
    
    self = [super init];
    
    if(self){
        _deck = [[Deck alloc] init];
        _faceUpCards = [[NSMutableArray alloc] init];
        _selectedCards = [[NSMutableArray alloc] init];

        
    }
    
    [self initializeBoard];
    return self;
}

-(int)maxNumberOfFaceUpCards{
    return 9;
}

-(void)initializeBoard{
    
    for(int i = 0; i < self.maxNumberOfFaceUpCards; i++){
        Card* card = [_deck deal];
        [_faceUpCards addObject:card];
    }
}

-(BOOL)isLegal{
    return [self containsJQK] || [self containsPairSum11];
}

-(BOOL)containsPairSum11{
    
    if([_selectedCards count] != 2){
        return NO;
    }
    
    int firstCardRankValue = [[_selectedCards firstObject] rankIntegerValue];
    int secondCardRankValue = [[_selectedCards lastObject] rankIntegerValue];
    
    return (firstCardRankValue + secondCardRankValue == 11);

}

-(BOOL)containsJQK{
    
    for(Card*card in _selectedCards){
        if(!([card isJack] || [card isKing] || [card isQueen])){
            return NO;
        }
    }
    
    return YES;
}

-(BOOL)anotherPlayIsPossible{
    return YES;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


//MARK: -   UICollectionView Delegate Methods

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

//MARK: -   DataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.faceUpCards.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CardCell* cell = (CardCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[CardCell identifier] forIndexPath:indexPath];
    
    
    Card* card = [self.faceUpCards objectAtIndex:indexPath.row];
    NSLog(@"Card obtained from faceUpCards: %@",[card description]);
    
    CardViewModel* viewModel = [[CardViewModel alloc] initWith:card];
    
    [cell configureWith:viewModel];
    
    return cell;
}

@end
