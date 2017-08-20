//
//  UIView+ConstraintAdapter.m
//  DDAdapter
//
//  Created by 王志斌 on 2017/8/20.
//  Copyright © 2017年 王志斌. All rights reserved.
//

#import "FunctionTool.h"
#import <objc/message.h>

@implementation UIView (ConstraintAdapter)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method mOriginal = class_getInstanceMethod(NSClassFromString(@"UIView"), @selector(addConstraint:));
        
        Method mMine = class_getInstanceMethod(NSClassFromString(@"UIView"), @selector(m_addConstraint:));
        
        method_exchangeImplementations(mOriginal, mMine);
        
    });
}


- (void)m_addConstraint:(NSLayoutConstraint *)cons {
    
    if (cons.constant == 0) {
        [self m_addConstraint:cons];
        return;
    }
    
    NSLayoutAttribute att1 = cons.firstAttribute;
    
        DDLog(@"改之前constant = %lf",cons.constant);
    
    if ( att1 == NSLayoutAttributeLeft
        || att1 == NSLayoutAttributeRight
        || att1 == NSLayoutAttributeLeading
        || att1 == NSLayoutAttributeTrailing
        || att1 == NSLayoutAttributeLeadingMargin
        || att1 == NSLayoutAttributeTrailingMargin
        || att1 == NSLayoutAttributeLeftMargin
        || att1 == NSLayoutAttributeRightMargin
        || att1 == NSLayoutAttributeWidth
        || att1 == NSLayoutAttributeCenterX
        ) {
        if (isIPhone4()) {
            cons.constant *= kIP4WRate;
        }else if (isIPhone5()){
            cons.constant *= kIP5WRate;
        }else if (isIPhone6p()){
            cons.constant *= kIP6PWRate;
        }else if (isIPhone6()){
            //以6为基准 啥也不用改
        }else {
            //如果有pad 再来一波判断
        }
        
    }
    
    if (att1 == NSLayoutAttributeTop
        || att1 == NSLayoutAttributeBottom
        || att1 == NSLayoutAttributeTopMargin
        || att1 == NSLayoutAttributeBottomMargin
        || att1 == NSLayoutAttributeHeight
        || att1 == NSLayoutAttributeCenterY) {
        
        if (isIPhone4()) {
            cons.constant *= kIP4HRate;
        }else if (isIPhone5()){
            cons.constant *= kIP5HRate;
        }else if (isIPhone6p()){
            cons.constant *= kIP6PHRate;
        }else if (isIPhone6()){
            //以6为基准 啥也不用改
        }else {
            //如果有pad 再来一波判断
        }
        
    }
    
        DDLog(@"改之后constant = %lf",cons.constant);
    [self m_addConstraint:cons];
    
}


@end
