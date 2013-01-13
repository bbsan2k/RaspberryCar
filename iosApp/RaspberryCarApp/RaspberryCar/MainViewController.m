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
#import "MotionJpegImageView.h"


@interface MainViewController (){
    UIButton *fwdButton;
    UIButton *leftButton;
    UIButton *rightButton;
    UIButton *stopButton;
    UIButton *bwdButton;
    RPCConnector *connector;
    MotionJpegImageView *imageView;
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
    bwdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [fwdButton setFrame:CGRectMake(0, 0, 0, 0)];
    [leftButton setFrame:CGRectMake(0, 0, 0, 0)];
    [rightButton setFrame:CGRectMake(0, 0, 0, 0)];
    [stopButton setFrame:CGRectMake(0, 0, 0, 0)];
    [bwdButton setFrame:CGRectMake(0, 0, 0, 0)];
    
    [fwdButton setTitle:@"Forward" forState:UIControlStateNormal];
    [leftButton setTitle:@"Left" forState:UIControlStateNormal];
    [rightButton setTitle:@"Right" forState:UIControlStateNormal];
    [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    [bwdButton setTitle:@"Backward" forState:UIControlStateNormal];

    
    [fwdButton sizeToFit];
    [leftButton sizeToFit];
    [rightButton sizeToFit];
    [stopButton sizeToFit];
    [bwdButton sizeToFit];
    
    AppDelegate *appdelegate = [AppDelegate sharedInstance];
    imageView = [[MotionJpegImageView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.width)];

    NSString *stringURL = [NSString stringWithFormat:@"%@:8090/?action=stream",appdelegate.settings.serverAddress];
    NSURL *url = [NSURL URLWithString:stringURL];
    imageView.url = url;
    
    [imageView play];
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait){
        [imageView setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width/2)];
        
        [fwdButton setCenter:CGPointMake(self.view.frame.size.width/2, imageView.frame.origin.y+imageView.frame.size.height +50)];
        [leftButton setCenter:CGPointMake(self.view.frame.size.width/6, imageView.frame.origin.y+imageView.frame.size.height +100)];
        [rightButton setCenter:CGPointMake(5*self.view.frame.size.width/6, imageView.frame.origin.y+imageView.frame.size.height +100)];
        [stopButton setCenter:CGPointMake(self.view.frame.size.width/2, imageView.frame.origin.y+imageView.frame.size.height +100)];
        [bwdButton setCenter:CGPointMake(self.view.frame.size.width/2, imageView.frame.origin.y+imageView.frame.size.height +150)];
        
        
    } else if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight){
        [fwdButton setCenter:CGPointMake(7*self.view.frame.size.width/8, self.view.frame.size.height/2 -75)];
        [leftButton setCenter:CGPointMake(self.view.frame.size.width/8, self.view.frame.size.height/2 -50)];
        [rightButton setCenter:CGPointMake(self.view.frame.size.width/8, self.view.frame.size.height/2 +50)];
        [stopButton setCenter:CGPointMake(7*self.view.frame.size.width/8, self.view.frame.size.height/2 -25)];
        [bwdButton setCenter:CGPointMake(7*self.view.frame.size.width/8, self.view.frame.size.height/2 +25)];

        [imageView setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.height*2/3, self.view.frame.size.height/3)];
        [imageView setCenter:CGPointMake((self.view.frame.origin.x+self.view.frame.size.width)/2,(self.view.frame.origin.y+ self.view.frame.size.height)/2)];
        
    }

    
        
        
        
    [fwdButton addTarget:self action:@selector(driveFwd) forControlEvents:UIControlEventTouchDown];
    [leftButton addTarget:self action:@selector(driveLeft) forControlEvents:UIControlEventTouchDown];
    [rightButton addTarget:self action:@selector(driveRight) forControlEvents:UIControlEventTouchDown];
    [stopButton addTarget:self action:@selector(driveStop) forControlEvents:UIControlEventTouchDown];
    [bwdButton addTarget:self action:@selector(driveBwd) forControlEvents:UIControlEventTouchDown];

    
    
    

    //[imageView sizeToFit];
    
    
    [self.view addSubview:fwdButton];
    [self.view addSubview:leftButton];
    [self.view addSubview:rightButton];
    [self.view addSubview:stopButton];
    [self.view addSubview:imageView];
    [self.view addSubview:bwdButton];
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

- (void) driveBwd
{
    [connector drive:@"bwd"];
}


- (void) updateRPCController{
    AppDelegate *appdelegate = [AppDelegate sharedInstance];
    if (!connector){
        connector = [[RPCConnector alloc] init];
    }
    NSString *stringURL = [NSString stringWithFormat:@"%@:8090/?action=stream",appdelegate.settings.serverAddress];
    NSURL *url = [NSURL URLWithString:stringURL];
    imageView.url = url;
    [imageView reloadInputViews];
    [connector setUrl:[NSURL URLWithString:appdelegate.settings.serverAddress]];
    [connector setVelocity:appdelegate.settings.maxVelocity];
}


-(id) init
{
    self = [super init];
    if (self){
        self.title = @"Main";
        UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(openSettings)];
        [self updateRPCController];
        
        [self.navigationItem setRightBarButtonItem:settingsButton];
        
        
        
        //[self setUpButtons];

    }
    return self;
}


- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait){
        [imageView setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width/2)];
        
        [fwdButton setCenter:CGPointMake(self.view.frame.size.width/2, imageView.frame.origin.y+imageView.frame.size.height +50)];
        [leftButton setCenter:CGPointMake(self.view.frame.size.width/6, imageView.frame.origin.y+imageView.frame.size.height +100)];
        [rightButton setCenter:CGPointMake(5*self.view.frame.size.width/6, imageView.frame.origin.y+imageView.frame.size.height +100)];
        [stopButton setCenter:CGPointMake(self.view.frame.size.width/2, imageView.frame.origin.y+imageView.frame.size.height +100)];
        [bwdButton setCenter:CGPointMake(self.view.frame.size.width/2, imageView.frame.origin.y+imageView.frame.size.height +150)];
        
        
    } else if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight){
        [fwdButton setCenter:CGPointMake(7*self.view.frame.size.width/8, self.view.frame.size.height/2 -75)];
        [leftButton setCenter:CGPointMake(self.view.frame.size.width/8, self.view.frame.size.height/2 -50)];
        [rightButton setCenter:CGPointMake(self.view.frame.size.width/8, self.view.frame.size.height/2 +50)];
        [stopButton setCenter:CGPointMake(7*self.view.frame.size.width/8, self.view.frame.size.height/2 -25)];
        [bwdButton setCenter:CGPointMake(7*self.view.frame.size.width/8, self.view.frame.size.height/2 +25)];
        
        [imageView setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.height*4/3, self.view.frame.size.height*2/3)];
        [imageView setCenter:CGPointMake((self.view.frame.origin.x+self.view.frame.size.width)/2,(self.view.frame.origin.y+ self.view.frame.size.height)/2)];
        
    }

    
    


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setUpButtons];

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
