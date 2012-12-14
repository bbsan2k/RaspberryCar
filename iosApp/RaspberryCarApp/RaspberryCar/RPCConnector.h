//
//  RPCConnector.h
//  RaspberryCar
//
//  Created by Alexander Kreutz on 13.12.12.
//  Copyright (c) 2012 Alexander Kreutz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLRPCConnectionDelegate.h"

@interface RPCConnector : NSObject <XMLRPCConnectionDelegate>
@property (nonatomic, retain) NSURL* url;


- (void) drive:(NSString*) direction;

@end
