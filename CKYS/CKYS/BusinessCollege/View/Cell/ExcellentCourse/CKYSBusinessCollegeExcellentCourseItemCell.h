//
//  CKYSBusinessCollegeExcellentCourseItemCell.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat CKYS_BCEC_ITEM_CELL_HEIGHT;

extern CGFloat CKYS_BCEC_ITEM_CELL_MARGIN;
extern CGFloat CKYS_BCEC_ITEM_CELL_BOTTOM_OFFSET;

#define  CKYS_BCEC_ITEM_CELL_WIDTH  (([UIScreen mainScreen].bounds.size.width-CKYS_BCEC_ITEM_CELL_MARGIN*3)/2)

@class CKYSBusinessCollegeExcellentCourseItem;

@interface CKYSBusinessCollegeExcellentCourseItemCell : UICollectionViewCell

- (void)setItem:(CKYSBusinessCollegeExcellentCourseItem *)item;

@end
