//
//  ViewController.h
//  Alcolator
//
//  Created by Jordan Hudgens on 7/2/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (assign) float ouncesInOneGlass;
@property (assign) float alcoholPercentageOfDrink;
@property (strong, nonatomic) NSString* drinkName;


- (void)buttonPressed:(UIButton *)sender;



@end

