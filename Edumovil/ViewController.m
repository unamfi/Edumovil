//
//  ViewController.m
//  Edumovil
//
//  Created by Julio César Guzmán Villanueva on 5/17/13.
//  Copyright (c) 2013 Julio César Guzmán Villanueva. All rights reserved.
//

#import "ViewController.h"
#import <Dropbox/Dropbox.h>
#import "FolderListController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController setToolbarHidden:YES animated:YES];
    
   	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    
    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                           highlightedImage:storyMenuItemImagePressed
                                                               ContentImage:starImage
                                                    highlightedContentImage:nil];

    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, nil];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds menus:menus];
    
    menu.delegate = self;
    [self.view addSubview:menu];
    
    _labelAvisos.alpha = 0;
    _labelEvaluaciones.alpha = 0;
    _labelNotas.alpha = 0;
    _labelPreguntasYComentarios.alpha = 0;
    
}

/* ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ */
/* ⬇⬇⬇⬇⬇⬇ GET RESPONSE OF MENU ⬇⬇⬇⬇⬇⬇ */
/* ⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇ */


- (void)AwesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
    [UIView animateWithDuration:0.5 animations:^(void) {
        _labelAvisos.alpha = 0;
        _labelEvaluaciones.alpha = 0;
        _labelNotas.alpha = 0;
        _labelPreguntasYComentarios.alpha = 0;
    }];

    if(idx == 0)
    {
        [self performSegueWithIdentifier:@"evaluaciones" sender:nil];
    }
    if(idx == 1)
    {
        
        //[self performSegueWithIdentifier:@"notas" sender:nil];
        
        DBAccount *account = [DBAccountManager sharedManager].linkedAccount;
        
        if (account) {
            
            DBFilesystem *filesystem = [DBFilesystem sharedFilesystem];
            
            if (!filesystem) {
                filesystem = [[DBFilesystem alloc] initWithAccount:account];
                [DBFilesystem setSharedFilesystem:filesystem];
            }
            
            DBPath *existingPath = [[DBPath root] childPath:@""];
            DBFile *file =[[DBFilesystem sharedFilesystem] openFile:existingPath error:nil];
            NSString *contents = [file readString:nil];
            NSLog(@"%@", contents);
            
            FolderListController *folderController =
            [[FolderListController alloc] initWithFilesystem:filesystem root:[DBPath root]];
            
            [self.navigationController pushViewController:folderController animated:YES];
                
        }
        else
        {
            [[DBAccountManager sharedManager] linkFromController:self];
        }
    }
    if(idx == 2)
    {
        [self performSegueWithIdentifier:@"preguntas" sender:nil];
    }
    if(idx == 3)
    {
        [self performSegueWithIdentifier:@"avisos" sender:nil];
    }
}

-(void)didExplode
{
    NSLog(@"exploded");
    [UIView animateWithDuration:0.5 animations:^(void) {
        _labelAvisos.alpha = 1;
        _labelEvaluaciones.alpha = 1;
        _labelNotas.alpha = 1;
        _labelPreguntasYComentarios.alpha = 1;
    }];
}

-(void)didImplode
{
    NSLog(@"implode");
    [UIView animateWithDuration:0.5 animations:^(void) {
        _labelAvisos.alpha = 0;
        _labelEvaluaciones.alpha = 0;
        _labelNotas.alpha = 0;
        _labelPreguntasYComentarios.alpha = 0;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
