//
//  CKYSBusinessCollegeTitleMoreButtonViewDelegate.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CKYSBusinessCollegeTableViewCellTypeConst.h"

@class CKYSBusinessCollegeTitleMoreButtonView;

@protocol CKYSBusinessCollegeTitleMoreButtonViewDelegate <NSObject>

@optional

- (void)CKYSBusinessCollegeTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTitleMoreButtonView *)view moreAction:(UIButton *)sender;

- (void)CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTableViewCellType)cellType moreAction:(UIButton *)sender;


@end

