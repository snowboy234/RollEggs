//
//  Define.h
//  BallEatBall
//
//  Created by 田伟 on 2017/8/28.
//  Copyright © 2017年 田伟. All rights reserved.
//

#ifndef Define_h
#define Define_h

// MARK:- 屏幕高宽
#define TWScreenWidth [UIScreen mainScreen].bounds.size.width
#define TWScreenHeight [UIScreen mainScreen].bounds.size.height

#define One TWScreenWidth / 12.0
#define DangbanY TWScreenHeight - 100

// MARK:- 颜色
#define TWRandomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0]
#define TWColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define TWColorRGB(r,g,b) TWColorRGBA(r,g,b,1.0)
#define ViewControllerBgColor TWColorRGB(45, 47, 78)

// MARK:- 打印
#ifdef DEBUG
#define TWLog(format, ...) NSLog((@"[文件名:%s]" "[函数名:%s]" "[行号:%d]" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#define TWLogFunc TWLog(@"%s",__func__);
#else
#define TWLog(...)
#define TWLogFunc
#endif

#define MaxScore @"MaxScore"

#endif /* Define_h */
