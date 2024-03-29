//
//  Deck.h
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

-(id)init;
-(id)initWithRanks:(NSArray<NSString*>*)ranks andWithSuits: (NSArray<NSString*>*)suits andWithPointValues: (NSArray<NSNumber *>*)pointValues;


-(Card*)deal;
-(void)shuffle;

-(unsigned long)size;
-(BOOL)isEmpty;


+(NSArray<Card*>*)performPerfectShuffle:(NSArray<Card*>*)cards;
+(NSArray<Card*>*)performEfficentInsertionShuffle:(NSArray<Card*>*)cards;

@end

NS_ASSUME_NONNULL_END
