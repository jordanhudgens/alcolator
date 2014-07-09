//
//  MainMenuViewController.m
//  Alcolator
//
//  Created by Jordan Hudgens on 7/4/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ViewController.h"
#import "WhiskeyViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) winePressed:(UIButton *) sender {
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

- (void) wineButtonPressed:(UITabBar *) sender {
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

- (void) whiskeyPressed:(UIButton *) sender {
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"whiskey"]) {
        ViewController* vc =  segue.destinationViewController;
        vc.ouncesInOneGlass =1;
        vc.alcoholPercentageOfDrink = .4;
        vc.drinkName = @"whiskey";
    }
    else if([[segue identifier] isEqualToString:@"wine"]){
        ViewController* vc =  segue.destinationViewController;
        vc.ouncesInOneGlass = 5;
        vc.alcoholPercentageOfDrink = .13;
        vc.drinkName = @"wine";
    }
}

@end
