//
//  ConvertJsonToSwiftVar.m
//  ConvertJsonToSwiftVar
//
//  Created by lixiang on 2018/2/2.
//  Copyright © 2018年 com.lixiang. All rights reserved.
//

#import "ConvertJsonToSwiftVar.h"
#import <AppKit/AppKit.h>
#import "JsonHelper.h"

@implementation ConvertJsonToSwiftVar

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo {
    //获取鼠标选中的字符串
    NSArray *arr = (NSArray *)input;
    NSString *string = [NSString stringWithFormat:@"%@",arr.firstObject];
    
    //解析字符串中的字段
    NSString *result = [JsonHelper findVarWithJsonStr:string];
    
    //拷贝到剪贴板
    [[NSPasteboard generalPasteboard] declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [[NSPasteboard generalPasteboard] setString:result forType:NSStringPboardType];
    
    return result;
}

@end
