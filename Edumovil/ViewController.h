//
//  ViewController.h
//  Edumovil
//
//  Created by Julio César Guzmán Villanueva on 5/17/13.
//  Copyright (c) 2013 Julio César Guzmán Villanueva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"

@interface ViewController : UIViewController <AwesomeMenuDelegate>
@property (strong, nonatomic) IBOutlet UILabel *labelEvaluaciones;
@property (strong, nonatomic) IBOutlet UILabel *labelNotas;
@property (strong, nonatomic) IBOutlet UILabel *labelPreguntasYComentarios;
@property (strong, nonatomic) IBOutlet UILabel *labelAvisos;

@end
