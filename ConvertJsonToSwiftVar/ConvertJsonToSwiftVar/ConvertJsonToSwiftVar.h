//
//  ConvertJsonToSwiftVar.h
//  ConvertJsonToSwiftVar
//
//  Created by lixiang on 2018/2/2.
//  Copyright © 2018年 com.lixiang. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface ConvertJsonToSwiftVar : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
