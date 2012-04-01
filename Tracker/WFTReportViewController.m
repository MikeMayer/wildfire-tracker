//
//  WFTReportViewController.m
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WFTReportViewController.h"

@interface WFTReportViewController ()

@end

@implementation WFTReportViewController

@synthesize findLocationButton;
@synthesize currentLocationLabel;
@synthesize fireMagnitudeSegmentedControl;
@synthesize estimatedDistanceSlider;
@synthesize takePictureButton;
@synthesize estimatedDistanceSliderLabel;
@synthesize activityIndicatorView;
@synthesize imageOne;
@synthesize imageTwo;
@synthesize cameraButton;
@synthesize locationManager = _locationManager;
@synthesize currentLocation, currentHeading, geoCoder;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //is a camera available
    if ( ![UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerSourceTypeCamera] )
    {
        cameraButton.enabled = NO;
    }
    
    CLAuthorizationStatus authStatus = [WFTLocate getAuthorizationStatus:self];
    currentLocation = nil;
    
    if (authStatus == kCLAuthorizationStatusAuthorized) {
        
        currentLocationLabel.text = nil;
        [self findCurrentLocation:nil];
        
        
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
    }
    else {
        currentLocationLabel.text = @"Cannot find location.";
    }
    
    estimatedDistanceSliderLabel.text = @"0.5 miles";
    
    //corner radius
    imageOne.layer.cornerRadius = 4.0;
    imageTwo.layer.cornerRadius = 4.0;

}

- (void)viewDidUnload
{
    [self setFindLocationButton:nil];
    [self setCurrentLocationLabel:nil];
    [self setFireMagnitudeSegmentedControl:nil];
    [self setEstimatedDistanceSlider:nil];
    [self setTakePictureButton:nil];
    [self setEstimatedDistanceSlider:nil];
    [self setActivityIndicatorView:nil];
    [self setImageOne:nil];
    [self setImageTwo:nil];
    [self setCameraButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)findCurrentLocation:(id)sender {    
    
    currentLocationLabel.text = @"Searching...";
    
    //clear previous location
    currentLocation = nil;
    currentHeading = nil;
    
    
    [activityIndicatorView startAnimating];
    
    if (!geoCoder)
        geoCoder = [[CLGeocoder alloc] init];
    
    if (!locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    if ([locationManager delegate] == nil)
        [locationManager setDelegate:self];
    
    
    if ([CLLocationManager headingAvailable])
        [locationManager startUpdatingHeading];
    
    if ([CLLocationManager locationServicesEnabled])
        [locationManager startUpdatingLocation];
    
    
}

- (IBAction)takePicture:(id)sender {
    
    if (![UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerSourceTypeCamera])
        return;
    
    
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = (id)self;

    [self presentViewController:imagePicker 
                       animated:YES 
                     completion:^(void)
     {
         

        
         
     
         
     }];
    
}



- (IBAction)distanceSliderValueChanged:(id)sender {
    estimatedDistanceSliderLabel.text = 
        [NSString stringWithFormat:@"%1.1f miles",  estimatedDistanceSlider.value];
}

- (IBAction)magnitudeValueChanged:(id)sender {
}

- (IBAction)willSubmitReport: (id)sender {
    TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc] init];
        
    if (imageOne)
        [twitter addImage:imageOne.image];
    
    if (imageTwo)
        [twitter addImage:imageTwo.image];

    [twitter setInitialText:@"I'm submitting a #wildfire"];
    
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
    };
    
}


#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    currentHeading = newHeading;
    [locationManager stopUpdatingHeading];
    
    NSLog(@"%@", newHeading.debugDescription);
    
    if (currentLocation && [CLLocationManager locationServicesEnabled])
        [activityIndicatorView stopAnimating];


}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    currentLocation = newLocation;
    
    currentLocationLabel.text = [NSString stringWithFormat:@"%1.2f, %1.2f", 
                                 currentLocation.coordinate.latitude,
                                 currentLocation.coordinate.longitude];
    
    if (geoCoder && ![geoCoder isGeocoding])
    {
        [geoCoder reverseGeocodeLocation:newLocation 
                       completionHandler:^(NSArray *placemarks, NSError *error) {
                           
                           if (error)
                           {
                               NSLog(@"%@", [error debugDescription]);
                               return;
                           }
                           
                           if (placemarks)
                           {
                               CLPlacemark  *place = (CLPlacemark *)[placemarks objectAtIndex:0];
                               
                               if (place) {
                                   currentLocationLabel.text = [NSString stringWithFormat:@"%@, %@",   place.name, place.locality];
                               }
                           }
                       }];
    }
    

     
    [locationManager stopUpdatingLocation];
    
    if (currentHeading && [CLLocationManager headingAvailable])
        [activityIndicatorView stopAnimating];
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (!picker)
        return;
    
    if (!info)
        return;
    
    UIImage* pictureTaken = (UIImage*)[info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (imageOne.image == nil)
    {
        self.imageOne = [[UIImageView alloc] initWithImage:pictureTaken];
                
        [self dismissModalViewControllerAnimated:YES];
        return;
        
    } else 
        if (imageTwo.image == nil)
        {
            self.imageTwo = [[UIImageView alloc] initWithImage:pictureTaken];
            
            [self dismissModalViewControllerAnimated:YES];
            return;
        }
    
    
    NSLog(@"Too many images taken by the user.");
}

@end
