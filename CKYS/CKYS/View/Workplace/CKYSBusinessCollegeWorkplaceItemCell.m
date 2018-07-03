//
//  CKYSBusinessCollegeWorkplaceItemCell.m
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeWorkplaceItemCell.h"
#import "Common.h"
#import "CKYSBusinessCollegeWorkplaceItem.h"

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
        make.top.mas_offset(15);
        make.width.mas_offset((53));
        make.height.mas_offset((53));
        make.centerX.equalTo(self.contentView);
    }];
    _itemLabel = [[UILabel alloc] init];
    _itemLabel.textColor = [UIColor blackColor];
    _itemLabel.textAlignment = NSTextAlignmentCenter;
    _itemLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_itemLabel];
    [_itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(AdaptedWidth(59));
        make.centerX.mas_equalTo(_itemImageView);
        make.top.equalTo(_itemImageView.mas_bottom).with.offset(9);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-15);
    }];
}

- (void)setItem:(CKYSBusinessCollegeWorkplaceItem *)item {
    _itemImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",item.itemImage]];
    _itemLabel.text = [NSString stringWithFormat:@"%@",item.itemTitle];
}


@end
