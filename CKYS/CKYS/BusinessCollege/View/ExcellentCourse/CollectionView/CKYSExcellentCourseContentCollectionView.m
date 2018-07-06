//
//  CKYSExcellentCourseContentCollectionView.m
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSExcellentCourseContentCollectionView.h"
#import "Common.h"
#import "CKYSExcellentCourseContentCollectionCell.h"
#import "Masonry.h"

@interface CKYSExcellentCourseContentCollectionView ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *contentsView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CKYSExcellentCourseContentCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initItemView];
    }
    return self;
}

- (void)initItemView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    _contentsView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _contentsView.backgroundColor = [UIColor whiteColor];
    [_contentsView registerClass:[CKYSExcellentCourseContentCollectionCell class] forCellWithReuseIdentifier:@"CKYSExcellentCourseContentCollectionCell"];
    _contentsView.delegate = self;
    _contentsView.dataSource = self;
    _contentsView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_contentsView];
    [_contentsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CKYSExcellentCourseContentCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CKYSExcellentCourseContentCollectionCell" forIndexPath:indexPath];
    if (_dataArray.count && _dataArray.count>indexPath.row) {
        
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

#pragma mark - UICollectionViewDelegateFlowLayout

/**设置每个item的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(AdaptedHeight(CKYS_EC_CONTENT_CELL_WIDTH),AdaptedHeight(CKYS_EC_CONTENT_CELL_HEIGHT));
}

/**设置每个item的UIEdgeInsets*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(CKYS_EC_CONTENT_CELL_MARGIN, AdaptedHeight(CKYS_EC_CONTENT_CELL_MARGIN), AdaptedHeight(CKYS_EC_CONTENT_CELL_MARGIN), CKYS_EC_CONTENT_CELL_MARGIN);
}

/* SpacingForSection */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return AdaptedHeight(0);
}
/* LineSpacing */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return AdaptedHeight(CKYS_EC_CONTENT_CELL_MARGIN);
}
#pragma mark- UICollectionViewDelegate 点击跳转到对应页面

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

@end
