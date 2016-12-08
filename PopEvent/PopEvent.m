//
//  PopEvent.m
//  PopEventExample
//
//  Created by 孙恺 on 2016/12/4.
//  Copyright © 2016年 sunkai. All rights reserved.
//

#import "PopEvent.h"
#import <objc/runtime.h>

@implementation PopEvent

static NSMutableSet<NSString *> *set = nil;

+ (NSMutableSet<NSString *> *)eventVCClassNameSet {
    return set;
}

+ (void)setEventVCClassNameSet:(NSMutableSet<NSString *> *)eventVCClassNameSet {
    set = eventVCClassNameSet;
}

+ (void)restorePopGestureRecognizer {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class uivcClass = [UIViewController class];
        
        SEL vdlSelector = @selector(viewDidLoad);
        SEL vdlForPopEvent = NSSelectorFromString(@"viewDidLoadForPopEvent");
        
        Method vdlMethod = class_getInstanceMethod(uivcClass, vdlSelector);
        Method vdlForPopEventMethod = class_getInstanceMethod(uivcClass, vdlForPopEvent);
        
        BOOL didAddMethod =
        class_addMethod(uivcClass,
                        vdlSelector,
                        method_getImplementation(vdlForPopEventMethod),
                        method_getTypeEncoding(vdlForPopEventMethod));
        
        if (didAddMethod) {
            class_replaceMethod(uivcClass,
                                vdlForPopEvent,
                                method_getImplementation(vdlMethod),
                                method_getTypeEncoding(vdlMethod));
        } else {
            method_exchangeImplementations(vdlMethod, vdlForPopEventMethod);
        }
    });
}

@end
