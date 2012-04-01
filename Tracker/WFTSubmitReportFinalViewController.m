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
@synthesize reportText;

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
    
    [self.reportText  becomeFirstResponder];

    
    if (![TWTweetComposeViewController canSendTweet])
        switchTwitter.enabled = NO;
    
    //corner radius
    self.mapView.layer.cornerRadius = 4.0;
    
    [self.mapView.userLocation addObserver:self  
                                forKeyPath:@"location"  
                                   options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)  
                                   context:NULL];

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context 
{       
    MKCoordinateRegion region;
    region.center = self.mapView.userLocation.coordinate;  
    
    MKCoordinateSpan span; 
    span.latitudeDelta  = 0.025; 
    span.longitudeDelta = 0.025; 
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setSwitchTwitter:nil];
    [self setNavigationItem:nil];
    [self setReportText:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)commentEditingDidEnd:(id)sender {
}
- (IBAction)willCancelSubmission:(id)sender
{
    [self performSegueWithIdentifier:@"returnToTabController" sender:nil];

    [[self navigationController] setNavigationBarHidden:YES animated:YES];

}

- (IBAction)willSubmitReport:(id)sender {
    
    if (switchTwitter.isOn)
    {
        TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc] init];

        
        if (!self.reportText.hasText)
            [twitter setInitialText:@"I'm submitting a #wildfire"];
        else
            [twitter setInitialText:self.reportText.text];
        
        [self presentModalViewController:twitter animated:YES];
        
        twitter.completionHandler = ^(TWTweetComposeViewControllerResult result) 
        {        
            if (result == TWTweetComposeViewControllerResultCancelled)
            {
                NSLog(@"Tweet compostion was canceled.");
            }
            else if (result == TWTweetComposeViewControllerResultDone)
                NSLog(@"Tweet composition completed.");
            
            // Dismiss the controller
            [self dismissModalViewControllerAnimated:YES];
            [self performSegueWithIdentifier:@"returnToTabController" sender:nil];

        };
    }
    else {

        UIAlertView *view = [[UIAlertView alloc] 
                             initWithTitle:@"Report Submitted" 
                             message:@"Thank you for submitting your report" 
                             delegate:nil 
                             cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [view show];
        
        [self performSegueWithIdentifier:@"returnToTabController" sender:nil];

        [self dismissModalViewControllerAnimated:YES];

    }    
}
@end
