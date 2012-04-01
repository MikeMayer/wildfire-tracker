//
//  WFTJSONRequest.m
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WFTJSONRequest.h"
#import "WFTPoint.h"

@implementation WFTJSONRequest


+(NSArray*) readPoints:(id)sender
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Fires" ofType:@"json"];  
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];  
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:jsonData
                          options:kNilOptions 
                          error:&error];
    
    NSMutableArray* firePoints = [[NSMutableArray alloc] initWithArray: [json objectForKey:@"fires"] ];

    
    for (int i = 0 ; i < [firePoints count] ; i++)
    {
        NSDictionary *dict = [firePoints objectAtIndex:i];
        
        [firePoints replaceObjectAtIndex:i withObject:
         [[WFTPoint alloc] initWithData:nil 
                                       :[dict objectForKey:@"lat"] 
                              longitude:[dict objectForKey:@"long"] 
                                message:[dict objectForKey:@"msg"] 
                              magnitude:[dict objectForKey:@"mag"]]];
    
    }
    
    //
    //
    //
    //
    //
    
    NSLog(@"fires: %@", firePoints);
    
    
    return firePoints;
}


@end
