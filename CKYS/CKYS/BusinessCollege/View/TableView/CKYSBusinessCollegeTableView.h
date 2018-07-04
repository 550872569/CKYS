//
//  CKYSBusinessCollegeTableView.h
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CKYSBusinessCollegeTableViewCellTypeConst.h"

@protocol CKYSBusinessCollegeTableViewDelegate;

@interface CKYSBusinessCollegeTableView : UITableView

- (void)setDelegate:(id<CKYSBusinessCollegeTableViewDelegate>)delegate;

@end
