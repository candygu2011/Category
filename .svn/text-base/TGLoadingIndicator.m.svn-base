//
//  TGLoadingIndicator.m
//  TuanChe
//
//  Created by 胡文波 on 14-7-31.
//  Copyright (c) 2014年 GML. All rights reserved.
//

#import "TGLoadingIndicator.h"

#define Width 200
#define Height 50;

@implementation TGLoadingIndicator
{
    UIView *containerView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        containerView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:containerView];
        
        UIImageView *ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_刷新"]];
        ImageView.frame = CGRectMake(5, 5, 40, 40);
        CABasicAnimation *animation = [self rotation:0.5f degree:M_PI/2 direction:1 repeatCount:INT_MAX];
        
        [ImageView.layer addAnimation:animation forKey:@"key"];
        [containerView addSubview:ImageView];
        self.backgroundColor = containerView.backgroundColor = [UIColor clearColor];
        
        UIImageView *tuanImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_团车网logo"]];
        tuanImg.frame = CGRectMake(48, 5, 119, 40);
        [containerView addSubview:tuanImg];
    }
    return self;
}

-(void)awakeFromNib{
    containerView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:containerView];
    
    UIImageView *ImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_刷新"]];
    ImageView.frame = CGRectMake(5, 5, 40, 40);
    CABasicAnimation *animation = [self rotation:0.5f degree:M_PI/2 direction:1 repeatCount:INT_MAX];
    
    [ImageView.layer addAnimation:animation forKey:@"key"];
    [containerView addSubview:ImageView];
    self.backgroundColor = containerView.backgroundColor = [UIColor clearColor];
    
    UIImageView *tuanImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_团车网logo"]];
    tuanImg.frame = CGRectMake(48, 5, 119, 40);
    [containerView addSubview:tuanImg];

}

-(void)showView{

    
    self.hidden = NO;
    

}

-(void)hideView{
    self.hidden = YES;
}

-(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount

{
    
    CATransform3D rotationTransform  = CATransform3DMakeRotation(degree, 0, 0,direction);
    
    CABasicAnimation* animation;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    
    animation.duration= dur;
    
    animation.autoreverses= NO;
    
    animation.cumulative= YES;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.repeatCount= repeatCount;
    
    animation.delegate= self;
    
    
    
    return animation;
    
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
