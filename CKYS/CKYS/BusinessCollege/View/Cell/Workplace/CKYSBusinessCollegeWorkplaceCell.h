//
//  CKYSBusinessCollegeWorkplaceCell.h
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CKYSBusinessCollegeWorkplaceCellDelegate;

/* 小白 精英 社群cell */
@interface CKYSBusinessCollegeWorkplaceCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setDelegate:(id<CKYSBusinessCollegeWorkplaceCellDelegate>)delegate;

@end
