//
//  CircleView.m
//  LXDEventChain
//
//  Created by 滕雪 on 15/12/27.
//  Copyright © 2015年 滕雪. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        self.layer.cornerRadius = 100;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle: nil message: @"点击圆形视图" delegate: nil cancelButtonTitle: @"确认" otherButtonTitles: nil];
    [alert show];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
//    const CGFloat halfWidth = 100;
//    CGFloat xOffset = point.x - 100;
//    CGFloat yOffset = point.y - 100;
//    CGFloat radius = sqrt(xOffset * xOffset + yOffset * yOffset);
//    return radius <= halfWidth;
    
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 200, 200)];
    return [path containsPoint: point];
}


@end
