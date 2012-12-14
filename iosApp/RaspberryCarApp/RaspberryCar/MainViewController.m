//
//  MainViewController.m
//  RaspberryCar
//
//  Created by Alexander Kreutz on 13.12.12.
//  Copyright (c) 2012 Alexander Kreutz. All rights reserved.
//

#import "MainViewController.h"
#import "SettingsViewController.h"
#import "RPCConnector.h"
#import "AppDelegate.h"

@interface MainViewController (){
    UIButton *fwdButton;
    UIButton *leftButton;
    UIButton *rightButton;
    UIButton *stopButton;
    RPCConnector *connector;
}
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void) setUpButtons
{
    fwdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [fwdButton setFrame:CGRectMake(0, 0, 0, 0)];
    [leftButton setFrame:CGRectMake(0, 0, 0, 0)];
    [rightButton setFrame:CGRectMake(0, 0, 0, 0)];
    [stopButton setFrame:CGRectMake(0, 0, 0, 0)];
    
    [fwdButton setTitle:@"Forward" forState:UIControlStateNormal];
    [leftButton setTitle:@"Left" forState:UIControlStateNormal];
    [rightButton setTitle:@"Right" forState:UIControlStateNormal];
    [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    
    [fwdButton sizeToFit];
    [leftButton sizeToFit];
    [rightButton sizeToFit];
    [stopButton sizeToFit];
    
    [fwdButton setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.origin.y+30)];
    [leftButton setCenter:CGPointMake(self.view.frame.size.width/6, (self.view.frame.origin.y+self.view.frame.size.height)/2)];
    [rightButton setCenter:CGPointMake(5*self.view.frame.size.width/6, (self.view.frame.origin.y+self.view.frame.size.height)/2)];
    [stopButton setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.origin.y+self.view.frame.size.height-100)];
    
    [fwdButton addTarget:self action:@selector(driveFwd) forControlEvents:UIControlEventTouchDown];
    [leftButton addTarget:self action:@selector(driveLeft) forControlEvents:UIControlEventTouchDown];
    [rightButton addTarget:self action:@selector(driveRight) forControlEvents:UIControlEventTouchDown];
    [stopButton addTarget:self action:@selector(driveStop) forControlEvents:UIControlEventTouchDown];
    
    
    
    [self.view addSubview:fwdButton];
    [self.view addSubview:leftButton];
    [self.view addSubview:rightButton];
    [self.view addSubview:stopButton];
}

- (void) driveFwd
{
    [connector drive:@"fwd"];
}

- (void) driveLeft
{
    [connector drive:@"left"];
}

- (void) driveRight
{
    [connector drive:@"right"];
}

- (void) driveStop
{
    [connector drive:@"stop"];
}


- (void) updateRPCController{
    AppDelegate *appdelegate = [AppDelegate sharedInstance];
    if (!connector){
        connector = [[RPCConnector alloc] init];
    }

    [connector setUrl:[NSURL URLWithString:appdelegate.settings.serverAddress]];
}


-(id) init
{
    self = [super init];
    if (self){
        self.title = @"Main";
        UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(openSettings)];
        [self updateRPCController];
        
        [self.navigationItem setRightBarButtonItem:settingsButton];
        
        
        
        [self setUpButtons];

    }
    return self;
}


- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [fwdButton setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.origin.y+30)];
    [leftButton setCenter:CGPointMake(self.view.frame.size.width/6, (self.view.frame.origin.y+self.view.frame.size.height)/2)];
    [rightButton setCenter:CGPointMake(5*self.view.frame.size.width/6, (self.view.frame.origin.y+self.view.frame.size.height)/2)];
    [stopButton setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.origin.y+self.view.frame.size.height-100)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
}
-(void) openSettings
{
    [self.navigationController pushViewController:[[SettingsViewController alloc] initwithDelegate:self] animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
