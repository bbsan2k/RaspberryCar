//
//  RPCConnector.m
//  RaspberryCar
//
//  Created by Alexander Kreutz on 13.12.12.
//  Copyright (c) 2012 Alexander Kreutz. All rights reserved.
//

#import "RPCConnector.h"
#import "XMLRPCConnectionManager.h"
#import "XMLRPCRequest.h"
#import "AppDelegate.h"

@interface RPCConnector()

@property (nonatomic, retain) XMLRPCConnectionManager * manager;


@end

@implementation RPCConnector

- (id) init{
    AppDelegate *appdelegate = [AppDelegate sharedInstance];
    self.url = [NSURL URLWithString:appdelegate.settings.serverAddress];
    self.manager = [XMLRPCConnectionManager sharedManager];
    return self;
}

- (void) drive:(NSString*) direction{
    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL:self.url];
    [request setMethod:@"drive" withParameter:direction];
    NSLog(@"Request body: %@ and URL:%@", [request body], self.url);
    [self.manager spawnConnectionWithXMLRPCRequest:request delegate:self];
}



# pragma mark - XMLRPCConnectionDelegate Methods

- (void)request: (XMLRPCRequest *)request didReceiveResponse: (XMLRPCResponse *)response{
    
}

- (void)request: (XMLRPCRequest *)request didFailWithError: (NSError *)error{
    DebugLog([error debugDescription]);
}


- (BOOL)request: (XMLRPCRequest *)request canAuthenticateAgainstProtectionSpace: (NSURLProtectionSpace *)protectionSpace{
    return true;
}

- (void)request: (XMLRPCRequest *)request didReceiveAuthenticationChallenge: (NSURLAuthenticationChallenge *)challenge{
    
}

- (void)request: (XMLRPCRequest *)request didCancelAuthenticationChallenge: (NSURLAuthenticationChallenge *)challenge{
    
}


@end
