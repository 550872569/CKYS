//
//  CKYSBusinessCollegeFreshListCellDelegate.h
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CKYSBusinessCollegeFreshListCell;

@protocol CKYSBusinessCollegeFreshListCellDelegate <NSObject>

- (void)businessCollegeFreshListCellDelegateCell:(CKYSBusinessCollegeFreshListCell *)cell indexpath:(NSIndexPath *)indexpath;

@end
