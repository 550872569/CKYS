//
//  CKYSBusinessCollegeViewController.m
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeViewController.h"
#import "CKYSBusinessCollegeTableView.h"

#define VGScreenW [UIScreen mainScreen].bounds.size.width
#define VGScreenH [UIScreen mainScreen].bounds.size.height

@interface CKYSBusinessCollegeViewController ()

@end

@implementation CKYSBusinessCollegeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
}

- (void)configTableView {
    self.view.backgroundColor =[UIColor whiteColor];
    CKYSBusinessCollegeTableView *tableView = [[CKYSBusinessCollegeTableView alloc] initWithFrame:CGRectMake(0, 100, VGScreenW, VGScreenH) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:tableView];
}

@end
