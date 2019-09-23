//
//  CardViewModel.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "CardViewModel.h"
#import "Card.h"

@interface CardViewModel ()

@property (strong,atomic)Card* card;

@end

@implementation CardViewModel

-(id)initWith:(Card*)card{
    
    self = [super init];
    
    if(self){
        _card = card;
    }
    
    
    return self;
}

-(UIImage *)cardImage{
    return [UIImage imageNamed:[self getImageName]];
}

-(NSString*)getImageName{
    
    NSString* imageName = @"card";
    
    imageName = [imageName stringByAppendingString:[_card suit]];
    imageName = [imageName stringByAppendingString:[_card rank]];

    return imageName;
}

@end
