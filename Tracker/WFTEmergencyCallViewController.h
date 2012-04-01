//
//  WFTEmergencyCallViewController.h
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFTEmergencyCallViewController : UIViewController<UIAlertViewDelegate>

- (IBAction)willMakeEmergencyCall:(id)sender;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
