//
//  CKYSBusinessCollegeFamousTeacherItemCell.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CKYS_BCFT_ITEM_CELL_HEIGHT  155
#define CKYS_BCFT_ITEM_CELL_WIDTH   131

extern CGFloat CKYS_BCFT_ITEM_CELL_MARGIN;

extern CGFloat CKYS_BCFT_ITEM_CELL_BOTTOM_OFFSET;

@class CKYSBusinessCollegeFamousTeacherItem, CKYSBusinessCollegeHonorListItem;

/** 名师推荐Item Cell */
@interface CKYSBusinessCollegeFamousTeacherItemCell : UICollectionViewCell

- (void)setFamousTeacherItem:(CKYSBusinessCollegeFamousTeacherItem *)famousTeacherItem;

#warning debug data
- (void)setHonorListItem:(CKYSBusinessCollegeHonorListItem *)item;

@end
