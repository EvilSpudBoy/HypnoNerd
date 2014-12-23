//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Michael W Stevens on 12/1/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

-(void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];

    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];
    
    CGRect oldFrame = segmentedControl.frame;
    
    segmentedControl.frame = CGRectMake((frame.size.width - oldFrame.size.width) / 2.0, 40, oldFrame.size.width, oldFrame.size.height);
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.momentary = YES;
    [segmentedControl addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventValueChanged];
    
    [backgroundView addSubview:segmentedControl];
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
}

-(void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog((@"BNRHypnosisViewController loaded its view"));
    
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on tab bar item
        self.tabBarItem.image = image;
    }
    
    return self;
}

-(void)colorChange:(UISegmentedControl *)sender
{
    NSLog(@"SelectedIndex = %i", sender.selectedSegmentIndex);
    
    BNRHypnosisView *hypnosisView = (BNRHypnosisView *) self.view;

    if (sender.selectedSegmentIndex == 0) hypnosisView.circleColor = [UIColor redColor];
    else if (sender.selectedSegmentIndex == 1) hypnosisView.circleColor = [UIColor greenColor];
    else hypnosisView.circleColor = [UIColor blueColor];
}

@end
