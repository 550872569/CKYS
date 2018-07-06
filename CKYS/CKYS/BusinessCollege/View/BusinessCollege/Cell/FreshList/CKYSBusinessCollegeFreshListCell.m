//
//  CKYSBusinessCollegeFreshListCell.m
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeFreshListCell.h"
#import "Masonry.h"
#import "Common.h"

#import "CKYSBusinessCollegeFreshListCellDelegate.h"
#import "CKYSBusinessCollegeFreshListItemCell.h"
#import "CKYSBusinessCollegeFreshListItem.h"

#import "UILabel+Category.h"
#import "UIButton+Title_Image.h"
#import "UIButton+ImageTitleSpacing.h"

#import "CKYSBusinessCollegeTitleMoreButtonView.h"

#import "CKYSBusinessCollegeTopnewsItem.h"

@interface CKYSBusinessCollegeFreshListCell ()

<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
CKYSBusinessCollegeTitleMoreButtonViewDelegate>

@property (nonatomic, strong) UICollectionView *businessCollegeFreshListItemView;

@property (nonatomic, strong) NSMutableArray <CKYSBusinessCollegeTopnewsItem *>*dataArray;

@property (nonatomic, weak) id<CKYSBusinessCollegeFreshListCellDelegate> delegate;

@property (nonatomic, strong) CKYSBusinessCollegeTitleMoreButtonView *titleMoreButtonView;

@end

@implementation CKYSBusinessCollegeFreshListCell

- (void)setDelegate:(id<CKYSBusinessCollegeFreshListCellDelegate>)delegate {
    _delegate = delegate;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"CKYSBusinessCollegeFreshListCellID";
    CKYSBusinessCollegeFreshListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CKYSBusinessCollegeFreshListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self initData];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initTitleAndMore];
        [self initItemView];
    }
    return self;
}

- (void)initData {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:[CKYSBusinessCollegeFreshListModel businessCollegeFreshListItemList]];
    }
}

- (void)initTitleAndMore {//height 47
    _titleMoreButtonView = [[CKYSBusinessCollegeTitleMoreButtonView alloc] initWithDelegate:self];
    [self.contentView addSubview:_titleMoreButtonView];
    [_titleMoreButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.centerX.equalTo(self.contentView);
        make.height.equalTo(@(AdaptedHeight(CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT)));
    }];
    [_titleMoreButtonView setTitle:@"新鲜出炉"];
    [_titleMoreButtonView setButtonMoreHidden:false];
}
- (void)initItemView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    _businessCollegeFreshListItemView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _businessCollegeFreshListItemView.backgroundColor = [UIColor whiteColor];
    [_businessCollegeFreshListItemView registerClass:[CKYSBusinessCollegeFreshListItemCell class] forCellWithReuseIdentifier:@"CKYSBusinessCollegeFreshListItemCell"];
    _businessCollegeFreshListItemView.delegate = self;
    _businessCollegeFreshListItemView.dataSource = self;
    _businessCollegeFreshListItemView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_businessCollegeFreshListItemView];
    [_businessCollegeFreshListItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(AdaptedHeight(CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT));
        make.left.right.bottom.mas_equalTo(self.contentView);
        make.height.equalTo(@(AdaptedHeight(CKYS_BCFL_ITEM_CELL_HEIGHT+CKYS_BCFL_ITEM_CELL_MARGIN_BOTTOM)));
        make.width.equalTo(@(SCREEN_WIDTH));
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataArray.count == 0) {
        return 1;
    } else {
        return self.dataArray.count>8? 8 : self.dataArray.count;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CKYSBusinessCollegeFreshListItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CKYSBusinessCollegeFreshListItemCell" forIndexPath:indexPath];
//    [cell setItem:self.dataArray[indexPath.row]];
    if (_dataArray.count && _dataArray.count>indexPath.row) {
        [cell setTopnewsItem:self.dataArray[indexPath.row]];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

#pragma mark - UICollectionViewDelegateFlowLayout

/**设置每个item的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(AdaptedHeight(CKYS_BCFL_ITEM_CELL_WIDTH),AdaptedHeight(CKYS_BCFL_ITEM_CELL_HEIGHT));
}

/**设置每个item的UIEdgeInsets*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, AdaptedHeight(CKYS_BCFL_ITEM_CELL_MARGIN_LEFT), AdaptedHeight(CKYS_BCFL_ITEM_CELL_MARGIN_BOTTOM), 0);
}

/* SpacingForSection */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return AdaptedHeight(CKYS_BCFL_ITEM_CELL_MARGIN_CLUME);
}
/* LineSpacing */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return AdaptedHeight(CKYS_BCFL_ITEM_CELL_MARGIN_ROW);
}
#pragma mark- UICollectionViewDelegate 点击跳转到对应页面

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self responseDelegateWithAtIndexPath:indexPath];
}

- (void)responseDelegateWithAtIndexPath:(NSIndexPath *)indexPath {
    if (_delegate && [_delegate respondsToSelector:@selector(businessCollegeFreshListCellDelegateCell:indexpath:)]) {
            [_delegate businessCollegeFreshListCellDelegateCell:self indexpath:indexPath];
    }
}

#pragma mark - CKYSBusinessCollegeTitleMoreButtonViewDelegate
- (void)CKYSBusinessCollegeTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTitleMoreButtonView *)view moreAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:moreAction:)]) {
        [_delegate CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:CKYSBusinessCollegeTableViewCellTypeFreshList moreAction:sender];
    }
}

- (void)setTopNews:(NSArray <CKYSBusinessCollegeTopnewsItem *>*)topNews {
    _dataArray = [NSMutableArray arrayWithCapacity:8];
    [topNews enumerateObjectsUsingBlock:^(CKYSBusinessCollegeTopnewsItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_dataArray addObject:obj];
    }];
    [_businessCollegeFreshListItemView reloadData];
}

@end
