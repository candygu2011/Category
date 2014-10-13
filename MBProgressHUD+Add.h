//
//  MBProgressHUD+Add.h
//  jiecaoNews
//
//  Created by aven wu on 14-7-11.
//  Copyright (c) 2014年 GML. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;
@end
