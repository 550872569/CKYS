//
//  CKYSBusinessCollegeTitleMoreButtonView.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKYSBusinessCollegeTitleMoreButtonViewDelegate.h"

extern CGFloat CKYS_BC_CELL_TITLE_BUTTON_MORE_HEIGHT;

/** 商学院 cell 标题+更多 视图 */
@interface CKYSBusinessCollegeTitleMoreButtonView : UIView

- (instancetype)initWithDelegate:(id<CKYSBusinessCollegeTitleMoreButtonViewDelegate>)delegate;

- (void)setTitle:(NSString *)title;

@end
