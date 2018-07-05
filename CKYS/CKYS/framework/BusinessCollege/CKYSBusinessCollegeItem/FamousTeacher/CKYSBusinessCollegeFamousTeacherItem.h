//
//  CKYSBusinessCollegeFamousTeacherItem.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKYSBusinessCollegeFamousTeacherItem : NSObject


@property(nonatomic, strong, readonly) NSString *image;

@property(nonatomic, strong, readonly) NSString *title;

@property(nonatomic, strong, readonly) NSString *subTitle;

@property(nonatomic, assign, readonly) int index;

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle index:(int)index;

@end

@interface CKYSBusinessCollegeFamousTeacherModel : NSObject

+ (NSArray <CKYSBusinessCollegeFamousTeacherItem *>*)businessCollegeFamousTeacherItemList;

@end
