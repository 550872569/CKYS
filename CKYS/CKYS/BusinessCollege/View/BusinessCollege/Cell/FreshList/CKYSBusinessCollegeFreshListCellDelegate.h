//
//  CKYSBusinessCollegeFreshListCellDelegate.h
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CKYSBusinessCollegeTitleMoreButtonViewDelegate.h"

@class CKYSBusinessCollegeFreshListCell;

@protocol CKYSBusinessCollegeFreshListCellDelegate <CKYSBusinessCollegeTitleMoreButtonViewDelegate>

- (void)businessCollegeFreshListCellDelegateCell:(CKYSBusinessCollegeFreshListCell *)cell indexpath:(NSIndexPath *)indexpath;

@end
