//
//  CKYSBCExcellentCourseViewController.m
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBCExcellentCourseViewController.h"
#import "UIViewController+SearchItem.h"
#import "CKYSBCSearchItem.h"

@interface CKYSBCExcellentCourseViewController ()

@end

@implementation CKYSBCExcellentCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精品课程";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSearchItem];
}

- (void)initSearchItem {
    [self initSearchItemWithTarget:self action:@selector(searchItemAction:)];
    self.navigationItem.rightBarButtonItems = @[self.searchItem];
}

- (void)searchItemAction:(UIButton *)sender {
    
}

@end
