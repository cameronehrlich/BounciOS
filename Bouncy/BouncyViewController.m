//
//  BouncyViewController.m
//  Bouncy
//
//  Created by Glenn Sugden on 2011.08.02.
//  Copyright 2011 UC:Berkeley. All rights reserved.
//

#import "BouncyViewController.h"

@implementation BouncyViewController

-(void)awakeFromNib
{
    _ourModel = [[BouncyModel alloc] initWithBounds:[_ourView bounds]];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/30.0)
                                              target:self
                                            selector:@selector(timerFireMethod:)
                                            userInfo:nil
                                             repeats:YES];
    
    [_ourModel createAndAddNewBall];
    
    _running = YES;
}

-(NSInteger)askModelForNumberOfBalls
{
    return [_ourModel numberOfBalls];
}

-(CGRect)askModelForBallBounds:(NSInteger) whichBall
{
    return [_ourModel ballBounds:whichBall];
}

-(BOOL)askModelForWrapping
{
    return [_ourModel wrapping];
}

-(IBAction)wrapCheckBoxPressed:(NSButton*)sender
{
    [_ourModel wrapping:[sender state]];
}

// Must change the slider min and max in interface builder to range 1 - 10
// Action must use "value changed"
-(IBAction)ballsSliderMoved:(NSSlider*)sender
{
    NSInteger numBalls = [sender intValue];
    [_ourModel changeNumberOfBalls:numBalls];
}

// Must change the slider min and max in interface builder to range 30 - 130
// Action must use "value changed"
-(IBAction)speedSliderMoved:(NSSlider*)sender
{
    [_timer invalidate];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/[sender doubleValue])
                                              target:self
                                            selector:@selector(timerFireMethod:)
                                            userInfo:nil
                                             repeats:YES];
}

-(IBAction)startStopButtonPressed:(NSButton*)sender
{
    _running = !_running;
    
    if (_running)
    {
        [sender setTitle:@"Stop"];
    }
    else
    {
        [sender setTitle:@"Start"];
    }
}

-(void)timerFireMethod:(NSTimer*)theTimer
{
    if (_running)
    {
        [_ourModel handleCollisions];
        [_ourModel updateBallPositions];
        [_ourView setNeedsDisplay:YES];
    }
}
@end
