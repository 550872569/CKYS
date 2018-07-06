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
#import "CKYSExcellentCourseContainerView.h"
#import "CKYSScreenConst.h"
#import "CKYSExcellentCourseContentCollectionView.h"

@interface CKYSBCExcellentCourseViewController ()
@property (nonatomic, strong) CKYSExcellentCourseContainerView *containerView;
@end

@implementation CKYSBCExcellentCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精品课程";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSearchItem];
    [self initContainerView];
    [self initContentView];
}

- (void)initContainerView {
    _containerView = [[CKYSExcellentCourseContainerView alloc] initWithFrame:CGRectMake(0, SCREEN_STATUS_AND_NAVIGATION_HEIGHT, SCREEN_WIDTH, CKYS_EC_CONTAINER_HEIGHT)];
    _containerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_containerView];
}
- (void)initContentView {
    CKYSExcellentCourseContentCollectionView *contentView  = [[CKYSExcellentCourseContentCollectionView alloc] initWithFrame:CGRectMake(0, SCREEN_STATUS_AND_NAVIGATION_HEIGHT+CKYS_EC_CONTAINER_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_STATUS_AND_NAVIGATION_HEIGHT-CKYS_EC_CONTAINER_HEIGHT-SCREEN_TAB_BAR_HEIGHT)];
    [self.view addSubview:contentView];
}

- (void)initSearchItem {
    [self initSearchItemWithTarget:self action:@selector(searchItemAction:)];
    self.navigationItem.rightBarButtonItems = @[self.searchItem];
}

- (void)searchItemAction:(UIButton *)sender {
    
}

@end
