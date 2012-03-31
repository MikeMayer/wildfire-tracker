//
//  WFTLocate.h
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface WFTLocate : NSObject
{
    CLLocationManager *manager;
}

//ivars
@property (nonatomic, strong) CLLocationManager *manager;

//instance methods
-(id)getLocationManager:(id)sender;

//static methods
+(bool) willAllowLocation :(id)sender;

@end
