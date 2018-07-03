//
//  CKYSBusinessCollegeTableView.h
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CKYSBusinessCollegeTableViewCellType) {
    CKYSBusinessCollegeTableViewCellTypeWorkplace = 0,//小白
    CKYSBusinessCollegeTableViewCellTypeFreshList = 1,//新鲜出炉
    CKYSBusinessCollegeTableViewCellTypeExcellentCourse = 2,//精品课程
    CKYSBusinessCollegeTableViewCellTypefFamousTeachers = 3,//名师推荐
};

@interface CKYSBusinessCollegeTableView : UITableView

@end
