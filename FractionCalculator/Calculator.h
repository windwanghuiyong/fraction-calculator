//
//  Calculator.h
//  FractionCalculator
//
//  Created by wanghuiyong on 10/11/15.
//  Copyright © 2015 wanghuiyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property (strong, nonatomic) Fraction *operand1;
@property (strong, nonatomic) Fraction *operand2;
@property (strong, nonatomic) Fraction *accumulator;

-(Fraction *) performOperation: (char) op;
-(void) clear;

-(long) memoryClear;
-(long) memoryStore;
-(long) memoryRecall;
-(long) memoryAdd: (long) f;
-(long) memorySubtract: (long) f;


@end
