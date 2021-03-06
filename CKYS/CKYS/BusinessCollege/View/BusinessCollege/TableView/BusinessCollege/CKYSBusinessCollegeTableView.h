//
//  CKYSBusinessCollegeTableView.h
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CKYSBusinessCollegeTableViewCellTypeConst.h"

@class CKYSBusinessCollegeItem;

@protocol CKYSBusinessCollegeTableViewDelegate;

@interface CKYSBusinessCollegeTableView : UITableView

- (void)setBusinessCollegeDelegate:(id<CKYSBusinessCollegeTableViewDelegate>)delegate;

- (void)setBusinessCollegeItem:(CKYSBusinessCollegeItem *)businessCollegeItem;

@end
