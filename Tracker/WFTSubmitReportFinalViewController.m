//
//  WFTSubmitReportFinalViewController.m
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WFTSubmitReportFinalViewController.h"

@interface WFTSubmitReportFinalViewController ()

@end

@implementation WFTSubmitReportFinalViewController
@synthesize mapView;
@synthesize switchTwitter;
@synthesize navigationItem;

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
    [navigationItem setHidesBackButton:NO];
    

}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setSwitchTwitter:nil];
    [self setNavigationItem:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)commentEditingDidEnd:(id)sender {
}
- (IBAction)willSubmitReport:(id)sender {
}
@end
