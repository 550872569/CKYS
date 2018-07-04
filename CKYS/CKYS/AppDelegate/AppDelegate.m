//
//  AppDelegate.m
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"

#import "CKYSBusinessCollegeNetworkTool.h"
#import "CKYSBusinessCollegeItem.h"
#import "MJExtension.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initKeywindowAndRootViewController];
    [self loadBusinessCollegeDataOnceOf];
    return YES;
}

- (void)loadBusinessCollegeDataOnceOf {

#define URL @"http://ckysappserver.ckc8.com/Ckapp3/Index/getMainData"
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"" forKey:@"ckid"];
    [dict setValue:@"E7EA1AD8-756C-43AB-8F80-A5A794B9E111" forKey:@"deviceid"];
    [dict setValue:@"0" forKey:@"tgid"];

    [CKYSBusinessCollegeNetworkTool postWithUrl:URL params:dict success:^(id json) {
       CKYSBusinessCollegeItem *item = [CKYSBusinessCollegeItem mj_objectWithKeyValues:json];

    } failure:^(NSError *error) {
        
    }];
}


@end

