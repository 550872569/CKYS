//
//  CKYSBusinessCollegeFamousTeacherCell.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeFamousTeacherCell.h"

#import "Masonry.h"
#import "Common.h"

#import "CKYSBusinessCollegeFamousTeacherItemCell.h"
#import "CKYSBusinessCollegeFamousTeacherCellDelegate.h"

#import "UILabel+Category.h"
#import "UIButton+Title_Image.h"
#import "UIButton+ImageTitleSpacing.h"

#import "CKYSBusinessCollegeTitleMoreButtonView.h"
#import "CKYSBusinessCollegeFamousTeacherItem.h"

@interface CKYSBusinessCollegeFamousTeacherCell ()

<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
CKYSBusinessCollegeTitleMoreButtonViewDelegate>

@property (nonatomic, strong) UICollectionView *businessCollegeFamousTeacherItemView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) id<CKYSBusinessCollegeFamousTeacherCellDelegate> delegate;

@property (nonatomic, strong) CKYSBusinessCollegeTitleMoreButtonView *titleMoreButtonView;

@end

@implementation CKYSBusinessCollegeFamousTeacherCell

#define CKYS_BCFT_CELL_HEIGHT 219

- (void)setDelegate:(id<CKYSBusinessCollegeFamousTeacherCellDelegate>)delegate {
    _delegate = delegate;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"CKYSBusinessCollegeFamousTeacherCellID";
    CKYSBusinessCollegeFamousTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CKYSBusinessCollegeFamousTeacherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadData];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initTitleAndMore];
        [self initItemView];
    }
    return self;
}

- (void)loadData {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:8];
        [_dataArray addObjectsFromArray:[CKYSBusinessCollegeFamousTeacherModel businessCollegeFamousTeacherItemList]];
    }
}
- (void)initTitleAndMore {//height 47
    _titleMoreButtonView = [[CKYSBusinessCollegeTitleMoreButtonView alloc] initWithDelegate:self];
    [self.contentView addSubview:_titleMoreButtonView];
    [_titleMoreButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.centerX.equalTo(self.contentView);
        make.height.equalTo(@(AdaptedHeight(CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT)));
    }];
    [_titleMoreButtonView setTitle:@"名师推荐"];
}

- (void)initItemView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    _businessCollegeFamousTeacherItemView.showsHorizontalScrollIndicator = NO;
    _businessCollegeFamousTeacherItemView.showsVerticalScrollIndicator = NO;
    _businessCollegeFamousTeacherItemView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _businessCollegeFamousTeacherItemView.backgroundColor = [UIColor whiteColor];
    [_businessCollegeFamousTeacherItemView registerClass:[CKYSBusinessCollegeFamousTeacherItemCell class] forCellWithReuseIdentifier:@"CKYSBusinessCollegeFamousTeacherItemCell"];
    _businessCollegeFamousTeacherItemView.delegate = self;
    _businessCollegeFamousTeacherItemView.dataSource = self;
    _businessCollegeFamousTeacherItemView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_businessCollegeFamousTeacherItemView];
    
    [_businessCollegeFamousTeacherItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleMoreButtonView.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.equalTo(@(AdaptedHeight(CKYS_BCFT_ITEM_CELL_BOTTOM_OFFSET+CKYS_BCFT_ITEM_CELL_HEIGHT)));
        make.width.equalTo(@(SCREEN_WIDTH));
        make.bottom.equalTo(self.contentView.mas_bottom);
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
    
    CKYSBusinessCollegeFamousTeacherItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CKYSBusinessCollegeFamousTeacherItemCell" forIndexPath:indexPath];
    [cell setItem:_dataArray[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

#pragma mark - UICollectionViewDelegateFlowLayout

/**设置每个item的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(AdaptedWidth(CKYS_BCFT_ITEM_CELL_WIDTH),AdaptedHeight(CKYS_BCFT_ITEM_CELL_HEIGHT));
}

/* 设置每个item的UIEdgeInsets */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, CKYS_BCFT_ITEM_CELL_MARGIN, AdaptedHeight(CKYS_BCFT_ITEM_CELL_BOTTOM_OFFSET), 0);
}
/* SpacingForSection */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return AdaptedHeight(CKYS_BCFT_ITEM_CELL_BOTTOM_OFFSET);
}
/* LineSpacing */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CKYS_BCFT_ITEM_CELL_MARGIN;
}

#pragma mark- UICollectionViewDelegate 点击跳转到对应页面

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self responseDelegateWithAtIndexPath:indexPath];
}

- (void)responseDelegateWithAtIndexPath:(NSIndexPath *)indexPath {
    if (_delegate && [_delegate respondsToSelector:@selector(businessCollegeFamousTeacherCellDelegateCell:indexpath:)]) {
        [_delegate businessCollegeFamousTeacherCellDelegateCell:self indexpath:indexPath];
    }
}

#pragma mark - CKYSBusinessCollegeTitleMoreButtonViewDelegate
- (void)CKYSBusinessCollegeTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTitleMoreButtonView *)view moreAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:moreAction:)]) {
        [_delegate CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:CKYSBusinessCollegeTableViewCellTypefFamousTeachers moreAction:sender];
    }
}

@end
