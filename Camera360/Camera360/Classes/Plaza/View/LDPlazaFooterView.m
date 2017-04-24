//
//  LDPlazaFooterView.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDPlazaFooterView.h"
#import "LDPlazaCollectionCell.h"
#import "LDPlazaItemModel.h"

@interface LDPlazaFooterView () <CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource>

/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LDPlazaFooterView

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
    [self reloadCollectionView];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    [self addSubview:self.collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LDPlazaCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:LDPlazaCollectionCellIdentifier];
    
//    [self reloadCollectionView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
}

- (void)reloadCollectionView {
    
    [self.collectionView reloadData];
    
    [self layoutIfNeeded];
    
    self.h = self.collectionView.collectionViewLayout.collectionViewContentSize.height;
    
    if ([self.delegate respondsToSelector:@selector(plazaFooterViewReloadData:)]) {
        [self.delegate plazaFooterViewReloadData:self];
    }
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LDPlazaCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LDPlazaCollectionCellIdentifier forIndexPath:indexPath];
    
    cell.indexPath = indexPath;
    
    cell.model = self.dataArray[indexPath.item];
    
    return cell;
    
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LDPlazaItemModel *model = self.dataArray[indexPath.item];
    
    return CGSizeMake(model.width, model.height);
}

#pragma mark - lazy
- (UICollectionView *)collectionView {
    
    if (_collectionView == nil) {
        
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
        layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        
        _collectionView.dataSource = self;
        
        _collectionView.delegate = self;
        
        _collectionView.scrollEnabled = NO;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

@end
