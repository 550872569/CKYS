//
//  CKYSExcellentCourseSelectedTypeItem.h
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 精品课程 选择类型item */
@interface CKYSExcellentCourseSelectedTypeItem : NSObject

@property(nonatomic, strong, readonly) NSString *title;

@property(nonatomic, assign, readonly) int index;

- (instancetype)initWithTitle:(NSString *)title index:(int)index;

@end


@interface CKYSExcellentCourseSelectedTypeModel : NSObject

+ (NSArray <CKYSExcellentCourseSelectedTypeItem *>*)excellentCourseSelectedTypeItemList;

@end
