//
//  WFTReportViewController.h
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Twitter/Twitter.h>
#import "WFTLocate.h"

@interface WFTReportViewController : UIViewController <CLLocationManagerDelegate, UIImagePickerControllerDelegate> 
{
    CLLocationManager *locationManager;
    CLGeocoder *geoCoder;
}

//Properties
@property (weak, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geoCoder;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (strong, nonatomic) CLHeading *currentHeading;

//Interface Builder Properties
@property (weak, nonatomic) IBOutlet UIButton *findLocationButton;
@property (weak, nonatomic) IBOutlet UILabel *currentLocationLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fireMagnitudeSegmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *estimatedDistanceSlider;
@property (weak, nonatomic) IBOutlet UIButton *takePictureButton;
@property (weak, nonatomic) IBOutlet UILabel *estimatedDistanceSliderLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) IBOutlet UIImageView *imageOne;
@property (strong, nonatomic) IBOutlet UIImageView *imageTwo;
@property (strong, nonatomic) IBOutlet UIImageView *imageThree;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;

//methods
- (IBAction)findCurrentLocation:(id)sender;
- (IBAction)takePicture:(id)sender;
- (IBAction)distanceSliderValueChanged:(id)sender;
- (IBAction)magnitudeValueChanged:(id)sender;
- (IBAction)willSubmitReport:(id)sender;

// CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading;
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;

// UIImagePickerControllerDelegate 
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;

@end
