//
//  CKYSBusinessCollegeFamousTeacherItemCell.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeFamousTeacherItemCell.h"

#import "Common.h"
#import "Masonry.h"

#import "UILabel+Category.h"
#import "CKYSBusinessCollegeHonorListItem.h"

#import "CKYSBusinessCollegeFamousTeacherItem.h"
#import "CKYSBusinessCollegeHonorListItem.h"
#import <SDWebImage/UIImageView+WebCache.h>

CGFloat CKYS_BCFT_ITEM_CELL_MARGIN = 10;

CGFloat CKYS_BCFT_ITEM_CELL_BOTTOM_OFFSET = 18;

#define  CKYS_BCFT_ITEM_CELL_IMAGE_WIDTH    66
#define  CKYS_BCFT_ITEM_CELL_IMAGE_HEIGHT   66

@interface CKYSBusinessCollegeFamousTeacherItemCell ()

@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic, strong) UILabel *labelTitle;

@property(nonatomic, strong) UILabel *labelSubTitle;

@end

@implementation CKYSBusinessCollegeFamousTeacherItemCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
#define CKYS_BC_FT_ITEM_CELL_SHADDOW_OFFSET 2
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIView *viewBg = [[UIView alloc] init];
    [self.contentView addSubview:viewBg];
    viewBg.backgroundColor = [UIColor whiteColor];
    viewBg.layer.shadowColor = [UIColor colorWithRed:127.5/255.0 green:127.5/255.0 blue:127.5/255.0 alpha:1].CGColor;
    viewBg.layer.borderColor = viewBg.layer.shadowColor;
    viewBg.layer.borderWidth = 0.000001;
    viewBg.layer.cornerRadius = CKYS_BC_FT_ITEM_CELL_SHADDOW_OFFSET;
    viewBg.layer.shadowOpacity = 1;
    viewBg.layer.shadowRadius = CKYS_BC_FT_ITEM_CELL_SHADDOW_OFFSET;
    viewBg.layer.shadowOffset = CGSizeZero;
    
    [viewBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).with.offset(CKYS_BC_FT_ITEM_CELL_SHADDOW_OFFSET);
    }];
    
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
    _imageView.backgroundColor = [UIColor grayColor];
    _imageView.layer.cornerRadius = AdaptedHeight(CKYS_BCFT_ITEM_CELL_IMAGE_WIDTH)*0.5;
    _imageView.layer.masksToBounds = YES;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(AdaptedHeight(CKYS_BCFT_ITEM_CELL_IMAGE_WIDTH));
        make.height.mas_offset(AdaptedHeight(CKYS_BCFT_ITEM_CELL_IMAGE_HEIGHT));
        make.top.equalTo(self.contentView.mas_top).with.offset(AdaptedHeight(17));
        make.centerX.equalTo(self.contentView);
    }];
    
    
    _labelTitle = [UILabel labelWithTitle:@"" titleFont:16 backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:CGRectZero numberOfLines:1 textColor:[UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1]];
    [self.contentView addSubview:_labelTitle];
    
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(AdaptedWidth(99));
        make.centerX.mas_equalTo(_imageView);
        make.top.equalTo(_imageView.mas_bottom).with.offset(AdaptedHeight(14));
    }];
    
    _labelSubTitle = [UILabel labelWithTitle:@"" titleFont:13 backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:CGRectZero numberOfLines:1 textColor:[UIColor colorWithRed:101.997/255.0 green:101.997/255.0 blue:101.997/255.0 alpha:1]];
    [self.contentView addSubview:_labelSubTitle];
    
    [_labelSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(AdaptedWidth(99));
        make.centerX.mas_equalTo(_imageView);
        make.top.equalTo(_labelTitle.mas_bottom).with.offset(AdaptedHeight(9));
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-AdaptedHeight(16));
    }];
}

- (void)setFamousTeacherItem:(CKYSBusinessCollegeFamousTeacherItem *)famousTeacherItem {
    [_labelTitle setText:[NSString stringWithFormat:@"%@",famousTeacherItem.title]];
    [_labelSubTitle setText:[NSString stringWithFormat:@"%@",famousTeacherItem.subTitle]];
    [_imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",famousTeacherItem.image]]];
}

- (void)setHonorListItem:(CKYSBusinessCollegeHonorListItem *)item {
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",item.path]] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@""]] options:SDWebImageQueryDiskSync completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}

@end
