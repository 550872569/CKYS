//
//  CKYSBusinessCollegeTitleMoreButtonViewDelegate.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CKYSBusinessCollegeTitleMoreButtonView;

@protocol CKYSBusinessCollegeTitleMoreButtonViewDelegate <NSObject>

- (void)CKYSBusinessCollegeTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTitleMoreButtonView *)view moreAction:(UIButton *)sender;

@optional
- (void)CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:(UITableViewCell *)cell moreAction:(UIButton *)sender;

@end
