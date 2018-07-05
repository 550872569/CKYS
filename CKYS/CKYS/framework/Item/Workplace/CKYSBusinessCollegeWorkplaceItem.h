//
//  CKYSBusinessCollegeWorkplaceItem.h
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKYSBusinessCollegeWorkplaceCellDelegate.h"

/** 职场 cell item cell 数据item 1.image_url 2.title 3.type */

@interface CKYSBusinessCollegeWorkplaceItem : NSObject

@property(nonatomic, strong, readonly) NSString *itemImage;

@property(nonatomic, strong, readonly) NSString *itemTitle;

@property(nonatomic, assign, readonly) int itemType;

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title type:(int)type;

@end

@interface CKYSBusinessCollegeWorkplaceModel : NSObject

+ (NSArray <CKYSBusinessCollegeWorkplaceItem *>*)businessCollegeWorkplaceItemList;

@end
