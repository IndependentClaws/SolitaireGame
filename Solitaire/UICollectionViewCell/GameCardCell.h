//
//  GameCardCell.h
//  Solitaire
//
//  Created by Alex Makedonski on 9/23/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameCardCell : UICollectionViewCell


+(NSString*)identifier;
-(void)configureWith:(CardViewModel*)viewModel;

@end

NS_ASSUME_NONNULL_END
