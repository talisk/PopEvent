//
//  UIViewController+PopEvent.h
//  PopEventExample
//
//  Created by 孙恺 on 2016/12/4.
//  Copyright © 2016年 sunkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PopEvent) <UIGestureRecognizerDelegate>

- (void)addPopEventSelector:(SEL)selector viewController:(id)viewController;

@end
