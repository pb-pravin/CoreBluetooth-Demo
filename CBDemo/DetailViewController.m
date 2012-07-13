//
//  DetailViewController.m
//  CBDemo
//
//  Created by Lin Zhang on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize label, indicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.label.hidden = YES;
    self.indicator.hidden = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel:) name:kReadValueNotification object:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.label = nil;
    self.indicator = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReadValueNotification object:nil];    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kDisconnectPeripheralNotification object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark
#pragma mark - Notification

- (void)updateLabel:(NSNotification *)notification
{
    if (self.label.hidden) {
        self.label.hidden = NO;
        self.indicator.hidden = YES;
    }
    
    label.text = [NSString stringWithFormat:@"%@", [notification object]];
}

@end
