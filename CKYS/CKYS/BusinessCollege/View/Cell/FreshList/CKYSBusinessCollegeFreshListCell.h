//
//  CKYSBusinessCollegeFreshListCell.h
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CKYSBusinessCollegeFreshListCellDelegate;

/*
 新鲜出炉cell
 */
@interface CKYSBusinessCollegeFreshListCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setDelegate:(id<CKYSBusinessCollegeFreshListCellDelegate>)delegate;

@end
