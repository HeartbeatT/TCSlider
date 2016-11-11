//
//  SliderViewController.m
//  CollectionVIewHeadDemo
//
//  Created by Gamefire on 16/11/7.
//  Copyright © 2016年 Gamefire. All rights reserved.
//

#import "SliderViewController.h"
#import "CustomSlider.h"
@interface SliderViewController ()

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CustomSlider *slider = [[CustomSlider alloc] initWithFrame:CGRectMake(10, 100, 150, 100)];
    [slider setBackgroundColor:[UIColor redColor]];
    [slider setMinimumValue:100];
    [slider setMaximumValue:200];
    [slider setThumbImage:[UIImage imageNamed:@"1.jpg"]];
    [self.view addSubview:slider];
    
    [slider addTarget:self action:@selector(Click:)forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Click:(CustomSlider *)slider{
    
    NSLog(@"%f",slider.value);
    if (slider.touchState == UIControlEventTouchDown) {
        
//        NSLog(@"star");
    
    }else if (slider.touchState == UIControlEventValueChanged){
        
//        NSLog(@"change");
    
    }else if (slider.touchState == UIControlEventTouchUpInside){
        
//        NSLog(@"end");
    
    }


}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
