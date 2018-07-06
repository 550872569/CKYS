//
//  CKYSExcellentCourseSelectedTypeViewDelegate
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CKYSExcellentCourseSelectedTypeView, CKYSExcellentCourseSelectedTypeItem;

@protocol CKYSExcellentCourseSelectedTypeViewDelegate <NSObject>

- (void)excellentSelectedTypeView:(CKYSExcellentCourseSelectedTypeView *)view didSelectedAtIndexpath:(NSIndexPath *)indexpath;

@end

@protocol CKYSExcellentCourseSelectedTypeViewProtocol <NSObject>

- (void)setSelectedTypeViewDelegate:(id<CKYSExcellentCourseSelectedTypeViewDelegate>)delegate;

- (void)setDataArray:(NSArray <CKYSExcellentCourseSelectedTypeItem *>*)dataArray;

@end
