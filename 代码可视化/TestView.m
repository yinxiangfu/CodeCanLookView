//
//  TestView.m
//  代码可视化
//
//  Created by yinxiangfu on 16/2/25.
//  Copyright © 2016年 xiangfu. All rights reserved.
//

#import "TestView.h"

@interface TestView ()
{
   
}
@property (nonatomic, strong) IBInspectable UIColor *firstColor;
@property (nonatomic, strong) IBInspectable UIColor *secondColor;
@property (nonatomic, strong) IBInspectable UIColor *thirdColor;
@property (nonatomic, copy)   IBInspectable NSString *string;
@end

IB_DESIGNABLE
@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _firstColor = [UIColor redColor];
        _secondColor = [UIColor purpleColor];
        _thirdColor = [UIColor blueColor];
        
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        lb.text = self.string;
        lb.textColor = self.firstColor;
        [self addSubview:lb];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    
    for (int i = 0; i < 3; i ++) {
        CGContextSetStrokeColorWithColor(context, i==0?_firstColor.CGColor:i==1?_secondColor.CGColor:_thirdColor.CGColor);
        CGFloat width = 100+i*100;
        CGContextStrokeEllipseInRect(context, CGRectMake(CGRectGetMidX(rect)-width/2,CGRectGetMidY(rect)-width/2, width, width));
        
    };
    
    [self.string drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName:self.firstColor}];
}
@end
