//
//  CKYSBusinessCollegeExcellentCourseItem.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 精品课程 cell item cell 数据item 1.image_url 2.title 3.index */

@interface CKYSBusinessCollegeExcellentCourseItem : NSObject

@property(nonatomic, strong, readonly) NSString *image;

@property(nonatomic, strong, readonly) NSString *title;

@property(nonatomic, assign, readonly) int index;

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title index:(int)index;

@end


@interface CKYSBusinessCollegeExcellentCourseModel : NSObject

+ (NSArray <CKYSBusinessCollegeExcellentCourseItem *>*)businessCollegeExcellentCourseItemList;

@end
