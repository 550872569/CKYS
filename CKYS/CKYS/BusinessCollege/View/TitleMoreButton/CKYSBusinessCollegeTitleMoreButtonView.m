//
//  CKYSBusinessCollegeTitleMoreButtonView.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeTitleMoreButtonView.h"

#import "Masonry.h"
#import "Common.h"

#import "UILabel+Category.h"
#import "UIButton+title.h"
#import "UIButton+ClearColor.h"

CGFloat CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT = 47;

@interface CKYSBusinessCollegeTitleMoreButtonView ()

@property (nonatomic, weak) id<CKYSBusinessCollegeTitleMoreButtonViewDelegate> delegate;

@property (nonatomic, strong) UILabel *labelTitle;

@end

@implementation CKYSBusinessCollegeTitleMoreButtonView {
    __weak id<CKYSBusinessCollegeTitleMoreButtonViewDelegate> _delegate;
}

- (instancetype)initWithDelegate:(id<CKYSBusinessCollegeTitleMoreButtonViewDelegate>)delegate {
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT)];
    if (self) {
        _delegate = delegate;
    }
    return [self initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT)];
}

- (void)setTitle:(NSString *)title {
    [_labelTitle setText:[NSString stringWithFormat:@"%@",title]];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = [UIColor yellowColor];
    _labelTitle = [UILabel labelWithTitle:@"" titleFont:16 backgroundColor:[UIColor clearColor] textAlignment:NSTextAlignmentCenter ract:CGRectZero numberOfLines:1 textColor:[UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1]];
    [self addSubview:_labelTitle];
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
    
    UIButton *buttonMore = [UIButton buttonWithTitle:@"更多>" titleFont:13 titleColorNormal:[UIColor colorWithRed:135.999/255.0 green:135.999/255.0 blue:135.999/255.0 alpha:1] titleColorHilight:[UIColor colorWithRed:135.999/255.0 green:135.999/255.0 blue:135.999/255.0 alpha:1] titleColorDisable:[UIColor colorWithRed:135.999/255.0 green:135.999/255.0 blue:135.999/255.0 alpha:1] backgroundImageNoraml:nil backgroundImageHilight:nil backgroundImageDisable:nil backgroundColor:[UIColor clearColor] cornerRadius:0 enabled:true rect:CGRectZero Targrt:self action:@selector(buttonMoreAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonMore];
    [buttonMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).with.offset(-11);
        make.width.equalTo(@40);
    }];
    UIButton *buttonClearColor = [UIButton buttonWithTargrt:self action:@selector(buttonClearColorAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonClearColor];
    [buttonClearColor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
        make.right.equalTo(buttonMore.mas_left);
    }];
}

- (void)buttonClearColorAction:(UIButton *)sender {
    return;
}

- (void)buttonMoreAction:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(CKYSBusinessCollegeTitleMoreButtonViewDelegate:moreAction:)]) {
        [_delegate CKYSBusinessCollegeTitleMoreButtonViewDelegate:self moreAction:sender];
    }
}

@end
