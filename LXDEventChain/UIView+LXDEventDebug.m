//
//  UIView+LXDEventDebug.m
//  LXDEventChain
//
//  Created by 滕雪 on 15/12/26.
//  Copyright © 2015年 滕雪. All rights reserved.
//

#import "UIView+LXDEventDebug.h"
#import <objc/runtime.h>

@implementation UIView (LXDEventDebug)

+ (void)load
{
    Method origin = class_getInstanceMethod([self class], @selector(pointInside:withEvent:));
    Method custom = class_getInstanceMethod([self class], @selector(lxd_pointInside:withEvent:));
    method_exchangeImplementations(origin, custom);
    
    origin = class_getInstanceMethod([self class], @selector(hitTest:withEvent:));
    custom = class_getInstanceMethod([self class], @selector(lxd_hitTest:withEvent:));
    method_exchangeImplementations(origin, custom);
    
    origin = class_getInstanceMethod([UIView class], @selector(touchesBegan:withEvent:));
    custom = class_getInstanceMethod([UIView class], @selector(lxd_touchesBegan:withEvent:));
    method_exchangeImplementations(origin, custom);
    
    origin = class_getInstanceMethod([UIView class], @selector(touchesMoved:withEvent:));
    custom = class_getInstanceMethod([UIView class], @selector(lxd_touchesMoved:withEvent:));
    method_exchangeImplementations(origin, custom);
    
    origin = class_getInstanceMethod([UIView class], @selector(touchesEnded:withEvent:));
    custom = class_getInstanceMethod([UIView class], @selector(lxd_touchesEnded:withEvent:));
    method_exchangeImplementations(origin, custom);
}

- (BOOL)lxd_pointInside: (CGPoint)point withEvent: (UIEvent *)event
{
    BOOL canAnswer = [self lxd_pointInside: point withEvent: event];
//    NSLog(@"%@ can answer %d", self.class, canAnswer);
    return canAnswer;
}

- (UIView *)lxd_hitTest: (CGPoint)point withEvent: (UIEvent *)event
{
    UIView * answerView = [self lxd_hitTest: point withEvent: event];
//    NSLog(@"hit view: %@", self.class);
    return answerView;
}

- (void)lxd_touchesBegan: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
{
    NSLog(@"%@ --- begin, %p --- %p", self.class, touches, event.allTouches);
    [self lxd_touchesBegan: touches withEvent: event];
}

- (void)lxd_touchesMoved: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
{
    NSLog(@"%@ --- move, %p --- %p", self.class, touches, event.allTouches);
    [self lxd_touchesMoved: touches withEvent: event];
}

- (void)lxd_touchesEnded: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
{
    NSLog(@"%@ --- end, %p --- %p", self.class, touches, event.allTouches);
    [self lxd_touchesEnded: touches withEvent: event];
}


@end


@implementation UIViewController (LXDEventDebug)

- (void)lxd_touchesBegan: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
{
//    [self lxd_touchesBegan: touches withEvent: event];
}

- (void)lxd_touchesMoved: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
{
//    [self lxd_touchesMoved: touches withEvent: event];
}

- (void)lxd_touchesEnded: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
{
//    [self lxd_touchesEnded: touches withEvent: event];
}


@end
