//
//  PopEvent.h
//  PopEventExample
//
//  Created by 孙恺 on 2016/12/4.
//  Copyright © 2016年 sunkai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+PopEvent.h"

@interface PopEvent : NSObject

@property (nonatomic, copy, class) NSMutableSet<NSString *> *eventVCClassNameSet;

+ (void)restorePopGestureRecognizer;

@end
