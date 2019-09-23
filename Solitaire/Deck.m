//
//  Deck.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck ()

@property (strong,atomic)NSMutableArray<Card*>*cards;
@property (readonly) unsigned long size;
@property (readonly) BOOL isEmpty;
@property (readwrite) unsigned long topCardIndex;

@property (copy) NSMutableArray<Card*>*(^generator)(void);


@end

@implementation Deck



-(id)initWithDeck:(Deck*)otherDeck{
    
    self = [super init];
    
    if(self){
        
        _generator = ^{
            return otherDeck.cards;
        };
        
        _cards = _generator();
        
        [self shuffle];
    }
    
    return self;
}


-(id)initWithCards:(NSArray<Card*>*)cards{
    
    self = [super init];
    
    if(self){
        
        _generator = ^{
            return [NSMutableArray arrayWithArray:cards];
        };
        
        _cards = _generator();
        
        [self shuffle];
    }
    
    return self;
}


-(id)init{
    
    self = [super init];
    
    if(self){
        

        _generator = ^{
            
            
            int pointValue = 1;
            NSMutableArray<Card*>*cards = [[NSMutableArray alloc] init];
            
            for(NSString* rank in [Deck GetDefaultRanks]){
                for(NSString* suit in [Deck GetDefaultSuits]){
                    
                    Card* newCard = [[Card alloc] initWithRank:rank andWithSuit:suit andWithPointValue:[NSNumber numberWithInt:pointValue]];
                    [cards addObject:newCard];
                    
                }
                pointValue += 1;

            }
            
            return cards;
        };
        
        _cards = _generator();
        
        [self shuffle];
        
        _topCardIndex = [_cards count] - 1;

    }
    
    return self;
}

//pointValues array must have same length as ranks array
-(id)initWithRanks:(NSArray<NSString*>*)ranks andWithSuits: (NSArray<NSString*>*)suits andWithPointValues: (NSArray<NSNumber *>*)pointValues{
    
    self = [super init];
    
    if(self){
        
        _generator = ^{
            
            NSMutableArray<Card*>* cards = [[NSMutableArray alloc] init];
            
            for(int i = 0; i < [ranks count]; i++){
                for(int j = 0; j < [suits count]; j++){
                
                Card* card = [[Card alloc] initWithRank:[ranks objectAtIndex:i] andWithSuit:[suits objectAtIndex:j] andWithPointValue:[pointValues objectAtIndex:i]];
                
                    [cards addObject:card];
                }
            }
            
            return cards;
        };
        
        _cards = _generator();
        
        [self shuffle];
        _topCardIndex = [_cards count] - 1;
    }
    
    return self;
}

-(BOOL)isEqual:(Deck*)otherDeck{
    
    NSMutableArray<Card*>* currentDeckCards = self.generator();
    NSMutableArray<Card*>* otherDeckCards = otherDeck.generator();
    
    if(currentDeckCards.count != otherDeckCards.count){
        return NO;
    }
    
    for(int i = 0; i < currentDeckCards.count; i++){
        Card* currentDeckCard = [currentDeckCards objectAtIndex:i];
        Card* otherDeckCard = [otherDeckCards objectAtIndex:i];
        
        if(![currentDeckCard isEqual:otherDeckCard]){
            return NO;
        }
    }
    
    return YES;
    
}


-(unsigned long)size{
    return [_cards count];
}

-(BOOL)isEmpty{
    return [self size] == 0;
}

-(Card*)deal{
    if(_topCardIndex > 0 && _topCardIndex < [self size]){
        unsigned long currentIndex = _topCardIndex;
        _topCardIndex--;
        return [_cards objectAtIndex:currentIndex];
    } else {
        return nil;
    }
   
}

-(void)shuffle{
    for(int k = [self size]; k > 0; k--){
        
        int randIndex = (int)arc4random_uniform((UInt32)k);
        //Swap the random card with the card at the top of the deck
        Card* tempCard = [_cards objectAtIndex:k-1];
        Card* randomCard = [_cards objectAtIndex:randIndex];
        [_cards replaceObjectAtIndex:randIndex withObject:tempCard];
        [_cards replaceObjectAtIndex:k-1 withObject:randomCard];
    }
    
}

-(NSString*)description{
    NSString* str = [NSString stringWithFormat:@"The current deck has %u cards \n",self.size];
    
    for(Card*card in _cards){
        str = [str stringByAppendingString:[card description]];
        str = [str stringByAppendingString:@"\n"];
    }
    
    return str;
}

+(NSArray<NSString*>*)GetDefaultRanks{
    return @[ @"A",@"2",@"3",@"4",@"5",@"6",@"7",
              @"8",@"9",@"10", @"J",@"Q",@"K"];
}

+(NSArray<NSString*>*)GetDefaultSuits{
    return @[@"Hearts",@"Diamonds",@"Clubs",@"Spades"];
}


+(NSArray<Card*>*)performPerfectShuffle:(NSArray<Card*>*)cards{
    
    //Determine the midpoint of the card array
    int midpoint = [cards count]/2;
    
    //Initialize an empty card array with the same capacity as the card array to be shuffled
    NSMutableArray<Card*>* shuffledCards = [NSMutableArray arrayWithArray:cards];
    
    
    //The first half of the deck will be assigned to even-indexed positions
    for(int j = 0,k=0; j < midpoint; j++,k+=2){
        Card* card = [cards objectAtIndex:j];
        [shuffledCards replaceObjectAtIndex:k withObject:card];
    }
    
    //The second half of the deck will be assigned to even-indexed positions
    for(int j = midpoint,k=1; j < [cards count]-1; j++,k+=2){
        Card* card = [cards objectAtIndex:j];
        [shuffledCards replaceObjectAtIndex:k withObject:card];
    }
    
    return [NSArray arrayWithArray:shuffledCards];
}


+(NSArray<Card*>*)performEfficentInsertionShuffle:(NSArray<Card*>*)cards{
    
    
    //Initialize an empty card array with the same capacity as the card array to be shuffled
    NSMutableArray<Card*>* shuffledCards = [NSMutableArray arrayWithArray:cards];
    
    for(int k = cards.count; k > 0; k--){
        
        int randomInt = (int)arc4random_uniform((uint32_t)k);
        Card* randomCard = [shuffledCards objectAtIndex:randomInt];
        Card* topCard = [shuffledCards objectAtIndex:k-1];
        [shuffledCards replaceObjectAtIndex:randomInt withObject:topCard];
        [shuffledCards replaceObjectAtIndex:k-1 withObject:randomCard];
        
    }
    
    
    return [NSArray arrayWithArray:shuffledCards];
}


@end
