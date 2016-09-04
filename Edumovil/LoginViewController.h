//
//  LoginViewController.h
//  Edumovil
//
//  Created by Julio César Guzmán Villanueva on 5/24/13.
//  Copyright (c) 2013 Julio César Guzmán Villanueva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceConnector.h"

@interface LoginViewController : UIViewController <ServiceConnectorDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)signin:(id)sender;

@end
