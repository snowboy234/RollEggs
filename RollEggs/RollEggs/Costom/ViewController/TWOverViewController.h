//
//  TWOverViewController.h
//  RollEggs
//
//  Created by 田伟 on 2017/8/30.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^restarSingal)();
@interface TWOverViewController : UIViewController
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, copy) restarSingal block;
@end
