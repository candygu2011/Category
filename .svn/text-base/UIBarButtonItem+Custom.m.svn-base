//
//  UIBarButtonItem+Custom.m
//  TuanChe
//
//  Created by aven wu on 14-7-20.
//  Copyright (c) 2014年 GML. All rights reserved.
//

#import "UIBarButtonItem+Custom.h"

@implementation UIBarButtonItem (Custom)

+(UIBarButtonItem *)barButtonItemWithBg:(NSString *)bg title:(NSString *)title size:(CGSize)size addTarget:(id)target action:(SEL)action
{
    // 3  customButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 3.1 按钮文字
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font  = [UIFont systemFontOfSize:15];
    // 3.2 按钮图片
//    [btn setBackgroundImage:[UIImage stretchImageWithName:@"ui_r23_c57.png"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage stretchImageWithName:@"ui_r23_c51.png"] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:bg] forState:UIControlStateNormal];
    
    
    // 3.3 按钮边框
    btn.bounds = (CGRect){CGPointZero,size};
    // 3.4 监听器
    [btn addTarget:target   action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 3 右边按钮
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

//+(UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon addTarget:(id)target action:(SEL)action
//{
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    CGSize btnSize = [btn setAllStateBg:icon];
//    btn.bounds = (CGRect) {CGPointZero,btnSize};
//    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    
//    // 返回自定义的把人buttonItem
//    return [[UIBarButtonItem alloc] initWithCustomView:btn];
//    
//}


@end
