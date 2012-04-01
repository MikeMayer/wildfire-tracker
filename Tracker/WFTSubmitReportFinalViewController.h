//
//  WFTSubmitReportFinalViewController.h
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Twitter/Twitter.h>
#import <QuartzCore/QuartzCore.h>

@interface WFTSubmitReportFinalViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISwitch *switchTwitter;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (weak, nonatomic) IBOutlet UITextField *reportText;

- (IBAction)commentEditingDidEnd:(id)sender;
- (IBAction)willSubmitReport:(id)sender;
- (IBAction)willCancelSubmission:(id)sender;

@end
