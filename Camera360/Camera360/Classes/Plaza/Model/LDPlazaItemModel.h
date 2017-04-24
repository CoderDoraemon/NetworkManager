//
//  ZPHPlazaItemModel.h
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 ZPH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDPlazaItemModel : NSObject

/** height */
@property (nonatomic, assign) CGFloat height;

/** width */
@property (nonatomic, assign) CGFloat width;

/** price */
@property (nonatomic, strong) NSString *price;

/** imgurl */
@property (nonatomic, strong) NSString *imgurl;

@end
