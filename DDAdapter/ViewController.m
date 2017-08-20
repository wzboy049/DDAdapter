//
//  ViewController.m
//  DDAdapter
//
//  Created by 王志斌 on 2017/8/20.
//  Copyright © 2017年 王志斌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //经过验证 可以解决 按钮的 字体适配 和约束适配问题
    //1.用  UIView (ConstraintAdapter) 实现约束适配
    //2. UIFont+fontAdapter 实现字体适配
    
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"点击一下" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints=NO;
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:17]; //这个17会被动态更改大小
    NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[button]-40-|"options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[button(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    [self.view addConstraints:constraints1]; //UIView的 addConstraints 内部会调用 addConstraint: 方法 so 我认为 swizzling 掉 addConstraint 就能动态改变 (试了试可以) 所有约束 constant 不为0的都会被动态更改大小
    [self.view addConstraints:constraints2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
