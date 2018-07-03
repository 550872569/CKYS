//
//  CKYSBusinessCollegeExcellentCourseCellDelegate.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CKYSBusinessCollegeExcellentCourseCell;

@protocol CKYSBusinessCollegeExcellentCourseCellDelegate <NSObject>

- (void)businessCollegeExcellentCourseCellDelegateCell:(CKYSBusinessCollegeExcellentCourseCell *)cell indexpath:(NSIndexPath *)indexpath;

@end
