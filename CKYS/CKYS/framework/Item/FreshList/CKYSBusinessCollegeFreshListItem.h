//
//  CKYSBusinessCollegeFreshListItem.h
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 新鲜出炉 cell item cell 数据item 1.image_url 2.title 3.index */

@interface CKYSBusinessCollegeFreshListItem : NSObject

@property(nonatomic, strong, readonly) NSString *image;

@property(nonatomic, strong, readonly) NSString *title;

@property(nonatomic, assign, readonly) int index;

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title index:(int)index;

@end

@interface CKYSBusinessCollegeFreshListModel : NSObject

+ (NSArray <CKYSBusinessCollegeFreshListItem *>*)businessCollegeFreshListItemList;

@end
