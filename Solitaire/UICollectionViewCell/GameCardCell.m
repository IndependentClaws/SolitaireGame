//
//  GameCardCell.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/23/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "GameCardCell.h"
#import "CardViewModel.h"

@interface GameCardCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation GameCardCell


-(void)configureWith:(CardViewModel*)viewModel{
    UIImage* cardImage = [viewModel cardImage];
    
    self.imageView.image = cardImage;
}

+(NSString*)identifier{
    return @"GameCardCell";
}

@end
