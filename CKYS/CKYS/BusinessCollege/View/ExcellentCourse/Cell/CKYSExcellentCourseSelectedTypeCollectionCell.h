//
//  CKYSExcellentCourseSelectedTypeCollectionCell.h
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat CKYS_EC_SELECTED_TYPE_CELL_HEIGHT;
extern CGFloat CKYS_EC_SELECTED_TYPE_CELL_WIDTH;

@class CKYSExcellentCourseSelectedTypeItem;

@interface CKYSExcellentCourseSelectedTypeCollectionCell : UICollectionViewCell

- (void)setSelectedTypeItem:(CKYSExcellentCourseSelectedTypeItem *)selectedTypeItem;

@end
