//
//  LDTestTableViewController.h
//  Camera360
//
//  Created by 文刂Rn on 2017/3/8.
//  Copyright © 2017年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDTestTableViewController : UITableViewController

@property (nonatomic ,assign) NSInteger itemNum;
@property (nonatomic ,assign) NSInteger page;
@property (nonatomic, assign) BOOL isNeedRefresh;

@end
