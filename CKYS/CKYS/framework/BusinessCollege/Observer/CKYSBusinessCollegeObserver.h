//
//  CKYSBusinessCollegeObserver.h
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKYSBusinessCollegeObserver : NSObject

+ (void)registerApplicationWillTerminateNotificationWithObserver:(id)observer sel:(SEL)sel;

+ (void)unregisterApplicationWillTerminateNotificationWithObserver:(id)observer;

@end
