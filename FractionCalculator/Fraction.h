//
//  Fraction.h
//  FractionCalculator
//
//  Created by wanghuiyong on 10/11/15.
//  Copyright © 2015 wanghuiyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Fraction : NSObject

@property long numerator, denominator;			// 分子和分母

-(void)         setTo:(int) n over:(int) d;		// 初始化分子和分母
-(void)         print;
-(void)         reduce;							// 约分
-(double)       convertToNum;
-(NSString *)   converToString;

-(Fraction *)   add:(Fraction *) f;
-(Fraction *)   substract:(Fraction *) f;
-(Fraction *)   multiply:(Fraction *) f;
-(Fraction *)   divide:(Fraction *) f;



@end
