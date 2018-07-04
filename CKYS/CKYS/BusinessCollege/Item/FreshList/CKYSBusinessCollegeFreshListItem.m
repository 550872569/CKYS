//
//  CKYSBusinessCollegeFreshListItem.m
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeFreshListItem.h"


@interface CKYSBusinessCollegeFreshListItem ()

@property(nonatomic, strong) NSString *image;

@property(nonatomic, strong) NSString *title;

@property(nonatomic, assign) int index;

@end

@implementation CKYSBusinessCollegeFreshListItem

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


@implementation CKYSBusinessCollegeFreshListModel

+ (NSArray <CKYSBusinessCollegeFreshListItem *>*)businessCollegeFreshListItemList {
    NSMutableArray *itemList = [NSMutableArray array];
    for (int i = 0; i<8; i++) {
        @autoreleasepool {
            CKYSBusinessCollegeFreshListItem *item = [[CKYSBusinessCollegeFreshListItem alloc] initWithImageName:@"3" title:[NSString stringWithFormat:@"5位真实的女性成功的经验之谈%d",i] index:i];
            [itemList addObject:item];
        }
    }
    return itemList;
}

@end

