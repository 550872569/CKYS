//
//  CKYSExcellentCourseSelectedTypeCollectionCell.m
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSExcellentCourseSelectedTypeCollectionCell.h"
#import "CKYSExcellentCourseSelectedTypeItem.h"

#import "Common.h"
#import "Masonry.h"
#import "UILabel+Category.h"

CGFloat CKYS_EC_SELECTED_TYPE_CELL_HEIGHT = 24;
CGFloat CKYS_EC_SELECTED_TYPE_CELL_WIDTH = 66;

@implementation CKYSExcellentCourseSelectedTypeCollectionCell {
    UILabel *_labelTitle;
    CKYSExcellentCourseSelectedTypeItem *_selectedTypeItem;
}

- (void)setSelectedTypeItem:(CKYSExcellentCourseSelectedTypeItem *)selectedTypeItem {
    _selectedTypeItem = selectedTypeItem;
    _labelTitle.text = [NSString stringWithFormat:@"%@",selectedTypeItem.title];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    _labelTitle.textColor = selected ? [UIColor colorWithRed:229.179/255.0 green:59.1575/255.0 blue:51.1428/255.0 alpha:1] : [UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
}

- (void)initUI{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView.layer.cornerRadius = 2;
    self.contentView.layer.borderColor = [UIColor colorWithRed:127.5/255.0 green:127.5/255.0 blue:127.5/255.0 alpha:1].CGColor;
    self.contentView.layer.borderWidth = 1;
    
    _labelTitle = [UILabel labelWithTitle:@"" titleFont:15 backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:CGRectMake(0, 0, 15*4+5, 15) numberOfLines:1 textColor:[UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1]];
    [self.contentView addSubview:_labelTitle];
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).with.offset(AdaptedHeight(2));
        make.right.equalTo(self.contentView.mas_right).with.offset(-AdaptedHeight(2));
    }];
}


@end
