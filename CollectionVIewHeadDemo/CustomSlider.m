//
//  CustomSlider.m
//  CollectionVIewHeadDemo
//
//  Created by Gamefire on 16/11/7.
//  Copyright © 2016年 Gamefire. All rights reserved.
//

#import "CustomSlider.h"
#import <objc/runtime.h>
@interface CustomSlider(){
    //slider滑过的背景
    UIImageView *rollingedImageView;
    //slider滑块
    UIImageView *thumbImageView;
    //未滑过的背景
    UIImageView *backgroundImageView;

}

//point
@property (nonatomic,assign,readonly)CGPoint point;

@end
@implementation CustomSlider

//滑块大小
const float thumpSize = 30;

- (instancetype)initWithFrame:(CGRect)frame{
    
    
    
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 30)];
    if (self) {
        
        [self initUI];
        
    }
    return self;
}

- (void)initUI{
    
    backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height/2.0 - 2.5, self.bounds.size.width , 5)];
    [backgroundImageView setBackgroundColor:[UIColor grayColor]];
    [backgroundImageView.layer setCornerRadius:3.0];
    [backgroundImageView.layer setMasksToBounds:YES];
    [self addSubview:backgroundImageView];
    
    rollingedImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/2.0 - 2.5, 20,5)];
    [rollingedImageView setBackgroundColor:[UIColor blueColor]];
    [rollingedImageView.layer setCornerRadius:3.0];
    [rollingedImageView.layer setMasksToBounds:YES];
    [self addSubview:rollingedImageView];
    
    thumbImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/2.0 - thumpSize/2.0, thumpSize, thumpSize)];
    [thumbImageView setBackgroundColor:[UIColor yellowColor]];
    [thumbImageView.layer setCornerRadius:thumpSize/2.0];
    [thumbImageView.layer setMasksToBounds:YES];
    [self addSubview:thumbImageView];
    
}
//跟踪开始触摸的状态
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    _point = [touch locationInView:self];
    [self fillForeGroundViewWithPoint:_point];
    _touchState = UIControlEventTouchDown;
    return YES;

}
//跟踪触摸过程的手势
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    _point = [touch locationInView:self];
    [self fillForeGroundViewWithPoint:_point];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    _touchState = UIControlEventValueChanged;
    return YES;

}

//结束跟踪状态
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{

    _touchState = UIControlEventTouchUpInside;

}

//手势状态停止的值
- (float)value{
    
    
    
    
    float width = self.bounds.size.width;
    if (_point.x < 0) {
        
        _point.x = 0;
        
    }
    if (_point.x > width){
        
        _point.x = width;
        
    }
    
    int  sumReturnValue;
    NSMutableArray *Array = [NSMutableArray array];
    [Array removeAllObjects];
    float sumValue = _maximumValue - _minimumValue;
    for (int i = _minimumValue; i <= _maximumValue; i++)
    {
        [Array addObject:[NSString stringWithFormat:@"%d",i]];
        
    }

    return sumReturnValue = (int)[[Array objectAtIndex:(int)_point.x/width * sumValue] integerValue];;

}

//滑块随着手势移动
- (void)fillForeGroundViewWithPoint:(CGPoint)point{
    
    CGPoint p = point;
    
    if (p.x <= thumbImageView.bounds.size.width) {
        
        p.x = thumbImageView.bounds.size.width;
        
    }else if (p.x > backgroundImageView.bounds.size.width){
    
        p.x = backgroundImageView.bounds.size.width;
    
    }
    
    [rollingedImageView setFrame:CGRectMake(0, self.bounds.size.height/2.0 - 2.5, p.x, 5)];
    [thumbImageView setFrame:CGRectMake(p.x - thumbImageView.bounds.size.width, self.bounds.size.height/2.0 - thumbImageView.bounds.size.height/2.0, thumpSize, thumpSize)];
}

//设置未滑过的背景图
- (void)SetUnRollingBackgroundImage:(UIImage *)backgroundImage    {
    
    UIImage *image = backgroundImage;
    [backgroundImageView setImage:image];

}

//设置滑过的背景图
- (void)SetRollingedBackgroundImage:(UIImage *)rollingedImage{
    
    UIImage *image = rollingedImage;
    [rollingedImageView setImage:image];
    
}

//设置未滑过的背景色
- (void)SetUnRollingBackGroundColor:(UIColor *)backgroundColor{

    [backgroundImageView setBackgroundColor:backgroundColor];

}

//设置滑过的背景色
- (void)SetRollingBackGroundColor:(UIColor *)backgroundColor{

    [rollingedImageView setBackgroundColor:backgroundColor];

}

//设置滑块的颜色
- (void)SetThumbBackground:(UIColor *)thumbColor{

    [thumbImageView setBackgroundColor:thumbColor];

}

- (void)setThumbImage:(UIImage *)thumbImage{
    
    if (_thumbImage == nil)
    {
        _thumbImage = thumbImage;
    }
    [thumbImageView setImage:_thumbImage];

}






@end
