//
//  WFTLocate.m
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WFTLocate.h"

@implementation WFTLocate
@synthesize manager = _manager;


#pragma mark - Instance Methods

-(id) getLocationManager:(id)sender
{
    if (!_manager)
        _manager = [[CLLocationManager alloc] init];
    
    return _manager;
}


#pragma mark - Static Methods

+(bool) willAllowLocation :(id)sender
{   
    if ([CLLocationManager locationServicesEnabled] == NO)
    {
        UIAlertView *view = [[UIAlertView alloc] 
                             initWithTitle:@"Location Services Disabled" 
                             message:@"Please enable them in Settings." 
                             delegate:nil 
                             cancelButtonTitle:@"OK" 
                             otherButtonTitles:nil];
        
        [view show];
        
        return false;
    }
    
    return true;
}

+(CLAuthorizationStatus) getAuthorizationStatus:(id)sender
{
    return [CLLocationManager authorizationStatus];
}



@end
