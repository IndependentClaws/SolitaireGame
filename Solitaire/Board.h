//
//  Board.h
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Board : NSObject <UICollectionViewDataSource,UICollectionViewDelegate>

-(id)initWithMaximumNumberOfBoardCards:(int)maxNumberOfBoardCards;
@property (readonly) int maxNumberOfBoardCards;
-(Card*)boardCardAtIndexPath:(NSIndexPath*)indexPath;

@end

NS_ASSUME_NONNULL_END
