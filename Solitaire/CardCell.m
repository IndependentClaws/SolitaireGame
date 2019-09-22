//
//  CardCell.m
//  Solitaire
//
//  Created by Alex Makedonski on 9/21/19.
//  Copyright © 2019 Independent Claws. All rights reserved.
//

#import "CardCell.h"

@interface CardCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CardCell

+(NSString*)identifier{
    return @"CardCell";
}

@end
