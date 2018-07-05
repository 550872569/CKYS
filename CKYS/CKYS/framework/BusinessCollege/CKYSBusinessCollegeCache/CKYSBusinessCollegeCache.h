//
//  CKYSBusinessCollegeCache.h
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CKYSBusinessCollegeItem;

@interface CKYSBusinessCollegeCache : NSObject

- (BOOL)saveBusinessCollegeData:(CKYSBusinessCollegeItem *)businessCollegeItem;

- (CKYSBusinessCollegeItem *)readBusinessCollegeData;

@end
