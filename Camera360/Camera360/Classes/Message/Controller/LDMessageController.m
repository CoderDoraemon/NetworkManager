//
//  LDMessageController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDMessageController.h"

@interface LDMessageController ()

@end

@implementation LDMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setup];
}


- (void)setup {
    [self setNavgation];
    
    
//    CAEmitterLayer *emitterLayer = [[CAEmitterLayer alloc] init];
//    
//    emitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, 150);
//    
//    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
//    
//    emitterCell.birthRate = 10;
//    
//    emitterCell.lifetime = 5;
//    emitterCell.lifetimeRange = 2;
//    
//    emitterCell.scale = 0.7;
//    emitterCell.scaleRange = 0.2;
//    
//    emitterCell.emissionLongitude = M_PI_2;
//    emitterCell.emissionRange = M_PI_2 / 3;
//    
//    emitterCell.velocity = 100;
//    emitterCell.velocityRange = 50;
//    
//    emitterCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hart"].CGImage);
//    
//    emitterLayer.emitterCells = @[emitterCell];
//    
//    [self.view.layer addSublayer:emitterLayer];
    
    [self addEmitterLayerOfPosition:CGPointMake(self.view.bounds.size.width * 0.2, -20)];
    
    [self addEmitterLayerOfPosition:CGPointMake(self.view.bounds.size.width * 0.4, -20)];
    
    [self addEmitterLayerOfPosition:CGPointMake(self.view.bounds.size.width * 0.6, -20)];
    
    [self addEmitterLayerOfPosition:CGPointMake(self.view.bounds.size.width * 0.8, -20)];
    
}

- (void)addEmitterLayerOfPosition:(CGPoint)position {
    
    // 创建粒子发射器
    CAEmitterLayer *emitterLayer = [[CAEmitterLayer alloc] init];
    // 设置发射器位置
    emitterLayer.emitterPosition = position;
    
    // 创建lizi
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    // 1s发射多少个lizi
    emitterCell.birthRate = 10;
    
    // 粒子生存时间
    emitterCell.lifetime = 5;
//    emitterCell.lifetimeRange = 2;
    
    // 缩放大小
    emitterCell.scale = 0.7;
    emitterCell.scaleRange = 0.2;
    
    // 方向
    emitterCell.emissionLongitude = M_PI_2;
    emitterCell.emissionRange = M_PI_2 / 3;
    
    // 速度
    emitterCell.velocity = 100;
    emitterCell.velocityRange = 50;
    
    // 旋转
    emitterCell.spin = 1.0;
    emitterCell.spinRange = 0.3;
    
    // 粒子图片
    emitterCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"flow"].CGImage);
    
    emitterLayer.emitterCells = @[emitterCell];
    
    [self.view.layer addSublayer:emitterLayer];
    
}

- (void)setNavgation {
    self.navigationItem.title = @"消息";
}

@end
