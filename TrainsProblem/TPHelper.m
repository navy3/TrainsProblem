//
//  TPHelper.m
//  TrainsProblem
//
//  Created by  on 12-6-4.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPHelper.h"

@implementation TPHelper

+ (NSString *)letterToString:(char)c
{
    return [NSString stringWithFormat:@"%d",c - 'A'];
}

+ (NSString *)numberToString:(int)i
{
    char c = 'A' + i;
    return [NSString stringWithFormat:@"%c",c];
}

+ (NSString *)arrayToString:(NSArray *)arr
{
    NSString *resStr = @"";
    for (int i = 0; i < [arr count]; i++) 
    {
        if (![resStr length]) 
        {
            resStr = [arr objectAtIndex:i];
        }
        else {
            resStr = [NSString stringWithFormat:@"%@-%@",resStr,[arr objectAtIndex:i]];
        }
    } 
    return resStr;
}

+ (NSMutableArray *)letterToNumber:(NSArray *)arr
{
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:arr];
    for (int i = 0; i< [mutableArray count]; i++) {
        NSString *str = [mutableArray objectAtIndex:i];
        const char *c = [str UTF8String];
        [mutableArray replaceObjectAtIndex:i withObject:[self letterToString:c[0]]];
    }
    return mutableArray;
}

+ (NSMutableArray *)numberToLetter:(NSArray *)arr
{
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:arr];
    for (int i = 0; i< [mutableArray count]; i++) {
        NSString *str = [mutableArray objectAtIndex:i];
        [mutableArray replaceObjectAtIndex:i withObject:[self numberToString:[str intValue]]];
    }
    
    return mutableArray;
}

+ (NSString *)resultArrayToString:(NSArray *)arr
{
    if (0 == [arr count]) 
        return NSLocalizedString(@"NO SUCH ROUTE", );
    
    NSString *resultStr = [NSString stringWithFormat:@"Count: %d \n",[arr count]];
    for (int i = 0; i < [arr count]; i++) {
        NSArray *subArr = [[arr objectAtIndex:i] componentsSeparatedByString:@"-"];
        resultStr = [NSString stringWithFormat:@"%@ %@ \n",resultStr,[self arrayToString:[self numberToLetter:subArr]]];
    }
    return resultStr;
}

+ (NSString *)shortestString:(int)dis andRoute:(NSString *)route
{
    if (INT32_MAX == dis) 
        return NSLocalizedString(@"NO SUCH ROUTE", );

    NSString *resultStr = [NSString stringWithFormat:@"Distance: %d \n",dis];
    NSArray *arr = [route componentsSeparatedByString:@"-"];
    resultStr = [NSString stringWithFormat:@"%@ %@ \n",resultStr,[self arrayToString:[self numberToLetter:arr]]];
    return resultStr;
}

@end
