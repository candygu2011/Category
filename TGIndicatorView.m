//
//  TGIndicatorView.m
//  TuanChe
//
//  Created by 胡文波 on 14-7-30.
//  Copyright (c) 2014年 GML. All rights reserved.
//

#import "TGIndicatorView.h"

@implementation TGIndicatorView
static TGIndicatorView *_sharedIndicatorInstance = nil;
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

+ (TGIndicatorView *)sharedIndicatorViewInstance {
    
    

    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _sharedIndicatorInstance = [[TGIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _sharedIndicatorInstance.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        _sharedIndicatorInstance.layer.cornerRadius = 3;
        _sharedIndicatorInstance.center = CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width/2, 200);
        
    
        
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(3, 3, 40, 40)];
        
        if (kSystemVersion >= 7.0f) {
            indicator.tintColor = [UIColor whiteColor];
        }else{
            indicator.color = [UIColor whiteColor];
        }
        [indicator startAnimating];
        [_sharedIndicatorInstance addSubview:indicator];
    
        UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(43, 3, 105, 40)];
        tipLabel.backgroundColor = [UIColor clearColor];
        tipLabel.textColor = [UIColor whiteColor];
        tipLabel.font = [UIFont systemFontOfSize:13];
        tipLabel.text = @"正在努力加载...";
        [_sharedIndicatorInstance addSubview:tipLabel];
        
        
        
        
    });
    
    return _sharedIndicatorInstance;
    
}

-(void)showIndicator{
    [[UIApplication sharedApplication].keyWindow addSubview:_sharedIndicatorInstance];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)hiddenIndicator{
    [_sharedIndicatorInstance removeFromSuperview];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)failureIndicator{
    [_sharedIndicatorInstance removeFromSuperview];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [MBProgressHUD showFaildWithText:@"加载失败" icon:nil];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
