//
//  LDAdModel.h
//  Camera360
//
//  Created by 文刂Rn on 2017/3/8.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDAdModel : NSObject

/** 启动图地址 */
@property (nonatomic, copy) NSString *launchUrl;

/** 广告链接 */
@property (nonatomic, copy) NSString *adDetailUrl;

/** image */
@property (nonatomic, strong) UIImage *image;

@end
