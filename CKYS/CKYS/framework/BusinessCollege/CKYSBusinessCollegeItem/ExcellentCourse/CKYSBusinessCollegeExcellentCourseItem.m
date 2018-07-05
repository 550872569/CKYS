//
//  CKYSBusinessCollegeExcellentCourseItem.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeExcellentCourseItem.h"

@interface CKYSBusinessCollegeExcellentCourseItem ()

@property(nonatomic, strong) NSString *image;

@property(nonatomic, strong) NSString *title;

@property(nonatomic, assign) int index;

@end

@implementation CKYSBusinessCollegeExcellentCourseItem

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title index:(int)index {
    self = [super init];
    if (self) {
        _image = imageName.copy;
        _title = title.copy;
        _index = index;
    }
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"\nimage:%@ \ntitle:%@ \nindex:%d ",self.image,self.title,self.index];
}

@end

@implementation CKYSBusinessCollegeExcellentCourseModel

static NSString *BusinessCollegeExcellentCourseImageList[8] = {@"1"};
static NSString *BusinessCollegeExcellentCourseTitleList[8] = {@"精品课程"};

+ (NSArray <CKYSBusinessCollegeExcellentCourseItem *>*)businessCollegeExcellentCourseItemList {
    NSMutableArray *itemList = [NSMutableArray array];
    for (int i = 0; i<8; i++) {
        @autoreleasepool {
            CKYSBusinessCollegeExcellentCourseItem *item = [[CKYSBusinessCollegeExcellentCourseItem alloc] initWithImageName:[NSString stringWithFormat:@"%@",BusinessCollegeExcellentCourseImageList[0]] title:[NSString stringWithFormat:@"%@-%d",BusinessCollegeExcellentCourseTitleList[0],i] index:i];
            [itemList addObject:item];
        }
    }
    return itemList;
}

@end
