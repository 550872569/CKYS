//
//  CKYSBusinessCollegeBannerCell.m
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeBannerCell.h"
#import "SDCycleScrollView.h"
#import "Common.h"
#import "Masonry.h"

#import "CKYSBusinessCollegeBannerCellDelegate.h"
#import "CKYSBusinessCollegeBannerItem.h"

@interface CKYSBusinessCollegeBannerCell () <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *bannerView;

@property (nonatomic, strong) NSMutableArray <NSString *>*dataArray;

@property (nonatomic, weak) id<CKYSBusinessCollegeBannerCellDelegate> delegate;

@end

@implementation CKYSBusinessCollegeBannerCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"CKYSBusinessCollegeBannerCellID";
    CKYSBusinessCollegeBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CKYSBusinessCollegeBannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initBannerView];
    }
    return self;
}

#define CKYS_BC_BANNER_HEIGHT 190
- (void)initBannerView {
    _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, AdaptedHeight(CKYS_BC_BANNER_HEIGHT)) delegate:self placeholderImage:[UIImage imageNamed:@"ckys_businessCollega_banner_placeholder"]];
    _bannerView.backgroundColor = [UIColor whiteColor];
    _bannerView.currentPageDotColor = [UIColor redColor];
    _bannerView.pageDotColor = [UIColor lightGrayColor];
    _bannerView.imageURLStringsGroup = _dataArray;
    _bannerView.currentPageDotColor = [UIColor whiteColor];
    _bannerView.pageDotColor = [UIColor colorWithRed:197/255.0 green:197/255.0 blue:206/255.0 alpha:1];
    _bannerView.pageControlDotSize = CGSizeMake(AdaptedHeight(8), AdaptedHeight(8));
    _bannerView.localizationImageNamesGroup = @[@"ckys_businessCollega_banner_placeholder",@"ckys_businessCollega_banner_placeholder",@"ckys_businessCollega_banner_placeholder",@"ckys_businessCollega_banner_placeholder",];
    [self.contentView addSubview:_bannerView];
    [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(@(AdaptedHeight(CKYS_BC_BANNER_HEIGHT)));
    }];
}

- (void)setDelegate:(id<CKYSBusinessCollegeBannerCellDelegate>)delegate {
    _delegate = delegate;
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    CKYSBusinessCollegeBannerCellActionType type = CKYSBusinessCollegeBannerCellActionType_Index_0;
    switch (index) {
        case CKYSBusinessCollegeBannerCellActionType_Index_0:
            type = CKYSBusinessCollegeBannerCellActionType_Index_0;
            break;
        case CKYSBusinessCollegeBannerCellActionType_Index_1:
            type = CKYSBusinessCollegeBannerCellActionType_Index_1;
            break;
        case CKYSBusinessCollegeBannerCellActionType_Index_2:
            type = CKYSBusinessCollegeBannerCellActionType_Index_2;
            break;
        case CKYSBusinessCollegeBannerCellActionType_Index_3:
            type = CKYSBusinessCollegeBannerCellActionType_Index_3;
            break;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(businessCollegeBannerCell:actionType:)]) {
        [_delegate businessCollegeBannerCell:self actionType:type];
    }
}

- (void)setBannerItems:(NSArray <CKYSBusinessCollegeBannerItem *> *)bannerItems {
    _dataArray = [NSMutableArray arrayWithCapacity:bannerItems.count];
#warning todo...
    [bannerItems enumerateObjectsUsingBlock:^(CKYSBusinessCollegeBannerItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_dataArray addObject:obj.path];
        [_dataArray addObject:obj.path];
        [_dataArray addObject:obj.path];
        [_dataArray addObject:obj.path];
    }];
    _bannerView.imageURLStringsGroup = _dataArray;
    [_bannerView setNeedsDisplay];
}

- (void)setCacheBannerItems:(NSArray <NSString *>*)cacheBannerItems {
    [_bannerView setLocalizationImageNamesGroup:cacheBannerItems];
}

@end
