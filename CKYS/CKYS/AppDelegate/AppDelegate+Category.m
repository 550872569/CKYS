//
//  AppDelegate+Category.m
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "AppDelegate+Category.h"
#import "CKYSBusinessCollegeViewController.h"

@implementation AppDelegate (Category)

- (void)initKeywindowAndRootViewController {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[CKYSBusinessCollegeViewController alloc] init]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

@end
