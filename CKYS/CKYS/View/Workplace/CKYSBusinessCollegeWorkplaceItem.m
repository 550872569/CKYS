//
//  CKYSBusinessCollegeWorkplaceItem.m
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeWorkplaceItem.h"

@interface CKYSBusinessCollegeWorkplaceItem ()

@property(nonatomic, strong) NSString *itemImage;

@property(nonatomic, strong) NSString *itemTitle;

@property(nonatomic, assign) int itemType;

@end

@implementation CKYSBusinessCollegeWorkplaceItem

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title type:(int)type {
    self = [super init];
    if (self) {
        _itemImage = imageName.copy;
        _itemTitle = title.copy;
        _itemType = type;
    }
    return self;
}

- (NSString *)description {

    return [NSString stringWithFormat:@"\nitemImage:%@ \nitemTitle:%@ \nitemType:%d ",self.itemImage,self.itemTitle,self.itemType];
}

@end

@implementation CKYSBusinessCollegeWorkplaceModel

static NSString *BusinessCollegeWorkplaceImageList[3] = {@"ckys_businessCollegeWorkplace_image_xbrm",@"ckys_businessCollegeWorkplace_image_jyts",@"ckys_businessCollegeWorkplace_image_sqgl"};
static NSString *BusinessCollegeWorkplaceTitleList[3] = {@"小白入门",@"精英提升",@"社群管理"};

+ (NSArray <CKYSBusinessCollegeWorkplaceItem *>*)businessCollegeWorkplaceItemList {
    NSMutableArray *itemList = [NSMutableArray array];
    for (int i = 0; i<3; i++) {
        @autoreleasepool {
            CKYSBusinessCollegeWorkplaceItem *item = [[CKYSBusinessCollegeWorkplaceItem alloc] initWithImageName:[NSString stringWithFormat:@"%@",BusinessCollegeWorkplaceImageList[i]] title:[NSString stringWithFormat:@"%@",BusinessCollegeWorkplaceTitleList[i]] type:i];
            [itemList addObject:item];
        }
    }
    return itemList;
}

@end
