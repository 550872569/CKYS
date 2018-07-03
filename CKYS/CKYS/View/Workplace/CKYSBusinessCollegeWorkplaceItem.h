//
//  CKYSBusinessCollegeWorkplaceItem.h
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKYSBusinessCollegeWorkplaceCellDelegate.h"

@interface CKYSBusinessCollegeWorkplaceItem : NSObject

@property(nonatomic, strong, readonly) NSString *itemImage;

@property(nonatomic, strong, readonly) NSString *itemTitle;

@property(nonatomic, assign, readonly) int itemType;

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title type:(int)type;

@end

@interface CKYSBusinessCollegeWorkplaceModel : NSObject

+ (NSArray <CKYSBusinessCollegeWorkplaceItem *>*)businessCollegeWorkplaceItemList;

@end
