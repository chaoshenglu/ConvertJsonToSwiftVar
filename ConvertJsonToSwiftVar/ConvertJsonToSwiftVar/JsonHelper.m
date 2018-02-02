//
//  JsonHelper.m
//  ConvertJsonToSwiftVar
//
//  Created by lixiang on 2018/2/2.
//  Copyright © 2018年 com.lixiang. All rights reserved.
//

#import "JsonHelper.h"

@implementation JsonHelper

+ (BOOL)judgePureInt:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)judgePureFloat:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

+ (NSMutableString *)findVarWithJsonStr:(NSString *)jsonStr {
    NSMutableString *result = [NSMutableString new];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSArray *arr = [jsonStr componentsSeparatedByString:@","];
    for (NSString *kvStr in arr) {
        NSString *str = @"";
        NSArray *kvArr = [kvStr componentsSeparatedByString:@":"];
        NSString *key_quotation_marks = kvArr.firstObject;
        NSString *key = [key_quotation_marks stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        NSString *value = kvArr.lastObject;
        if ([value containsString:@"\""]){
            
            str = [NSString stringWithFormat:@"\n///\nvar %@ = \"\"",key];
            
        }else if([value containsString:@"["]){
            
            str = [NSString stringWithFormat:@"\n///\nvar %@ = [XXModel]()",key];
            
        }else if([value containsString:@"."]){
            
            if ([self judgePureFloat:value]) {
                str = [NSString stringWithFormat:@"\n///\nvar %@ = 0.00",key];
            }
            
        }else if([value containsString:@"null"]){
            
            str = [NSString stringWithFormat:@"\n///\nvar %@ = nil",key];
            
        }else if([value containsString:@"{"]){
            
            str = [NSString stringWithFormat:@"\n///\nvar %@ = XXModel()",key];
            
        }else if([value containsString:@"false"]){
            
            str = [NSString stringWithFormat:@"\n///\nvar %@ = false",key];
            
        }else if([value containsString:@"true"]){
            
            str = [NSString stringWithFormat:@"\n///\nvar %@ = false",key];
            
        }else {
            
            if ([self judgePureInt:value]) {
                str = [NSString stringWithFormat:@"\n///\nvar %@ = 0",key];
            }
            
        }
        
        if ([key hasSuffix:@"id"]||[key hasSuffix:@"Id"]) {
            str = [NSString stringWithFormat:@"\n///\nvar %@ : String?",key];
        }
        
        if ([key hasSuffix:@"price"]||[key hasSuffix:@"Price"]) {
            str = [NSString stringWithFormat:@"\n///\nvar %@ = 0.00",key];
        }
        
        [result appendString:str];
    }
    
    return result;
}

@end
