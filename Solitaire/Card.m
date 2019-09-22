//
//  Card.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "Card.h"


@implementation Card


-(id)initWithRank:(NSString*)rank andWithSuit:(NSString*)suit andWithPointValue:(NSNumber*)pointValue{
    
    self = [super init];
    
    if(self){
        _rank = rank;
        _suit = suit;
        _pointValue = pointValue;
    }
    
    return self;
}


-(NSNumber*)pointValue{
    return _pointValue;
}

-(NSString*)rank{
    return _rank;
}

-(NSString*)suit{
    return _suit;
}

-(BOOL)isEqual:(Card*)otherCard{
    
    return otherCard.rank == _rank && otherCard.suit == _suit && otherCard.pointValue.integerValue == _pointValue.integerValue;
}

-(BOOL)isQueen{
    return [_suit isEqualToString:@"Q"];
}

-(BOOL)isKing{
    return [_suit isEqualToString:@"K"];
}

-(BOOL)isJack{
    return [_suit isEqualToString:@"J"];
}

-(BOOL)isAce{
    return [_suit isEqualToString:@"A"];
}

-(int)rankIntegerValue{
    if([self isKing]){
        return 13;
    } else if([self isQueen]){
        return 12;
    } else if([self isJack]){
        return 11;
    } else if([self isAce]){
        return 1;
    }else {
        return [_rank integerValue];
    }
}


-(NSString*)description{
    return [NSString stringWithFormat:@"%@ of %@ (point value = %d)",self.rank,self.suit,(int)self.pointValue.integerValue];
}





@end
