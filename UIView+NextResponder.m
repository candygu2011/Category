//
//  UIView+NextResponder.m
//  TuanChe
//
//  Created by gml on 14-8-15.
//  Copyright (c) 2014年 GML. All rights reserved.
//

#import "UIView+NextResponder.h"

@implementation UIView (NextResponder)

-(UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
    }
    
    return nil;
}

@end
