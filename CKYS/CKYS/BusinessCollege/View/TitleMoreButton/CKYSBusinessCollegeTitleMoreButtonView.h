//
//  CKYSBusinessCollegeTitleMoreButtonView.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT;

@class CKYSBusinessCollegeTitleMoreButtonView;

@protocol CKYSBusinessCollegeTitleMoreButtonViewDelegate <NSObject>

- (void)CKYSBusinessCollegeTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTitleMoreButtonView *)view moreAction:(UIButton *)sender;

@end

/** 商学院 cell 标题+更多 视图 */
@interface CKYSBusinessCollegeTitleMoreButtonView : UIView

- (instancetype)initWithDelegate:(id<CKYSBusinessCollegeTitleMoreButtonViewDelegate>)delegate;

- (void)setTitle:(NSString *)title;

@end
