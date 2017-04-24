//
//  LDPlazaCollectionCell.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDPlazaCollectionCell.h"
#import "LDPlazaItemModel.h"

@interface LDPlazaCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *title_Label;

@end

@implementation LDPlazaCollectionCell

- (void)setModel:(LDPlazaItemModel *)model {
    _model = model;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl]];
    
    self.title_Label.text = [NSString stringWithFormat:@"%zd", self.indexPath.item];
}

@end
