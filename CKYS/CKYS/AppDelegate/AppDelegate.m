//
//  AppDelegate.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"

#import "CKYSBusinessCollegeService.h"
#import "CKYSBusinessCollegeItem.h"
#import "NSLog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initKeywindowAndRootViewController];
//    [self loadBusinessCollegeDataOnceOf];
    return YES;
}

//- (void)loadBusinessCollegeDataOnceOf {
//    [CKYSBusinessCollegeService postBusinessCollegeServiceSuccess:^(CKYSBusinessCollegeItem *businessCollegeItem) {
//        NSLog(@"item%@",businessCollegeItem);
//
//    } failure:^(NSError *error) {
//
//    }];
//}


@end

