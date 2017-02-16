//
//  ZKJCategory.m
//  级联菜单（2个tableView，1个控制器）
//
//  Created by ZKJ on 2016/11/23.
//  Copyright © 2016年 ZKJ. All rights reserved.
//

#import "ZKJCategory.h"

@implementation ZKJCategory

+ (instancetype)categoryWithDic:(NSDictionary *)dic
{
    ZKJCategory *cate = [[self alloc] init];
    [cate setValuesForKeysWithDictionary:dic];
    return cate;
}

@end
