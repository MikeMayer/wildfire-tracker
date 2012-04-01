//
//  WFTPoint.h
//  Tracker
//
//  Created by Mike Mayer on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface WFTPoint : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D coordinate;

    NSNumber *magnitude;
    NSString *message;
}

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property NSNumber *magnitude;
@property NSString *message; 

-(id)initWithData:  coordinate:(CLLocationCoordinate2D)point message:(NSString*)msg magnitude:(NSNumber*)mag;

-(id)initWithData:  latitude:(NSNumber*)inLat  longitude:(NSNumber*)inLong message:(NSString*)msg magnitude:(NSNumber*)mag;

@end
