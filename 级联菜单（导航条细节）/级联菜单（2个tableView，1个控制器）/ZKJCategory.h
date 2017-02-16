//
//  ZKJCategory.h
//  级联菜单（2个tableView，1个控制器）
//
//  Created by ZKJ on 2016/11/23.
//  Copyright © 2016年 ZKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKJCategory : NSObject

/** <#注释#> */
@property(nonatomic,strong) NSArray *subcategories;
/** <#注释#> */
@property(nonatomic,strong) NSString *name;
/** <#注释#> */
@property(nonatomic,strong) NSString *icon;
/** <#注释#> */
@property(nonatomic,strong) NSString *highlighted_icon;

+ (instancetype)categoryWithDic:(NSDictionary *)dic;

@end
