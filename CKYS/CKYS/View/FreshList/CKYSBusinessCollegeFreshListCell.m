//
//  CKYSBusinessCollegeFreshListCell.m
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeFreshListCell.h"
#import "Masonry.h"
#import "Common.h"

#import "CKYSBusinessCollegeFreshListCellDelegate.h"
#import "CKYSBusinessCollegeFreshListItemCell.h"

@interface CKYSBusinessCollegeFreshListCell ()

<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *businessCollegeFreshListItemView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) id<CKYSBusinessCollegeFreshListCellDelegate> delegate;

@end

@implementation CKYSBusinessCollegeFreshListCell

- (void)setDelegate:(id<CKYSBusinessCollegeFreshListCellDelegate>)dalegate {
    _delegate = dalegate;
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
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initItemView];
    }
    return self;
}

- (void)initTitleAndMore {//height 47
    UILabel *labelTitle = [[UILabel alloc] init];
    labelTitle.textColor = [UIColor blackColor];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:labelTitle];
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.centerX.equalTo(self.contentView);
    }];
    
    UIButton *buttonMore = [[UIButton alloc] init];
    buttonMore.titleLabel.text = @"更多>";
    buttonMore.titleLabel.textColor = [UIColor colorWithRed:135.999/255.0 green:135.999/255.0 blue:135.999/255.0 alpha:1];
    buttonMore.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:buttonMore];
    [buttonMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(labelTitle);
        make.right.equalTo(self.contentView.mas_right).with.offset(-11);
        make.width.equalTo(@33);
    }];
    [buttonMore addTarget:self action:@selector(buttonMoreAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonMoreAction:(UIButton *)sender {
    
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
        make.top.equalTo(self.contentView.mas_top).with.offset(47);
        make.left.right.bottom.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView);
        make.height.equalTo(@(AdaptedHeight(274)));
        make.width.equalTo(@(SCREEN_WIDTH));
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
    
    CKYSBusinessCollegeFreshListItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CKYSBusinessCollegeFreshListItemCell" forIndexPath:indexPath];
//    [cell setItem:self.dataArray[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
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

- (void)responseDelegateWithAtIndexPath:(NSIndexPath *)indexPath {
    if (_delegate && [_delegate respondsToSelector:@selector(businessCollegeFreshListCellDelegateCell:indexpath:)]) {
            [_delegate businessCollegeFreshListCellDelegateCell:self indexpath:indexPath];
    }
}

@end
