//
//  CKYSBusinessCollegeFreshListItemCell.h
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat CKYS_BCFL_ITEM_CELL_HEIGHT;
extern CGFloat CKYS_BCFL_ITEM_CELL_WIDTH;

extern CGFloat CKYS_BCFL_ITEM_CELL_IMAGE_HEIGHT;
extern CGFloat CKYS_BCFL_ITEM_CELL_IMAGE_WIDTH;

extern CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_TOP;
extern CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_LEFT;
extern CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_RIGHT;
extern CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_BOTTOM;
extern CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_ROW;
extern CGFloat CKYS_BCFL_ITEM_CELL_MARGIN_CLUME;

@class CKYSBusinessCollegeFreshListItem;

/*  新鲜出炉cell中的collectionCell */
@interface CKYSBusinessCollegeFreshListItemCell : UICollectionViewCell

- (void)setItem:(CKYSBusinessCollegeFreshListItem *)item;

@end
