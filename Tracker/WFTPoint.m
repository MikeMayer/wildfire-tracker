//
//  WFTPoint.m
//  Tracker
//
//  Created by Mike Mayer on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WFTPoint.h"


@implementation WFTPoint

@synthesize coordinate, message, magnitude;

-(id)initWithData:  coordinate:(CLLocationCoordinate2D)point message:(NSString*)msg magnitude:(NSNumber*)mag
{
    if (self = [super init])
    {
        self.coordinate = point;
        self.message = msg;
        self.magnitude = mag;
    }
    
    return self;
}

-(id)initWithData:  
         latitude:(NSNumber*)inLat  
        longitude:(NSNumber*)inLong 
          message:(NSString*)msg 
        magnitude:(NSNumber*)mag
{
    if (self = [super init])
    {
        if (inLat && inLong)
            self.coordinate = CLLocationCoordinate2DMake( [inLat doubleValue], [inLong doubleValue]);
        
        if (msg)
            self.message = msg;
        
        if (mag)
            self.magnitude = mag;
    }
    return self;
}


@end
