//
//  AppDelegate.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "AppDelegate.h"
#import "CKYSBusinessCollegeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[CKYSBusinessCollegeViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
