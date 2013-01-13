//
//  AppDelegate.h
//  RaspberryCar
//
//  Created by Alexander Kreutz on 13.12.12.
//  Copyright (c) 2012 Alexander Kreutz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainNavigationController.h"
#import "Settings.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
+(AppDelegate *)sharedInstance;


@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) MainNavigationController *viewController;
@property (strong, nonatomic, readonly) Settings *settings;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
