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
@property int maxNumberOfBoardCards;

@end


@implementation Board

-(id)initWithMaximumNumberOfBoardCards:(int)maxNumberOfBoardCards{
    
    self = [super init];
    
    if(self){
        _deck = [[Deck alloc] init];
        _faceUpCards = [[NSMutableArray alloc] init];
        _maxNumberOfBoardCards = maxNumberOfBoardCards;
        
    }
    
    [self initializeBoard];
    
    return self;
}

-(int)maxNumberOfFaceUpCards{
    return 9;
}

-(void)initializeBoard{
    
    for(int i = 0; i < _maxNumberOfBoardCards; i++){
        Card* card = [_deck deal];
        [_faceUpCards addObject:card];
    }
}

-(BOOL)isLegal:(NSArray<NSNumber*>*)indices{
    return [self containsJQK:indices] || [self containsPairSum11:indices];
}

-(BOOL)containsPairSum11:(NSArray<NSNumber*>*)indices{
    
    NSArray<Card*>* selectedCards = [self getSelectedCardsFor:indices];

    if([selectedCards count] != 2){
        return NO;
    }
    
    int firstCardRankValue = [[selectedCards firstObject] rankIntegerValue];
    int secondCardRankValue = [[selectedCards lastObject] rankIntegerValue];
    
    return (firstCardRankValue + secondCardRankValue == 11);

}

-(BOOL)containsJQK:(NSArray<NSNumber*>*)indices{
    
    NSArray<Card*>* selectedCards = [self getSelectedCardsFor:indices];
    
    for(Card*card in selectedCards){
        if(!([card isJack] || [card isKing] || [card isQueen])){
            return NO;
        }
    }
    
    return YES;
}

-(NSArray<Card*>*)getSelectedCardsFor:(NSArray<NSNumber*>*)indices{
    NSMutableArray<Card*>* selectedCards = [[NSMutableArray alloc] init];
    
    for(NSNumber* index in indices){
        Card* card = [_faceUpCards objectAtIndex:index.integerValue];
        [selectedCards addObject:card];
    }
    
    return [[NSArray alloc] initWithArray:selectedCards];
}

-(BOOL)anotherPlayIsPossible{
    
    int numberOfJKQ = 0;
    
    for(Card*card in _faceUpCards){
        if(card.isKing || card.isQueen || card.isJack){
            numberOfJKQ += 1;
        }
    }
    
    int numberOfPairsSum11 = 0;
    
    for(int i = self.faceUpCards.count-1; i > 0; i--){
        for(int j = 0; j < i; j++){
            int rankVal1 = [self.faceUpCards objectAtIndex:i].rankIntegerValue;
            int rankVal2 = [self.faceUpCards objectAtIndex:j].rankIntegerValue;
            
                if(rankVal1 + rankVal2 == 11){
                    numberOfPairsSum11 += 1;
                }
            
            }
        }
    

    
    return (numberOfPairsSum11 > 0)||(numberOfJKQ >= 3);
}



-(Card*)boardCardAtIndexPath:(NSIndexPath*)indexPath{
    
    return [self.faceUpCards objectAtIndex:indexPath.row];
    
}

@end
