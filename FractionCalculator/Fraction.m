//
//  Fraction.m
//  FractionCalculator
//
//  Created by wanghuiyong on 10/11/15.
//  Copyright © 2015 wanghuiyong. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

/*******************
 	设置分子和分母
*******************/
-(void) setTo:(int)n over:(int)d
{
    numerator = n;
    denominator = d;
}

/**********************
	以分数形式进行打印
**********************/
-(void) print
{
    NSLog(@"%li/%li", numerator, denominator);
}

/*******************
	对分数进行约分
*******************/
-(void) reduce
{
    long u = numerator;
    long v = denominator;
    long temp;
    
    if (u == 0)		// 分子为0则直接返回
        return;
    else if (u < 0)	// 分子不为0则设置为正数
        u = -u;
    
    while (v != 0) 
    {
        temp = u % v;
        u = v;		// 求最大公约数 u
        v = temp;
    }
    numerator /= u;
    denominator /= u;
}

/*********************
	将分数转换为小数
*********************/
-(double) convertToNum
{
    if (denominator)	// 分母不为0, 则转换为小数 
    {
        return (double) numerator / denominator;
    }
    else
        return NAN;
}

/******************************
	将分数转换为分数形式的字符串
******************************/
-(NSString *) converToString
{
    if (numerator == denominator)
        if (numerator == 0)
            return @"0";
        else
            return @"1";
    else if (denominator == 1)
        return [NSString stringWithFormat:@"%li", numerator];
    else
        return [NSString stringWithFormat:@"%li/%li", numerator, denominator];
}

/**************
	加法运算
**************/
-(Fraction *) add:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator + denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

/**************
	减法运算
**************/
-(Fraction *) substract:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator - denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

/**************
	乘法运算
**************/
-(Fraction *) multiply:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}


/**************
	除法运算
**************/
-(Fraction *) divide:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    [result reduce];
    return result;
}

@end
