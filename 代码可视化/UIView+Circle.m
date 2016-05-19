//
//  UIView+Circle.m
//  代码可视化
//
//  Created by yinxiangfu on 16/2/25.
//  Copyright © 2016年 xiangfu. All rights reserved.
//

#import "UIView+Circle.h"

@implementation UIView (Circle)

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

@end
