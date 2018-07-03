//
//  CKYSBusinessCollegeFamousTeacherCellDelegate.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKYSBusinessCollegeTitleMoreButtonViewDelegate.h"

@class CKYSBusinessCollegeFamousTeacherCell;

@protocol CKYSBusinessCollegeFamousTeacherCellDelegate <CKYSBusinessCollegeTitleMoreButtonViewDelegate>

- (void)businessCollegeFamousTeacherCellDelegateCell:(CKYSBusinessCollegeFamousTeacherCell *)cell indexpath:(NSIndexPath *)indexpath;

@end
