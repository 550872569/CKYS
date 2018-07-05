//
//  CKYSBusinessCollegeBannerImageCache.m
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeBannerImageCache.h"
#import "CKYSBusinessCollegeBannerItem.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CKYSBusinessCollegeBannerImageCache ()

@property (nonatomic, strong) NSMutableArray <UIImage *>*images;

@end

@implementation CKYSBusinessCollegeBannerImageCache

- (instancetype)initWithBannerItems:(NSArray <CKYSBusinessCollegeBannerItem *>*)bannerItems {
    self = [super init];
    if (self) {
        _images = [NSMutableArray arrayWithCapacity:bannerItems.count];
        [self loadCacheInDiskWithBannerItems:bannerItems];
    }
    return self;
}

- (void)loadCacheInDiskWithBannerItems:(NSArray <CKYSBusinessCollegeBannerItem *>*)bannerItems {
    [bannerItems enumerateObjectsUsingBlock:^(CKYSBusinessCollegeBannerItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:[NSString stringWithFormat:@"%@",obj.path]];
        [_images addObject:cachedImage];
    }];
}

@end
