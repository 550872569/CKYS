//
//  NSLog.h
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#ifndef NSLog_h
#define NSLog_h

#pragma mark- NSLog DEBUG模式&release模式
#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [line %d] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

#endif /* NSLog_h */
