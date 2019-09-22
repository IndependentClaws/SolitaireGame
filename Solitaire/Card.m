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

-(BOOL)isEqual:(Card*)otherCard{
    
    return otherCard.rank == _rank && otherCard.suit == _suit && otherCard.pointValue.integerValue == _pointValue.integerValue;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"%@ of %@ (point value = %d)",self.rank,self.suit,(int)self.pointValue.integerValue];
}





@end
