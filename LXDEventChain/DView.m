//
//  DView.m
//  LXDEventChain
//
//  Created by 滕雪 on 15/12/26.
//  Copyright © 2015年 滕雪. All rights reserved.
//

#import "DView.h"

@implementation DView

- (instancetype)initWithCoder: (NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIResponder * next = [self nextResponder];
    NSMutableString * prefix = @"".mutableCopy;
    
    while (next != nil) {
        NSLog(@"%@%@", prefix, [next class]);
        [prefix appendString: @"--"];
        next = [next nextResponder];
    }
}


@end
