//
//  CKYSBusinessCollegeFamousTeacherCell.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CKYSBusinessCollegeFamousTeacherCellDelegate;

/** 名师推荐cell */
@interface CKYSBusinessCollegeFamousTeacherCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setDelegate:(id<CKYSBusinessCollegeFamousTeacherCellDelegate>)dalegate;

@end
