//
//  CKYSBusinessCollegeObserver.m
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeObserver.h"
#import <UIKit/UIKit.h>

@implementation CKYSBusinessCollegeObserver

+ (void)registerApplicationWillTerminateNotificationWithObserver:(id)observer sel:(SEL)sel {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:sel name:UIApplicationWillTerminateNotification object:nil];
}

+ (void)unregisterApplicationWillTerminateNotificationWithObserver:(id)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:UIApplicationWillTerminateNotification object:observer];
}

@end
