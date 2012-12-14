//
//  SettingsViewController.m
//  RaspberryCar
//
//  Created by Alexander Kreutz on 13.12.12.
//  Copyright (c) 2012 Alexander Kreutz. All rights reserved.
//

#import "SettingsViewController.h"
#import "RPCConnector.h"
#import "AppDelegate.h"
#import "RPCSettingsDelegate.h"

@interface SettingsViewController (){
}

@property (strong, nonatomic) UITextField* address;
@property (strong, nonatomic) id<RPCSettingsDelegate> delegate;


@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id) init
{
    self = [super init];

    return self;
}

- (id)initwithDelegate:(id<RPCSettingsDelegate>) delegate{
    
    self.delegate = delegate;
    return [self init];
}

- (void)viewDidLoad
{
    AppDelegate *appDelegate = [AppDelegate sharedInstance];

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, 30)];
    [addressLabel setFont:[UIFont systemFontOfSize:16]];
    [addressLabel setTextAlignment:NSTextAlignmentCenter];
    [addressLabel setText:@"Adresse des Servers:"];
    [addressLabel setBackgroundColor:[UIColor clearColor]];
    addressLabel.textColor = [UIColor whiteColor];
    

    self.address = [[UITextField alloc] initWithFrame:CGRectMake(addressLabel.frame.origin.x, addressLabel.frame.origin.y+addressLabel.frame.size.height, 200, 30)];
    [self.address setCenter:CGPointMake(self.view.frame.size.width/2, addressLabel.frame.origin.y+addressLabel.frame.size.height+15)];
    self.address.borderStyle = UITextBorderStyleRoundedRect;
    self.address.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.address setKeyboardType:UIKeyboardTypeURL];
    [self.address setReturnKeyType:UIReturnKeyDone];
    [self.address setText:appDelegate.settings.serverAddress];
    
    [self.address setDelegate:self];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setFrame: CGRectMake(self.address.frame.origin.x,self.address.frame.origin.y+self.address.frame.size.height+5 , 40, 15)];
    [submitButton addTarget:self action:@selector(setServer) forControlEvents:UIControlEventTouchDown];
    [submitButton setTitle:@"Verbinden" forState:UIControlStateNormal];
    [submitButton sizeToFit];

    [self.view addSubview: addressLabel];
    [self.view addSubview:self.address];
    [self.view addSubview:submitButton];
    
}
- (void) setServer{
    AppDelegate *appDelegate = [AppDelegate sharedInstance];
    [appDelegate.settings setServerAddress:self.address.text];
    [appDelegate saveContext];
    [self.delegate updateRPCController];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (textField == self.address){
        [self setServer];

    }
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
