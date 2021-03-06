//
//  CKYSBusinessCollegeViewController.m
//  CKYS
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeViewController.h"
#import "CKYSBusinessCollegeTableView.h"
#import "CKYSBusinessCollegeTableViewDelegate.h"
#import "CKYSBCExcellentCourseViewController.h"
#import "CKYSBCCourseDetailViewController.h"
#import "CKYSBCTeacherListViewController.h"
#import "CKYSBCTeacherDetailViewController.h"


#import "CKYSBusinessCollegeXBRMViewController.h"
#import "CKYSBusinessCollegeJYTSViewController.h"
#import "CKYSBusinessCollegeSQGLViewController.h"

#import "CKYSBusinessCollegeFreshListViewController.h"
#import "CKYSBCHotCourseViewController.h"

#import "CKYSBusinessCollegeService.h"
#import "CKYSBusinessCollegeItem.h"

#import "CKYSScreenConst.h"

#import "CKYSBusinessCollegeCache.h"
#import "CKYSBusinessCollegeCache.h"

#import "CKYSBusinessCollegeServiceHelp.h"

#import "CKYSBusinessCollegeObserver.h"

@interface CKYSBusinessCollegeViewController ()

<CKYSBusinessCollegeTableViewDelegate>

@property (nonatomic, strong) CKYSBusinessCollegeTableView *tableView;
/** 服务端返回的数据模型 */
@property (nonatomic, strong) CKYSBusinessCollegeItem *businessCollegeItem;
@property (nonatomic, strong) CKYSBusinessCollegeCache *businessCollegeCache;

@end

@implementation CKYSBusinessCollegeViewController


#pragma mark - Life
- (void)loadView {
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH-SCREEN_STATUS_AND_NAVIGATION_HEIGHT-SCREEN_TAB_BAR_HEIGHT)];
    [self initTitle];
    [self initTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadBusinessCollegeDataOnDisk];
    [self loadBusinessCollegeDataOnceOf];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CKYSBusinessCollegeObserver registerApplicationWillTerminateNotificationWithObserver:self sel:@selector(private_ApplicationWillTerminate:)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - UI

- (void)initTitle {
    NSString *title = @"商学院";
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - titleSize.width)/ 2, (SCREEN_HEIGHT - titleSize.height) / 2, titleSize.width, titleSize.height)];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor colorWithRed:50.9796/255.0 green:50.9796/255.0 blue:50.9796/255.0 alpha:1];
    titleLabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;
}

- (void)initTableView {
    self.view.backgroundColor =  [UIColor whiteColor];
    _tableView = [[CKYSBusinessCollegeTableView alloc] initWithFrame:CGRectMake(0, SCREEN_STATUS_AND_NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_STATUS_AND_NAVIGATION_HEIGHT-SCREEN_TAB_BAR_HEIGHT) style:UITableViewStylePlain];
    if (@available(iOS 11.0, *)) {//iOS 10 & 11 view.y 10 = 64 11 = 0
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _tableView.backgroundColor = [UIColor grayColor];
    [_tableView setBusinessCollegeDelegate:self];
    [self.view addSubview:_tableView];
}

#pragma mark - CKYSBusinessCollegeTableViewDelegate

#pragma mark 轮播图
- (void)businessCollegeTableViewBannerCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(CKYSBusinessCollegeBannerCellActionType)index {
    NSLog(@"type%ld index:%ld",type,index);
    [self pushToObjViewController:[[CKYSBCCourseDetailViewController alloc] init]];
}

#pragma mark 小白 精英 管理
- (void)businessCollegeTableViewWorkplaceCellActionType:(CKYSBusinessCollegeTableViewCellType)type indexType:(CKYSBusinessCollegeWorkplaceItemCellType)indexType {
    NSLog(@"type%ld indexType:%ld",type,indexType);
    if (indexType == CKYSBusinessCollegeWorkplaceItemCellTypeXBRM) {
        [self pushToObjViewController:[[CKYSBusinessCollegeXBRMViewController alloc] init]];
    } else if (indexType == CKYSBusinessCollegeWorkplaceItemCellTypeJYTS) {
        [self pushToObjViewController:[[CKYSBusinessCollegeJYTSViewController alloc] init]];
    } else if (indexType == CKYSBusinessCollegeWorkplaceItemCellTypeSQGL) {
        [self pushToObjViewController:[[CKYSBusinessCollegeSQGLViewController alloc] init]];
    }
}

#pragma mark 新鲜出炉
- (void)businessCollegeTableViewFreshListCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index {
    NSLog(@"type%ld index:%ld",type,index);
    [self pushToCourseDetailViewController];
}

#pragma mark 精品课程
- (void)businessCollegeTableViewExcellentCourseCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index {
    NSLog(@"type%ld index:%ld",type,index);
    [self pushToObjViewController:[[CKYSBCExcellentCourseViewController alloc] init]];
}

#pragma mark 名师推荐
- (void)businessCollegeTableViewFamousTeacherCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index;{
    NSLog(@"type%ld index:%ld",type,index);
    [self pushToTeacherDetailViewController];
}

#pragma mark 更多按钮
- (void)CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTableViewCellType)cellType moreAction:(UIButton *)sender {
    if (cellType==CKYSBusinessCollegeTableViewCellTypefFamousTeachers) {
        [self pushToTeacherListViewController];
    } else if (cellType==CKYSBusinessCollegeTableViewCellTypeExcellentCourse) {
        [self pushToCourseListViewController];
    } else if (cellType==CKYSBusinessCollegeTableViewCellTypeFreshList) {
        [self pushToObjViewController:[[CKYSBusinessCollegeFreshListViewController alloc] init]];
    }
}

#pragma mark -  private
/** 精品课程 & 更多 */
- (void)pushToCourseListViewController {
    [self pushToObjViewController:[[CKYSBCExcellentCourseViewController alloc] init]];
}

/** 课程详情 */
- (void)pushToCourseDetailViewController {
    [self pushToObjViewController:[[CKYSBCCourseDetailViewController alloc] init]];
}

/** 讲师大本营 */
- (void)pushToTeacherListViewController {
    [self pushToObjViewController:[[CKYSBCTeacherListViewController alloc] init]];
}

/** 讲师主页 */
- (void)pushToTeacherDetailViewController {
    [self pushToObjViewController:[[CKYSBCTeacherDetailViewController alloc] init]];
}

/** 职场vc */
- (void)pushToObjViewController:(UIViewController *)objViewController {
    [self.navigationController pushViewController:objViewController animated:true];
}

#pragma mark - Data

- (void)loadBusinessCollegeDataOnDisk {
    if (!_businessCollegeCache) {
        _businessCollegeCache = [[CKYSBusinessCollegeCache alloc] init];
        _businessCollegeItem =  [_businessCollegeCache loadBusinessCollegeData];
        if (_businessCollegeItem) {
            [self.tableView setBusinessCollegeItem:_businessCollegeItem];
        }
    }
}

- (void)private_ApplicationWillTerminate:(NSNotification *)sender {
    /** 退出应用需要重新请求服务端数据 */
    [CKYSBusinessCollegeServiceHelp setRequestBusinessCollegeServiceStatusSuccess:false];
}

- (void)loadBusinessCollegeDataOnceOf {
    if (![CKYSBusinessCollegeServiceHelp isNeedRequestBusinessCollegeService]) {
        NSLog(@"本地有缓存，无需在点击时请求服务端");
        return;
    }
    __typeof(self)weakSelf = self;
    [CKYSBusinessCollegeService postBusinessCollegeServiceSuccess:^(CKYSBusinessCollegeItem *businessCollegeItem) {
        //0 refresh UI
        _businessCollegeItem = businessCollegeItem.mutableCopy;
        __typeof(self)strongSelf = weakSelf;
        
        [strongSelf.tableView setBusinessCollegeItem:_businessCollegeItem];
        
        //1. delete Disk
        _businessCollegeCache = [[CKYSBusinessCollegeCache alloc] init];
        [_businessCollegeCache deleteBusinessCollegeData];
        //2. save to Disk
        [_businessCollegeCache saveBusinessCollegeData:_businessCollegeItem.mutableCopy];
    } failure:^(NSError *error) {
        
    }];
}


- (void)dealloc {
    [CKYSBusinessCollegeObserver unregisterApplicationWillTerminateNotificationWithObserver:self];
    NSLog(@"self:%@",self);
}

@end
