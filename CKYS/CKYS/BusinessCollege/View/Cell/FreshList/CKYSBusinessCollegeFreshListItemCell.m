//
//  CKYSBusinessCollegeFreshListItemCell.m
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeFreshListItemCell.h"

#import "Common.h"
#import "Masonry.h"
#import "UILabel+Category.h"
#import "CKYSBusinessCollegeFreshListItem.h"
#import "CKYSBusinessCollegeTopnewsItem.h"

#import <SDWebImage/UIImageView+WebCache.h>

CGFloat CKYS_BCFL_ITEM_CELL_IMAGE_HEIGHT = 171;
CGFloat CKYS_BCFL_ITEM_CELL_IMAGE_WIDTH = 275;

CGFloat CKYS_BCFL_ITEM_CELL_TITLE_HEIGHT = 50;

CGFloat CKYS_BCFL_ITEM_CELL_HEIGHT = 171+50;
CGFloat CKYS_BCFL_ITEM_CELL_WIDTH = 275;

CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_TOP = 0;
CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_LEFT = 10;
CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_RIGHT = 10;
CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_BOTTOM = 10;
CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_ROW = 10;
CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_CLUME = 10;

@interface CKYSBusinessCollegeFreshListItemCell ()

@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic, strong) UILabel *labelTitle;

@end

@implementation CKYSBusinessCollegeFreshListItemCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.contentView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.width.mas_offset(AdaptedHeight((CKYS_BCFL_ITEM_CELL_IMAGE_WIDTH)));
        make.height.mas_offset(AdaptedHeight((CKYS_BCFL_ITEM_CELL_IMAGE_HEIGHT)));
        make.centerX.equalTo(self.contentView);
    }];
    _labelTitle = [UILabel labelWithTitle:@"" titleFont:15 backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:CGRectMake(0, 0, 15*4+5, 15) numberOfLines:1 textColor:[UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1]];
    [self.contentView addSubview:_labelTitle];
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_imageView);
        make.width.equalTo(@(AdaptedHeight(CKYS_BCFL_ITEM_CELL_IMAGE_WIDTH-CKYS_BCFL_ITEM_CELL_MARGIN_LEFT-CKYS_BCFL_ITEM_CELL_MARGIN_RIGHT)));
        make.top.equalTo(_imageView.mas_bottom).with.offset(AdaptedHeight(9));
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-AdaptedHeight(15));
    }];
}

- (void)setItem:(CKYSBusinessCollegeFreshListItem *)item {
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",item.image]];
    _labelTitle.text = [NSString stringWithFormat:@"%@",item.title];
}

- (void)setTopnewsItem:(CKYSBusinessCollegeTopnewsItem *)topnewsItem {
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",topnewsItem.url]] placeholderImage:nil];
    _labelTitle.text = [NSString stringWithFormat:@"%@",topnewsItem.title];
}

@end
