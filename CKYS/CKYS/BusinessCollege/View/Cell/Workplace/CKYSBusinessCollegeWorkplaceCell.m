//
//  CKYSBusinessCollegeWorkplaceCell.m
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeWorkplaceCell.h"
#import "Masonry.h"
#import "Common.h"
#import "CKYSBusinessCollegeWorkplaceItemCell.h"
#import "CKYSBusinessCollegeWorkplaceItem.h"
#import "CKYSBusinessCollegeWorkplaceCellDelegate.h"
#import "CKYSBusinessCollegeTableViewCellConst.h"

#import "UIView+Category.h"
#import "CKYSBusinessCollegeTableViewCellConst.h"

@interface CKYSBusinessCollegeWorkplaceCell ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *businessCollegeWorkplaceItemView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) id<CKYSBusinessCollegeWorkplaceCellDelegate> delegate;


@end

@implementation CKYSBusinessCollegeWorkplaceCell

- (void)setDelegate:(id<CKYSBusinessCollegeWorkplaceCellDelegate>)delegate {
    _delegate = delegate;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"CKYSBusinessCollegeWorkplaceCellID";
    CKYSBusinessCollegeWorkplaceCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CKYSBusinessCollegeWorkplaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initData];
        [self initItemView];
    }
    return self;
}

- (void)initData {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:[CKYSBusinessCollegeWorkplaceModel businessCollegeWorkplaceItemList]];
    }
}

- (void)initItemView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    _businessCollegeWorkplaceItemView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _businessCollegeWorkplaceItemView.backgroundColor = [UIColor whiteColor];
    [_businessCollegeWorkplaceItemView registerClass:[CKYSBusinessCollegeWorkplaceItemCell class] forCellWithReuseIdentifier:@"CKYSBusinessCollegeWorkplaceItemCell"];
    _businessCollegeWorkplaceItemView.delegate = self;
    _businessCollegeWorkplaceItemView.dataSource = self;
    _businessCollegeWorkplaceItemView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_businessCollegeWorkplaceItemView];

    [_businessCollegeWorkplaceItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView);
        make.height.equalTo(@(AdaptedHeight(105)));
        make.width.equalTo(@(SCREEN_WIDTH));
    }];

    UIView *viewBottom = [UIView instanceWithRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CKYS_BC_TABLE_CELL_BOTTOM_HEIGHT) backgroundColor:CKYS_BC_TABLE_CELL_BOTTOM_COLOR_BG parentView:self.contentView];
    [viewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_businessCollegeWorkplaceItemView.mas_bottom);
        make.left.right.equalTo(_businessCollegeWorkplaceItemView);
        make.height.equalTo(@(CKYS_BC_TABLE_CELL_BOTTOM_HEIGHT));
        make.bottom.equalTo(self.contentView);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataArray.count == 0) {
        return 1;
    } else {
        return self.dataArray.count;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CKYSBusinessCollegeWorkplaceItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CKYSBusinessCollegeWorkplaceItemCell" forIndexPath:indexPath];
    [cell setItem:self.dataArray[indexPath.row]];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

#pragma mark - UICollectionViewDelegateFlowLayout

/**设置每个item的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH/3,AdaptedHeight(105));
}

/**设置每个item的UIEdgeInsets*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
/**设置每个item水平间距*/
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark- UICollectionViewDelegate 点击跳转到对应页面

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    [self responseDelegateWithAtIndexPath:indexPath];
}

//1. 小白入门 2. 精英提升 3. 社群管理
- (void)responseDelegateWithAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        CKYSBusinessCollegeWorkplaceItemCellType type = CKYSBusinessCollegeWorkplaceItemCellTypeXBRM;
        switch (indexPath.row) {
                case CKYSBusinessCollegeWorkplaceItemCellTypeXBRM:
                type = CKYSBusinessCollegeWorkplaceItemCellTypeXBRM;
                break;
                case CKYSBusinessCollegeWorkplaceItemCellTypeJYTS:
                type = CKYSBusinessCollegeWorkplaceItemCellTypeJYTS;
                break;
                case CKYSBusinessCollegeWorkplaceItemCellTypeSQGL:
                type = CKYSBusinessCollegeWorkplaceItemCellTypeSQGL;
                break;
        }
        if (_delegate && [_delegate respondsToSelector:@selector(businessCollegeWorkplaceCell:actionType:)]) {
            [_delegate businessCollegeWorkplaceCell:self actionType:type];
        }
    }
}



@end
