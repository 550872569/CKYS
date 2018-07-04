//
//  CKYSBusinessCollegeWorkplaceItemCell.m
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeWorkplaceItemCell.h"
#import "Common.h"
#import "CKYSBusinessCollegeWorkplaceItem.h"
#import "Masonry.h"
#import "UILabel+Category.h"

@interface CKYSBusinessCollegeWorkplaceItemCell ()

@property(nonatomic, strong) UIImageView *itemImageView;

@property(nonatomic, strong) UILabel *itemLabel;

@property(nonatomic, strong) NSArray *itemList;

@end

@implementation CKYSBusinessCollegeWorkplaceItemCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    _itemImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_itemImageView];
    [_itemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(AdaptedHeight(15));
        make.width.mas_offset(AdaptedHeight(53));
        make.height.mas_offset(AdaptedHeight(53));
        make.centerX.equalTo(self.contentView);
    }];
    _itemLabel = [UILabel labelWithTitle:@"" titleFont:15 backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:CGRectMake(0, 0, 15*4+5, 15) numberOfLines:1 textColor:[UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1]];
    [self.contentView addSubview:_itemLabel];
    [_itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_itemImageView);
        make.top.equalTo(_itemImageView.mas_bottom).with.offset(AdaptedHeight(9));
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset((-AdaptedHeight(15)));
    }];
}

- (void)setItem:(CKYSBusinessCollegeWorkplaceItem *)item {
    _itemImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",item.itemImage]];
    _itemLabel.text = [NSString stringWithFormat:@"%@",item.itemTitle];
}


@end
