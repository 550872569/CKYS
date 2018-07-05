//
//  CKYSBusinessCollegeBannerImageCache.h
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CKYSBusinessCollegeBannerItem;

@interface CKYSBusinessCollegeBannerImageCache : NSObject

@property (nonatomic, strong, readonly) NSMutableArray <UIImage *>*images;

- (instancetype)initWithBannerItems:(NSArray <CKYSBusinessCollegeBannerItem *>*)bannerItems;

@end
