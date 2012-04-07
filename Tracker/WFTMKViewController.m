//
//  WFTMKViewController.m
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WFTMKViewController.h"
#import "WFTJSONRequest.h"
#import "WFTPoint.h"

@interface WFTMKViewController ()

@end

@implementation WFTMKViewController
@synthesize mapView, hasShown;

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
}  

- (void)viewDidAppear:(BOOL)animated
{
    if ([self navigationController])
        [[self navigationController] setNavigationBarHidden:YES animated:YES];
    

    [self loadLocations:nil];
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
    [mapView removeObserver:self forKeyPath:@"location"];
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)loadLocations:(id)sender {        
        NSArray *fires = [WFTJSONRequest readPoints:self];
        
        if (fires)
        {
            for(int i = 0 ; i < [fires count]; i++)
            {
                WFTPoint *point = [fires objectAtIndex:i];                
                
                
                [mapView addAnnotation:point];
            }
            [self.mapView.userLocation addObserver:self  
                                        forKeyPath:@"location"  
                                           options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)  
                                           context:NULL];
            
        }
}
@end
