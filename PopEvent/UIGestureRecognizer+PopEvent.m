//
//  UIGestureRecognizer+PopEvent.m
//  PopEventExample
//
//  Created by 孙恺 on 2016/12/4.
//  Copyright © 2016年 sunkai. All rights reserved.
//

#import "UIGestureRecognizer+PopEvent.h"
#import <objc/runtime.h>

static const void *SelectorKey = &SelectorKey;

@implementation UIGestureRecognizer (PopEvent)

- (void)setSelectorString:(NSString *)selectorString {
    objc_setAssociatedObject(self, SelectorKey, selectorString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)selectorString {
    return objc_getAssociatedObject(self, SelectorKey);
}

@end
