//
//  MBProgressHUD+Show.m
//  TuanChe
//
//  Created by gml on 14-7-31.
//  Copyright (c) 2014年 GML. All rights reserved.
//

#import "MBProgressHUD+Show.h"

@implementation MBProgressHUD (Show)


+(void)showSuccessWithText:(NSString *)text icon:(NSString *)icon
{
    // 显示加载的图片
    MBProgressHUD *hud =   [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.labelText = text;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.delegate = self;
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI , 0, 0, 1.0)];
    animation.duration = 1;
    animation.cumulative = YES;
    animation.repeatCount = INT_MAX;
    
    [hud.customView.layer addAnimation:animation forKey:@"animation"];
    
    // 1s后自动消失
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];

    
}

+(void)showFaildWithText:(NSString *)text icon:(NSString *)icon
{
    // 显示加载的图片
    MBProgressHUD *hud =   [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.labelText = text;
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    
    // 1s后自动消失
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];

}






@end
