//
//  WFTEmergencyCallViewController.m
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WFTEmergencyCallViewController.h"

@interface WFTEmergencyCallViewController ()

@end

@implementation WFTEmergencyCallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)willMakeEmergencyCall:(id)sender {
    
    UIAlertView *confirmCall = [[UIAlertView alloc] 
                                initWithTitle:@"Confirm Emergency Call" 
                                message:@"Call 911 now?" 
                                delegate:self
                                cancelButtonTitle:@"Cancel" 
                                otherButtonTitles:@"Yes", nil];
    [confirmCall show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex > 0)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://555"]];
    }
    
}

@end
