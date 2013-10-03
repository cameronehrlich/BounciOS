//
//  BounciOSViewController.m
//  BounciOS
//
//  Created by Class Account on 10/2/13.
//  Copyright (c) 2013 UC:Berkeley. All rights reserved.
//

#import "BounciOSViewController.h"
#import "BounciOSView.h"

@implementation BounciOSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _ourModel = [[BouncyModel alloc] initWithBounds:self.ourView.bounds];
    
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

-(CGRect)askModelForBallBounds:(NSInteger) whichBall;
{
    return [_ourModel ballBounds:whichBall];
}

-(BOOL)askModelForWrapping
{
    return [_ourModel wrapping];
}


-(IBAction)wrapCheckBoxPressed:(UISwitch*)sender
{
    [_ourModel wrapping:sender.on];
}

// Must change the slider min and max in interface builder to range 1 - 10
// Action must use "value changed"
-(IBAction)ballsSliderMoved:(UISlider*)sender
{
    NSInteger numBalls = sender.value;
    [_ourModel changeNumberOfBalls:numBalls];
}

// Must change the slider min and max in interface builder to range 30 - 130
-(IBAction)speedSliderMoved:(UISlider*)sender
{
    [_timer invalidate];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/sender.value)
                                              target:self
                                            selector:@selector(timerFireMethod:)
                                            userInfo:nil
                                             repeats:YES];
}

-(IBAction)startStopButtonPressed:(UIButton*)sender
{
    _running = !_running;
    if (_running) {
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    }
}


-(void)timerFireMethod:(NSTimer*)theTimer
{
    if (_running)
    {
        [_ourModel handleCollisions];
        [_ourModel updateBallPositions];
        [_ourView setNeedsDisplay];
    }
}


-(tColor*)askModelForBallColor:(NSInteger) whichBall
{
    return [_ourModel ballColor:whichBall];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
