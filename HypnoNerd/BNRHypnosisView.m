//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Anthony Fennell on 8/24/14.
//  Copyright (c) 2014 Anthony Fennell. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end


@implementation BNRHypnosisView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = self.bounds.origin.x + self.bounds.size.width / 2.0;
    center.y = self.bounds.origin.y + self.bounds.size.height / 2.0;
    
    // The circle will be the largest that will fit in the view
    float maxradius = hypot(self.bounds.size.width, self.bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxradius; currentRadius > 0; currentRadius -=20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0
                      endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
    
    //float pointX = (center.x - center.x / 2.0);
    //float pointY = (center.y - center.y / 2.0);
    
    //UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    //[logoImage drawInRect:CGRectMake(pointX, pointY, center.x, center.y)];
}

// When a finger touches the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ was touched", self);
    
    // Get 3 random numbers from 0 and 1
    float red = (arc4random() %100) / 100.0;
    float green = (arc4random() %100) / 100.0;
    float blue = (arc4random() %100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green
                                            blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
