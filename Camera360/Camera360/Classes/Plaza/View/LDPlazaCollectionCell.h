//
//  LDPlazaCollectionCell.h
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LDPlazaItemModel;

@interface LDPlazaCollectionCell : UICollectionViewCell

/** <#Description#> */
@property (nonatomic, strong) NSIndexPath *indexPath;

/** model */
@property (nonatomic, strong) LDPlazaItemModel *model;

@end
