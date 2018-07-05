//
//  CKYSBusinessCollegeBannerCell.h
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CKYSBusinessCollegeBannerCellDelegate;

@class CKYSBusinessCollegeBannerItem;

@interface CKYSBusinessCollegeBannerCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setDelegate:(id<CKYSBusinessCollegeBannerCellDelegate>)delegate;

- (void)setBannerItems:(NSArray <CKYSBusinessCollegeBannerItem *>*)bannerItems;

@end
