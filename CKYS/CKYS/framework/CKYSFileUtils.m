//
//  CKYSFileUtils.m
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSFileUtils.h"

@implementation CKYSFileUtils

+ (BOOL)pathExists:(NSString *)path isDir:(BOOL *)isDir{
    BOOL tmp;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:isDir ? isDir : &tmp];
    return isExist;
}

+ (void)createDirectoryAtPath:(NSString *)dirPath {
    BOOL isDir = YES;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:dirPath isDirectory:&isDir];
    if (!isExist) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
+ (void)createFileAtPath:(NSString *)filePath {
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (!isExist) {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }}

+ (NSData *)readFileAtPath:(NSString *)filePath {
    return [NSData dataWithContentsOfFile:filePath];
}

+ (NSString *)readFileAsStringAtPath:(NSString *)filePath {
    NSData *dataResult = [self readFileAtPath:filePath readOffset:0];
    if (dataResult == nil) {
        return nil;
    }
    return [[NSString alloc]initWithData:dataResult encoding:NSUTF8StringEncoding];
}

+ (NSData *)readFileAtPath:(NSString *)filePath ofOffset:(long)readOffset {
    return [self readFileAtPath:filePath readOffset:readOffset];
}

+ (void)writeData:(NSData *)data toFileAtPath:(NSString *)filePath {
    if (data == nil) {
        data = [NSData data];
    }
    [data writeToFile:filePath atomically:YES];
}

+ (void)writeString:(NSString *)str toFileAtPath:(NSString *)filePath {
    NSData *dataWrite = [str dataUsingEncoding:NSUTF8StringEncoding];
    [self writeData:dataWrite toFileAtPath:filePath];
}

+ (NSData *)readFileAtPath:(NSString *)filePath readOffset:(long)readOffset {
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if(fileHandle == nil){
        return nil;
    }
    [fileHandle seekToFileOffset:readOffset];
    NSData *dataResult = [fileHandle readDataToEndOfFile];
    [fileHandle closeFile];
    return dataResult;
}

+ (NSData *)readFileAtPath:(NSString *)filePath ofOffset:(long)readOffset ofLength:(long)readLength{
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if(fileHandle == nil){
        return nil;
    }
    [fileHandle seekToFileOffset:readOffset];
    NSData *dataResult = [fileHandle readDataOfLength:readLength];
    [fileHandle closeFile];
    return dataResult;
}

+ (BOOL)moveSrcPath:(NSString *)srcPath toDestPath:(NSString *)destPath overWrite:(bool)overWrite{
    if(![self pathExists:srcPath isDir:0]){
        return NO;
    }
    if([self pathExists:destPath isDir:0] && !overWrite){
        return NO;
    }
    
    NSError *error = nil;
    BOOL r =  [[NSFileManager defaultManager] replaceItemAtURL:[NSURL fileURLWithPath:destPath] withItemAtURL:[NSURL fileURLWithPath:srcPath] backupItemName:nil options:NSFileManagerItemReplacementUsingNewMetadataOnly resultingItemURL:nil error:&error];
    return r;
}

+ (BOOL)deletePath:(NSString *)path{
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

@end
