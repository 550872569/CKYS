//
//  CKYSBusinessCollegeExcellentCourseItemCell.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeExcellentCourseItemCell.h"

#import "Common.h"
#import "Masonry.h"

#import "UILabel+Category.h"

@interface CKYSBusinessCollegeExcellentCourseItemCell ()

@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic, strong) UILabel *labelTitle;

@end

@implementation CKYSBusinessCollegeExcellentCourseItemCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

#define CKYS_BCEX_ITEM_CELL_IMAGE_WIDTH 185
#define CKYS_BCEX_ITEM_CELL_IMAGE_HEIGHT 115
#define CKYS_BCEX_ITEM_CELL_IMAGE_MARGIN 2

- (void)initUI{
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset((CKYS_BCEX_ITEM_CELL_IMAGE_WIDTH));        make.height.mas_offset((CKYS_BCEX_ITEM_CELL_IMAGE_HEIGHT));        make.top.bottom.left.right.centerX.centerY.equalTo(self.contentView);
    }];
    
    _labelTitle = [UILabel labelWithTitle:@"" titleFont:18 backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:CGRectZero numberOfLines:1 textColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
    [self.contentView addSubview:_labelTitle];
    
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(AdaptedWidth(75));
        make.centerX.mas_equalTo(_imageView);        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-16);
    }];
}

@end
