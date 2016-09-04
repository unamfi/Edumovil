//
//  LoginViewController.m
//  Edumovil
//
//  Created by Julio César Guzmán Villanueva on 5/24/13.
//  Copyright (c) 2013 Julio César Guzmán Villanueva. All rights reserved.
//

#import "LoginViewController.h"
#import "JSONDictionaryExtensions.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //@"username=useq4&password=NQbB56eF&value=json"
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ServiceConnectorDelegate -

-(void)requestReturnedData:(NSData *)data
{ //activated when data is returned
    
    NSString *string = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@"RESPUESTA ::: %@", string);
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithJSONData:data];
    //output.text = dictionary.JSONString; // set the textview to the raw string value of the data recieved
    
    NSLog(@"%@",dictionary);
    
    NSString *access = (NSString *)[(NSDictionary*)[dictionary objectForKey:@"result"] objectForKey:@"access"];
    
    if ([access isEqualToString:@"1"]) {
        [self performSegueWithIdentifier:@"menu" sender:self];
    }
    else
    {
        NSLog(@"Password incorrecto (debes hacer otra validadción para el internet...)");
    }
    
}

- (IBAction)signin:(id)sender {

    ServiceConnector *serviceConnector = [[ServiceConnector alloc] init];
    serviceConnector.delegate = self;
    NSString *poststring = [NSString stringWithFormat:@"username=%@&password=%@&value=json", _usernameTextfield.text, _passwordTextField.text];
    NSLog(@"poststring... %@", poststring);
    [serviceConnector postTest:poststring];
    

}
@end
