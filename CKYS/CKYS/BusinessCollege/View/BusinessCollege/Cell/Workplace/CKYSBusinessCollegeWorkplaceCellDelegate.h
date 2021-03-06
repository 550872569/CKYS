//
//  CKYSBusinessCollegeWorkplaceCellDelegate.h
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CKYSBusinessCollegeWorkplaceItemCellTypeConst.h"

@class CKYSBusinessCollegeWorkplaceCell;

@protocol CKYSBusinessCollegeWorkplaceCellDelegate <NSObject>

- (void)businessCollegeWorkplaceCell:(CKYSBusinessCollegeWorkplaceCell *)cell actionType:(CKYSBusinessCollegeWorkplaceItemCellType)type;

@end
