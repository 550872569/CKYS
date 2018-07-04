//
//  CKYSBusinessCollegeExcellentCourseCell.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeExcellentCourseCell.h"

#import "Masonry.h"
#import "Common.h"

#import "CKYSBusinessCollegeExcellentCourseCellDelegate.h"
#import "CKYSBusinessCollegeExcellentCourseItemCell.h"

#import "UILabel+Category.h"
#import "UIButton+Title_Image.h"
#import "UIButton+ImageTitleSpacing.h"

#import "CKYSBusinessCollegeTitleMoreButtonView.h"
#import "CKYSBusinessCollegeExcellentCourseItem.h"

#import "UIView+Category.h"
#import "CKYSBusinessCollegeTableViewCellConst.h"

@interface CKYSBusinessCollegeExcellentCourseCell ()

<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
CKYSBusinessCollegeTitleMoreButtonViewDelegate>

@property (nonatomic, strong) UICollectionView *businessCollegeExcellentCourseItemView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) id<CKYSBusinessCollegeExcellentCourseCellDelegate> delegate;

@property (nonatomic, strong) CKYSBusinessCollegeTitleMoreButtonView *titleMoreButtonView;

@end

@implementation CKYSBusinessCollegeExcellentCourseCell

- (void)setDelegate:(id<CKYSBusinessCollegeExcellentCourseCellDelegate>)delegate {
    _delegate = delegate;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"CKYSBusinessCollegeExcellentCourseCellID";
    CKYSBusinessCollegeExcellentCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CKYSBusinessCollegeExcellentCourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
        [_dataArray addObjectsFromArray:[CKYSBusinessCollegeExcellentCourseModel businessCollegeExcellentCourseItemList]];
    }
}
- (void)initTitleAndMore {//height 47
    _titleMoreButtonView = [[CKYSBusinessCollegeTitleMoreButtonView alloc] initWithDelegate:self];
    [self.contentView addSubview:_titleMoreButtonView];
    [_titleMoreButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.centerX.equalTo(self.contentView);
        make.height.equalTo(@(CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT));
    }];
    [_titleMoreButtonView setTitle:@"精品课程"];
}

- (void)initItemView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    _businessCollegeExcellentCourseItemView.showsHorizontalScrollIndicator = NO;
    _businessCollegeExcellentCourseItemView.showsVerticalScrollIndicator = NO;
    _businessCollegeExcellentCourseItemView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _businessCollegeExcellentCourseItemView.backgroundColor = [UIColor whiteColor];
    [_businessCollegeExcellentCourseItemView registerClass:[CKYSBusinessCollegeExcellentCourseItemCell class] forCellWithReuseIdentifier:@"CKYSBusinessCollegeExcellentCourseItemCell"];
    _businessCollegeExcellentCourseItemView.delegate = self;
    _businessCollegeExcellentCourseItemView.dataSource = self;
    _businessCollegeExcellentCourseItemView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_businessCollegeExcellentCourseItemView];
    
    [_businessCollegeExcellentCourseItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleMoreButtonView.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.equalTo(@(CKYS_BCEC_ITEM_CELL_HEIGHT*4+CKYS_BCEC_ITEM_CELL_MARGIN*3));
        make.width.equalTo(@(SCREEN_WIDTH));
//        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-CKYS_BCEC_ITEM_CELL_BOTTOM_OFFSET);
    }];
    
    UIView *view = [UIView instanceWithRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CKYS_BC_TABLE_CELL_BOTTOM_HEIGHT) backgroundColor:CKYS_BC_TABLE_CELL_BOTTOM_COLOR_BG parentView:self.contentView];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_businessCollegeExcellentCourseItemView.mas_bottom).with.offset(CKYS_BCEC_ITEM_CELL_BOTTOM_OFFSET);
        make.height.equalTo(@(CKYS_BC_TABLE_CELL_BOTTOM_HEIGHT));
        make.left.right.bottom.equalTo(self.contentView);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataArray.count == 0) {
        return 1;
    } else {
        return 8;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CKYSBusinessCollegeExcellentCourseItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CKYSBusinessCollegeExcellentCourseItemCell" forIndexPath:indexPath];
    [cell setItem:_dataArray[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

#pragma mark - UICollectionViewDelegateFlowLayout

/**设置每个item的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CKYS_BCEC_ITEM_CELL_WIDTH,CKYS_BCEC_ITEM_CELL_HEIGHT);
}

/* 设置每个item的UIEdgeInsets */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 2, 0, 0);
}
/* SpacingForSection */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}
/* LineSpacing */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

#pragma mark- UICollectionViewDelegate 点击跳转到对应页面

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self responseDelegateWithAtIndexPath:indexPath];
}

- (void)responseDelegateWithAtIndexPath:(NSIndexPath *)indexPath {
    if (_delegate && [_delegate respondsToSelector:@selector(businessCollegeExcellentCourseCellDelegateCell:indexpath:)]) {
        [_delegate businessCollegeExcellentCourseCellDelegateCell:self indexpath:indexPath];
    }
}

#pragma mark - CKYSBusinessCollegeTitleMoreButtonViewDelegate
- (void)CKYSBusinessCollegeTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTitleMoreButtonView *)view moreAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:moreAction:)]) {
        [_delegate CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:CKYSBusinessCollegeTableViewCellTypeExcellentCourse moreAction:sender];
    }
}

@end
