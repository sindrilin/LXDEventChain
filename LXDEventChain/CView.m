//
//  CView.m
//  LXDEventChain
//
//  Created by 滕雪 on 15/12/26.
//  Copyright © 2015年 滕雪. All rights reserved.
//

#import "CView.h"

@implementation CView

- (UIView *)hitTest: (CGPoint)point withEvent: (UIEvent *)event
{
    NSLog(@"%@", self.gestureRecognizers);
    return [super hitTest: point withEvent: event];
}


@end
