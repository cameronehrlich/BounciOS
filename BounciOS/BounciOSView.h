//
//  BounciOSView.h
//  Bouncy
//
//  Created by Class Account on 10/2/13.
//  Copyright (c) 2013 UC:Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BounciOSViewController;

@interface BounciOSView : UIView

@property (strong, nonatomic) IBOutlet BounciOSViewController* ourViewController;

-(void)drawRect:(CGRect)rect;

@end
