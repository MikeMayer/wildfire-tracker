//
//  WFTMKViewController.h
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface WFTMKViewController : UIViewController
{
    bool hasShown;
}


@property (nonatomic) bool hasShown;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)loadLocations:(id)sender;

@end
