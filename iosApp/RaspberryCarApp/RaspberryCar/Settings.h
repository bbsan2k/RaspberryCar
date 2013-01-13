//
//  Settings.h
//  RaspberryCar
//
//  Created by Alexander Kreutz on 12.01.13.
//  Copyright (c) 2013 Alexander Kreutz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Settings : NSManagedObject

@property (nonatomic, retain) NSString * serverAddress;
@property (nonatomic, retain) NSNumber * maxVelocity;

@end
