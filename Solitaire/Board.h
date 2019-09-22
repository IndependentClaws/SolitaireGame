//
//  Board.h
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Board : NSObject <UICollectionViewDataSource,UICollectionViewDelegate>

-(id)init;

@end

NS_ASSUME_NONNULL_END
