//
//  WFTFirstViewController.m
//  Tracker
//
//  Created by Mike Mayer on 3/31/12.
//  Copyright (c) 2012 wildfiretracker.com. All rights reserved.
//

#import "WFTFirstViewController.h"


@interface WFTFirstViewController ()

@end

@implementation WFTFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
