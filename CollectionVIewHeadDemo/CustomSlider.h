//
//  CustomSlider.h
//  CollectionVIewHeadDemo
//
//  Created by Gamefire on 16/11/7.
//  Copyright © 2016年 Gamefire. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomSlider : UIControl

//默认由0开始,滑块滚动时的值
@property (nonatomic,assign)float value;
/*当不设置最小值时候默认为0*/
//传入的最大值
@property (nonatomic,assign)float maximumValue;
//传人的最小值
@property (nonatomic,assign)float minimumValue;
//设置滑块的图片
@property (nonatomic,strong)UIImage *thumbImage;



//点击状态
@property (nonatomic,assign, readonly)NSUInteger touchState;/*
                                                        UIControlEventTouchDown 开始点击时候的状态
                                                        UIControlEventValueChanged 滑动过程中的点击状态
                                                        UIControlEventTouchUpInside 结束滑动或者点击完成后的状态
                                                   */
//设置为滑过的背景图
- (void)SetUnRollingBackgroundImage:(UIImage *)backgroundImage;
//设置滑过的背景图
- (void)SetRollingedBackgroundImage:(UIImage *)rollingedImage;




@end
