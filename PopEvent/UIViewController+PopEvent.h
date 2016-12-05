//
//  UIViewController+PopEvent.h
//  PopEventExample
//
//  Created by 孙恺 on 2016/12/4.
//  Copyright © 2016年 sunkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PopEvent) <UIGestureRecognizerDelegate>

- (void)addPopEventSelectorString:(NSString *)selectorString viewControllerNamed:(NSString *)viewControllerName;

@end
