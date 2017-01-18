//
//  ViewController.h
//  FractionCalculator
//
//  Created by wanghuiyong on 10/11/15.
//  Copyright © 2015 wanghuiyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit: (long) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

-(IBAction) clickDigit:(UIButton *) sender;

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;

@end

