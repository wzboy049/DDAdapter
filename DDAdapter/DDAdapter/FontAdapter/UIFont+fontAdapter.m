//
//  UIFont+fontAdapter.m
//  tryBtnXib
//
//  Created by 王志斌 on 2017/8/14.
//  Copyright © 2017年 王志斌. All rights reserved.
//



#import <objc/message.h>

#import "FunctionTool.h"

@implementation UIFont (fontAdapter)

+ (void)load {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
    
        Method mOriginal = class_getClassMethod(NSClassFromString(@"UIFont"), @selector(systemFontOfSize:));
        
        Method mMine = class_getClassMethod(NSClassFromString(@"UIFont"), @selector(m_systemFontOfSize:));
        
        method_exchangeImplementations(mOriginal, mMine);
        
        
        
        
        Method mbOriginal = class_getClassMethod(NSClassFromString(@"UIFont"), @selector(boldSystemFontOfSize:));
    
        Method mbMine = class_getClassMethod(NSClassFromString(@"UIFont"), @selector(m_boldSystemFontOfSize:));
        
        method_exchangeImplementations(mbOriginal, mbMine);
    
    });
}

+ (void)m_systemFontOfSize:(CGFloat)fontSize{
    
    DDLog(@"fontSize = %lf ",fontSize);
    DDLog(@"new_fontSize = %lf ",dheight(fontSize));
    [self m_systemFontOfSize:dheight(fontSize)];
    
}

+ (void)m_boldSystemFontOfSize:(CGFloat)fontSize{
    
    [self m_boldSystemFontOfSize:dheight(fontSize)];
}

@end
