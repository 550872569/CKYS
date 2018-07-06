//
//  CKYSExcellentCourseSelectedTypeItem.m
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSExcellentCourseSelectedTypeItem.h"

@interface CKYSExcellentCourseSelectedTypeItem ()

@property(nonatomic, strong) NSString *title;

@property(nonatomic, assign) int index;

@end

@implementation CKYSExcellentCourseSelectedTypeItem

- (instancetype)initWithTitle:(NSString *)title index:(int)index {
    self = [super init];
    if (self) {
        _title = title.copy;
        _index = index;
    }
    return self;
}

@end

@implementation CKYSExcellentCourseSelectedTypeModel

static NSString *ExcellentCourseSelectedTypeTitleList[8] = {@"洗护类"};

+ (NSArray <CKYSExcellentCourseSelectedTypeItem *>*)excellentCourseSelectedTypeItemList {
    NSMutableArray *itemList = [NSMutableArray array];
    for (int i = 0; i<8; i++) {
        @autoreleasepool {
            CKYSExcellentCourseSelectedTypeItem *item = [[CKYSExcellentCourseSelectedTypeItem alloc] initWithTitle:[NSString stringWithFormat:@"%@",ExcellentCourseSelectedTypeTitleList[0]] index:i];
            [itemList addObject:item];
        }
    }
    return itemList;
}

@end
