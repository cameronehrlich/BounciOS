//
//  BounciOSView.m
//  Bouncy
//
//  Created by Class Account on 10/2/13.
//  Copyright (c) 2013 UC:Berkeley. All rights reserved.
//

#import "BounciOSView.h"
#import "BounciOSViewController.h"

@implementation BounciOSView

- (void)drawRect:(CGRect)dirtyRect
{
    NSInteger numberOfBalls = [_ourViewController askModelForNumberOfBalls];
    
    [[UIColor blackColor] setStroke];
    
    if ( [_ourViewController askModelForWrapping] == NO )
    {
        UIBezierPath* framePath = [UIBezierPath bezierPathWithRect: [self bounds]];
        
        [framePath stroke];
    }
    
    for ( NSInteger ballIndex = 0; ballIndex < numberOfBalls; ballIndex++ )
    {
        CGRect ballBounds = [_ourViewController askModelForBallBounds:ballIndex];
        
        UIBezierPath* circlePath = [UIBezierPath bezierPathWithOvalInRect: ballBounds];
        [circlePath setLineWidth:(CGFloat)4.0];
        
        // Set new fill color
        tColor *ballColor = [_ourViewController askModelForBallColor:ballIndex];
        [ballColor setFill];
        
        [circlePath fill];
        
        [circlePath stroke];
    }
}


@end
