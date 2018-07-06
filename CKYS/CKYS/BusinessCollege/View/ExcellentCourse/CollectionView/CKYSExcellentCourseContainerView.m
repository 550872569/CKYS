//
//  CKYSExcellentCourseContainerView.m
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSExcellentCourseContainerView.h"
#import "CKYSScreenConst.h"
#import "CKYSExcellentCourseSelectedTypeCollectionCell.h"
#import "Common.h"
#import "CKYSExcellentCourseSelectedTypeItem.h"
#import "Masonry.h"

@interface CKYSExcellentCourseContainerView ()

<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray <CKYSExcellentCourseSelectedTypeItem *>*dataArray;

@end

@implementation CKYSExcellentCourseContainerView {
    UICollectionView *_selectedTypeView;
}

#define CKYS_BC_EC_SELECTED_TYPE_CELL_MARGIN    11

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _dataArray = [NSArray arrayWithArray:[CKYSExcellentCourseSelectedTypeModel excellentCourseSelectedTypeItemList]];

        [self initSelectedTypeView];
    }
    return self;
}

- (void)initSelectedTypeView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    _selectedTypeView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CKYS_EC_CONTAINER_HEIGHT) collectionViewLayout:flowLayout];
    _selectedTypeView.backgroundColor = [UIColor whiteColor];
    [_selectedTypeView registerClass:[CKYSExcellentCourseSelectedTypeCollectionCell class] forCellWithReuseIdentifier:@"CKYSExcellentCourseSelectedTypeCollectionCell"];
    _selectedTypeView.delegate = self;
    _selectedTypeView.dataSource = self;
    _selectedTypeView.backgroundColor = [UIColor yellowColor];
    _selectedTypeView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_selectedTypeView];
    [_selectedTypeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
        make.height.equalTo(@CKYS_EC_CONTAINER_HEIGHT);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_dataArray.count == 0) {
        return 1;
    } else {
        return _dataArray.count;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CKYSExcellentCourseSelectedTypeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CKYSExcellentCourseSelectedTypeCollectionCell" forIndexPath:indexPath];
    if (_dataArray.count && _dataArray.count>indexPath.row) {
        [cell setSelectedTypeItem:self.dataArray[indexPath.row]];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

#pragma mark - UICollectionViewDelegateFlowLayout

/**设置每个item的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CKYS_EC_SELECTED_TYPE_CELL_WIDTH, CKYS_EC_SELECTED_TYPE_CELL_HEIGHT);
}

/**设置每个item的UIEdgeInsets*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(CKYS_BC_EC_SELECTED_TYPE_CELL_MARGIN, CKYS_BC_EC_SELECTED_TYPE_CELL_MARGIN, CKYS_BC_EC_SELECTED_TYPE_CELL_MARGIN, CKYS_BC_EC_SELECTED_TYPE_CELL_MARGIN);
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

/* SpacingForSection */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return AdaptedHeight(CKYS_BC_EC_SELECTED_TYPE_CELL_MARGIN);
}
/* LineSpacing */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CKYS_BC_EC_SELECTED_TYPE_CELL_MARGIN;
}
#pragma mark- UICollectionViewDelegate 点击跳转到对应页面

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index%ld",indexPath.row);
    //    [self responseDelegateWithAtIndexPath:indexPath];
}

@end
