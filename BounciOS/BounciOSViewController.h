//
//  BounciOSViewController.h
//  BounciOS
//
//  Created by Class Account on 10/2/13.
//  Copyright (c) 2013 UC:Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BouncyModel.h"
#import "BounciOSView.h"

@interface BounciOSViewController : UIViewController
{
@private
    BounciOSView *_ourView;
    BouncyModel* _ourModel;
    NSTimer* _timer;
    BOOL _running;
}

@property (strong, nonatomic) IBOutlet BounciOSView *ourView;

-(NSInteger)askModelForNumberOfBalls;
-(CGRect)askModelForBallBounds:(NSInteger) whichBall;
-(IBAction)ballsSliderMoved:(UISlider*)sender;
-(IBAction)speedSliderMoved:(UISlider*)sender;
-(IBAction)startStopButtonPressed:(UIButton*)sender;
-(IBAction)wrapCheckBoxPressed:(UISwitch*)sender;
-(BOOL)askModelForWrapping;
@end