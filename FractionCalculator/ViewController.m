//
//  ViewController.m
//  FractionCalculator
//
//  Created by wanghuiyong on 10/11/15.
//  Copyright © 2015 wanghuiyong. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char            op;
    long            currentNumber;      //输入中的数
    BOOL            firstOperand;       //输入的操作数是第一个还是第二个
    BOOL            isNumerator;        //输入的操作数是分子还是分母
    Calculator      *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;


- (void)viewDidLoad 
{
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) processDigit:(long)digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%ld", digit]];
    display.text = displayString;
}

-(IBAction)clickDigit:(UIButton *)sender
{
    long digit = sender.tag;
    
    [self processDigit:digit];
}

-(void) processOp:(char)theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
}

-(void) storeFracPart
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumerator){
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else{
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

-(IBAction)clickOver
{
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

-(IBAction)clickPlus
{
    [self processOp:'+'];
}

-(IBAction)clickMinus
{
    [self processOp:'-'];
}

-(IBAction)clickMultiply
{
    [self processOp:'*'];
}

-(IBAction)clickDivide
{
    [self processOp:'/'];
}

-(IBAction)clickEquals
{
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator converToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}

-(IBAction)clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
}

@end
