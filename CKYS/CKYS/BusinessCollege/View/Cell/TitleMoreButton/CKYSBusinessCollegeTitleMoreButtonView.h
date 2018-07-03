//
//  CKYSBusinessCollegeTitleMoreButtonView.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKYSBusinessCollegeTitleMoreButtonView;

@protocol CKYSBusinessCollegeTitleMoreButtonViewDelegate <NSObject>

- (void)CKYSBusinessCollegeTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTitleMoreButtonView *)view moreAction:(UIButton *)sender;

@end

@interface CKYSBusinessCollegeTitleMoreButtonView : UIView

- (instancetype)initWithDelegate:(id<CKYSBusinessCollegeTitleMoreButtonViewDelegate>)delegate;

- (void)setTitle:(NSString *)title;

@end
