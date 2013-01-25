//
//  RPCConnector.m
//  RaspberryCar
//
//  Created by Alexander Kreutz on 13.12.12.
//  Copyright (c) 2012 Alexander Kreutz. All rights reserved.
//

#import "RPCConnector.h"
#import "DSJSONRPC.h"
#import "AppDelegate.h"

@interface RPCConnector()

@property (nonatomic, retain) DSJSONRPC *jsonRPCManager;

@end

@implementation RPCConnector

- (id) init{
    AppDelegate *appdelegate = [AppDelegate sharedInstance];
    NSString *stringURL = [NSString stringWithFormat:@"%@:8085",appdelegate.settings.serverAddress];
    DebugLog(@"Url :%@",stringURL);
    self.url = [NSURL URLWithString:stringURL];    
    self.jsonRPCManager = [[DSJSONRPC alloc] initWithServiceEndpoint:self.url];
    return self;
}

- (void) drive:(NSString*) direction{

    [self.jsonRPCManager callMethod:@"drive" withParameters:[NSDictionary dictionaryWithObjectsAndKeys:direction, @"direction", nil]];
}

- (void) setVelocity:(NSNumber*) velo{

    [self.jsonRPCManager callMethod:@"setVelocity" withParameters:[NSDictionary dictionaryWithObjectsAndKeys:[velo stringValue], @"velo", nil]];
}

- (void) updateValues{
    AppDelegate *appdelegate = [AppDelegate sharedInstance];
    NSString *stringURL = [NSString stringWithFormat:@"%@:8085",appdelegate.settings.serverAddress];
    DebugLog(@"Url :%@",stringURL);
    self.url = [NSURL URLWithString:stringURL];
    self.velocity = appdelegate.settings.maxVelocity;
    self.jsonRPCManager = [[DSJSONRPC alloc] initWithServiceEndpoint:self.url];
}




@end
