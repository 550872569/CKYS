//
//  CKYSBusinessCollegeFamousTeacherItem.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeFamousTeacherItem.h"

@interface CKYSBusinessCollegeFamousTeacherItem ()

@property(nonatomic, strong) NSString *image;

@property(nonatomic, strong) NSString *title;

@property(nonatomic, assign) int index;

@end

@implementation CKYSBusinessCollegeFamousTeacherItem

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle index:(int)index {
    self = [super init];
    if (self) {
        _image = imageName.copy;
        _title = title.copy;
        _subTitle = subTitle.copy;
        _index = index;
    }
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"\nimage:%@ \ntitle:%@ \nsubTitle:%@ \nindex:%d ",self.image,self.title,self.subTitle,self.index];
}

@end



@implementation CKYSBusinessCollegeFamousTeacherModel

+ (NSArray <CKYSBusinessCollegeFamousTeacherItem *>*)businessCollegeFamousTeacherItemList {
    NSMutableArray *itemList = [NSMutableArray array];
    for (int i = 0; i<8; i++) {
        @autoreleasepool {
            CKYSBusinessCollegeFamousTeacherItem *item = [[CKYSBusinessCollegeFamousTeacherItem alloc] initWithImageName:[NSString stringWithFormat:@"2"] title:@"刘亦菲" subTitle:@"高级讲师" index:i];
            [itemList addObject:item];
        }
    }
    return itemList;
}

@end

