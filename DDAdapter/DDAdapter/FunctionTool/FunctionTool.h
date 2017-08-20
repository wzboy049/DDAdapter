//
//  FunctionTool.h
//  xiaomuxueche
//
//  Created by 王志滨 on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>



/** 随机色 */
#define DDRandomColor DDColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#pragma mark - 调试替代宏
//--------------------------------------------------

#ifdef DEBUG
#define DDLog(...)  NSLog(__VA_ARGS__)

#else

#define DDLog(...)
#endif   //__DEBUG DDLog

#ifdef DEBUG
//方法打印的宏
#define FuncLog NSLog(@"____________________________________________\n\n函数名:%s,代码在%d行\n",__func__ , __LINE__);\
printf("\n代码路径:%s\n________________________________________________________________________________________\n", __FILE__);
#else
#define FuncLog

#endif   //__DEBUG FuncLog


// 弱引用
#define Weak_Self __weak typeof(self) weakSelf = self



#pragma - mark ____________适配___________

static CGFloat kIP4HRate = (CGFloat)(480.0/667.0);
static CGFloat kIP4WRate = (CGFloat)(320.0/375.0);
static CGFloat kIP5HRate = (CGFloat)(568.0/667.0);
static CGFloat kIP5WRate = (CGFloat)(320.0/375.0);
static CGFloat kIP6PHRate = (CGFloat)(736.0/667.0);
static CGFloat kIP6PWRate = (CGFloat)(414.0/375.0);

static CGFloat kNaviBarMaxY = 64.0;
static CGFloat kNaviBarHeight = 44.0;
static CGFloat kTabBarHeight = 49.0;
static CGFloat kStatusBarHeight = 20.0;

BOOL isIPhone4();

BOOL isIPhone5();

BOOL isIPhone6();

BOOL isIPhone6p();


CGFloat dwidth(CGFloat ip6W);

CGFloat dheight(CGFloat ip6H);

CGFloat circleWH(CGFloat circleWidthHeight);

//UIFont * getUIFont(float);

UIWindow *kKeyWindow();


CGFloat kScreenWidth();

CGFloat kScreenHeight();

CGSize kScreenSize();

CGRect kScreenBounds();



