//
//  SettingsViewController.h
//  RaspberryCar
//
//  Created by Alexander Kreutz on 13.12.12.
//  Copyright (c) 2012 Alexander Kreutz. All rights reserved.
//

#import "AbstractViewController.h"
#import "RPCSettingsDelegate.h"

@interface SettingsViewController : AbstractViewController <UITextFieldDelegate>

- (id)initwithDelegate:(id<RPCSettingsDelegate>) delegate;

@end
