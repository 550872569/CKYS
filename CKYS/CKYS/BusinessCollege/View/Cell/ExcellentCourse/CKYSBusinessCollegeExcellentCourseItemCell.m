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

#import "CKYSBusinessCollegeExcellentCourseItem.h"

CGFloat CKYS_BCEC_ITEM_CELL_HEIGHT = 115;

CGFloat CKYS_BCEC_ITEM_CELL_MARGIN = 2;

CGFloat CKYS_BCEC_ITEM_CELL_BOTTOM_OFFSET = 15;

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

- (void)initUI{
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(CKYS_BCEC_ITEM_CELL_WIDTH);
        make.height.mas_offset(CKYS_BCEC_ITEM_CELL_HEIGHT);
        make.top.bottom.left.right.centerX.centerY.equalTo(self.contentView);
    }];
    
    _labelTitle = [UILabel labelWithTitle:@"" titleFont:18 backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:CGRectZero numberOfLines:1 textColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
    [self.contentView addSubview:_labelTitle];
    
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(CKYS_BCEC_ITEM_CELL_WIDTH);
        make.centerX.mas_equalTo(_imageView);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-16);
    }];
}

- (void)setItem:(CKYSBusinessCollegeExcellentCourseItem *)item {
    [_labelTitle setText:[NSString stringWithFormat:@"%@",item.title]];
    [_imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",item.image]]];
}

@end
