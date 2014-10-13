//
//  UITextField+shake.m
//  TuanChe
//
//  Created by aven wu on 14-7-11.
//  Copyright (c) 2014年 GML. All rights reserved.
//

#import "UITextField+shake.h"
#import <QuartzCore/QuartzCore.h>


//TextField的晃动:Begin
@implementation UITextField(shake)

- (void)shake
{
    CAKeyframeAnimation *animationKey = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animationKey setDuration:0.5f];
    
    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      nil];
    [animationKey setValues:array];
    
    NSArray *times = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithFloat:0.1f],
                      [NSNumber numberWithFloat:0.2f],
                      [NSNumber numberWithFloat:0.3f],
                      [NSNumber numberWithFloat:0.4f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.6f],
                      [NSNumber numberWithFloat:0.7f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:0.9f],
                      [NSNumber numberWithFloat:1.0f],
                      nil];
    [animationKey setKeyTimes:times];
    
    [self.layer addAnimation:animationKey forKey:@"TextFieldShake"];
}

// 判断输入是否是以1开头的
-(BOOL)isMatch
{
    // 正则表达式 1开头的11位数字
    // ^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    // ^1\\d{10}$
    // ^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$
    NSString *regex = @"^1\\d{10}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([self.text length] == 11 && [pred evaluateWithObject:self.text]) {
        return YES;
    }
    
    return NO;
    
}

-(BOOL)validatePassword
{
    // ^[a-zA-Z0-9]{6,}+$
    NSString *regex = @"^[a-zA-Z0-9]{6,}+$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([pred evaluateWithObject:self.text]) {
        return YES;
        
    }
    return NO;
}


//利用正则表达式验证
-(BOOL)isValidateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self.text];
}


@end
//TextField的晃动:End
