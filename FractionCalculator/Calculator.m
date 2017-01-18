//
//  Calculator.m
//  FractionCalculator
//
//  Created by wanghuiyong on 10/11/15.
//  Copyright © 2015 wanghuiyong. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize operand1, operand2, accumulator;

-(id) init
{
    self = [super init];
    
    if (self) 
    {
        operand1 = [[Fraction alloc] init];
        operand2 = [[Fraction alloc] init];
        accumulator = [[Fraction alloc] init];
    }
    return self;
}

-(void) clear
{
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}

-(Fraction *) performOperation:(char)op
{
    Fraction *result;
    
    switch (op) 
    {
        case '+':
            result = [operand1 add:operand2];
            break;
        case '-':
            result = [operand1 substract:operand2];
            break;
        case '*':
            result = [operand1 multiply:operand2];
            break;
        case '/':
            result = [operand1 divide:operand2];
        default:
            break;
    }
    
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}

@end
