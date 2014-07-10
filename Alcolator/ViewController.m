//
//  ViewController.m
//  Alcolator
//
//  Created by Jordan Hudgens on 7/2/14.
//  Copyright (c) 2014 Jordan Hudgens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIButton *calculateButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.beerPercentTextField becomeFirstResponder]; // so the text field is auto selected
    self.title = self.drinkName;
    
    UITabBarItem *wineItem = [[[self.tabBarController tabBar] items] objectAtIndex:0];
    [wineItem setTitle:@"Wine"];
    
    UITabBarItem *whiskeyItem = [[[self.tabBarController tabBar] items] objectAtIndex:1];
    [whiskeyItem setTitle:@"Whiskey"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    
    if (enteredNumber == 0) {
        sender.text = nil;
    }
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
//    float ouncesInOneWineGlass = 5;
//    float alcoholPercentageOfWine = 0.13;
    
    float ouncesOfAlcoholPerWineGlass = self.ouncesInOneGlass * self.alcoholPercentageOfDrink;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", "singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", "plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of %@.", nil), numberOfBeers, beerText, numberOfWineGlassesForEquivalentAlcoholAmount, wineText, self.drinkName];
    
    self.resultLabel.text = resultText;
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

- (void) viewDidAppear:(BOOL)animated
{
    if ([self.tabBarController selectedIndex] == 0) {
        self.ouncesInOneGlass = 5;
        self.alcoholPercentageOfDrink = .13;
        self.drinkName = @"wine";
    } else if ([self.tabBarController selectedIndex] == 1) {
        self.ouncesInOneGlass =1;
        self.alcoholPercentageOfDrink = .4;
        self.drinkName = @"whiskey";
    }
}

@end
