//
//  CKYSFileUtils.h
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKYSFileUtils : NSObject

+ (BOOL)pathExists:(NSString *)path isDir:(BOOL *)isDir;

+ (void)createDirectoryAtPath:(NSString *)dirPath;
+ (void)createFileAtPath:(NSString *)filePath;

+ (NSData *)readFileAtPath:(NSString *)filePath;
+ (NSString *)readFileAsStringAtPath:(NSString *)filePath;

+ (void)writeData:(NSData *)data toFileAtPath:(NSString *)filePath;
+ (void)writeString:(NSString *)str toFileAtPath:(NSString *)filePath;

+ (BOOL)moveSrcPath:(NSString *)srcPath toDestPath:(NSString *)destPath overWrite:(bool)overWrite;
+ (BOOL)deletePath:(NSString *)path;

@end
