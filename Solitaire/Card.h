//
//  Card.h
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong,atomic) NSString* suit;
@property (strong,atomic) NSString* rank;
@property (strong,atomic) NSNumber* pointValue;

-(id)initWithRank:(NSString*)rank andWithSuit:(NSString*)suit andWithPointValue:(NSNumber*)pointValue;

-(BOOL)isEqual:(Card*)otherCard;

@end

NS_ASSUME_NONNULL_END
