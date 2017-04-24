//
//  LDTestCollectionViewController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/8.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDTestCollectionViewController.h"
#import "TYSlidePageScrollViewController.h"

static NSString *const cellId = @"collectCellId";

@interface LDTestCollectionViewController () <UICollectionViewDataSource,TYDisplayPageScrollViewDelegate>


@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation LDTestCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addCollectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
}

- (void)addCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((CGRectGetWidth(self.view.frame)-20)/3, (CGRectGetWidth(self.view.frame)-20)/3);
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    _collectionView = collectionView;
}

#pragma mark - UIViewControllerDisplayViewDelegate

- (UIScrollView *)displayPageScrollView
{
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3*3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    return cell;
}
@end
