//
//  FunctionTool.m
//  xiaomuxueche
//
//  Created by 王志滨 on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "FunctionTool.h"



BOOL isIPhone4(){
    return (([UIScreen mainScreen].bounds.size.width == 320) && ([UIScreen mainScreen].bounds.size.height == 480)) || (([UIScreen mainScreen].bounds.size.width == 480) && ([UIScreen mainScreen].bounds.size.height == 320));
}

BOOL isIPhone5(){
    return (([UIScreen mainScreen].bounds.size.width == 320) && ([UIScreen mainScreen].bounds.size.height == 568)) || (([UIScreen mainScreen].bounds.size.width == 568) && ([UIScreen mainScreen].bounds.size.height == 320));
}

BOOL isIPhone6(){
    return (([UIScreen mainScreen].bounds.size.width == 375) && ([UIScreen mainScreen].bounds.size.height == 667)) || (([UIScreen mainScreen].bounds.size.width == 667) && ([UIScreen mainScreen].bounds.size.height == 375));
}

BOOL isIPhone6p(){
    return (([UIScreen mainScreen].bounds.size.width == 414) && ([UIScreen mainScreen].bounds.size.height == 736)) || (([UIScreen mainScreen].bounds.size.width == 736) && ([UIScreen mainScreen].bounds.size.height == 414));
}

float fileSizeAtPath(NSString *path){
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}





CGFloat dwidth(CGFloat ip6W)
{
    if (isIPhone4()) {
        return ip6W *kIP4WRate;
    }else if(isIPhone5()){
        return ip6W *kIP5WRate;
    }else if(isIPhone6p()){
        return ip6W *kIP6PWRate;
    }else{
        return ip6W;
    }
}


CGFloat dheight(CGFloat ip6H)
{
    if (isIPhone4()) {
        return ip6H *kIP4HRate;
    }else if(isIPhone5()){
        return ip6H *kIP5HRate;
    }else if(isIPhone6p()){
        return ip6H *kIP6PHRate;
    }else{
        return ip6H;
    }
}



CGFloat circleWH(CGFloat ip6W)
{
    if (isIPhone4()) {
        return ip6W *kIP4HRate;
    }else if(isIPhone5()){
        return ip6W *kIP5WRate;
    }else if(isIPhone6p()){
        return ip6W *kIP6PWRate;
    }else{
        return ip6W;
    }
}

//UIFont * getUIFont(float size){
//    
//    if (isIPhone4()) {
//        return [UIFont systemFontOfSize:size*0.85];
//    }
//    
//    if (isIPhone5()) {
//        return [UIFont systemFontOfSize:size * 0.85];
//    }
//    if (isIPhone6()) {
//        return [UIFont systemFontOfSize:size];
//    }
//    
//    if (isIPhone6p()) {
//        return [UIFont systemFontOfSize:size * 1.1];
//    }
//    return nil;
//}

UIWindow *kKeyWindow(){
    return [UIApplication sharedApplication].keyWindow;
}

#pragma mark - _____________判断系统版本_____________
/** 返回 系统版本号是否大于指定的值 */
BOOL versionHigherThan_dd(float iOSVersion) {
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= iOSVersion;
}

/** 系统版本号 float值 */
CGFloat systemVersionFloatValue_dd(){
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}


CGFloat kScreenWidth(){
    return [UIScreen mainScreen].bounds.size.width;
}

CGFloat kScreenHeight(){
    return [UIScreen mainScreen].bounds.size.height;
}

CGSize kScreenSize(){
    return [UIScreen mainScreen].bounds.size;
}

CGRect kScreenBounds(){
    return [UIScreen mainScreen].bounds;
}





