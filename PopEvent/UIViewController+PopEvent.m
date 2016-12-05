//
//  UIViewController+PopEvent.m
//  PopEventExample
//
//  Created by 孙恺 on 2016/12/4.
//  Copyright © 2016年 sunkai. All rights reserved.
//

#import "UIViewController+PopEvent.h"
#import "UIGestureRecognizer+PopEvent.h"
#import "PopEvent.h"

@implementation UIViewController (PopEvent)

- (void)viewDidLoadForPopEvent {
    [self viewDidLoadForPopEvent];
    
//    NSLog(@"viewDidLoadForPopEvent");
    
    if (!self.navigationController) {
        return;
    }
    
    id <UIGestureRecognizerDelegate> animationDelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    
    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:animationDelegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    [edgePanGestureRecognizer setDelegate:self];
    [edgePanGestureRecognizer setEdges:UIRectEdgeLeft];
    
    [self.view addGestureRecognizer:edgePanGestureRecognizer];
    
    [self.navigationController.interactivePopGestureRecognizer setEnabled:NO];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (!self.navigationController) {
        return NO;
    }
    
    if (self.navigationController.childViewControllers.count == 1) {
        return NO;
    }
    
    if ([PopEvent.eventVCClassNameSet containsObject:NSStringFromClass(self.navigationController.topViewController.class)]) {
        return NO;
    }
    
    return YES;
}

- (void)addPopEventSelectorString:(NSString *)selectorString viewControllerNamed:(NSString *)viewControllerName {
    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:NSSelectorFromString(@"edgePanGRdidRecognizeWithPopEventSelectorString:")];
    [edgePanGestureRecognizer setSelectorString:selectorString];
    [self.navigationController.interactivePopGestureRecognizer setEnabled:NO];
    [edgePanGestureRecognizer setEdges:UIRectEdgeLeft];
    [self.view addGestureRecognizer:edgePanGestureRecognizer];
}

- (void)edgePanGRdidRecognizeWithPopEventSelectorString:(UIScreenEdgePanGestureRecognizer *)sender {
    
    if (sender.state != UIGestureRecognizerStateEnded) {
        return;
    }
    
    if (!sender.selectorString.length) {
        return;
    }
    
    [self performSelectorOnMainThread:NSSelectorFromString(sender.selectorString) withObject:nil waitUntilDone:NO];
}

@end
