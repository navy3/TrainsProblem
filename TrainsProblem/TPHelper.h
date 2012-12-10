//
//  TPHelper.h
//  TrainsProblem
//
//  Created by  on 12-6-4.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPHelper : NSObject

//1,2,3,4,5 to A,B,C,D,E
+ (NSString *)letterToString:(char)c;
//A,B,C,D,E to 1,2,3,4,5
+ (NSString *)numberToString:(int)i;
//display route as "A-B-C"
+ (NSString *)arrayToString:(NSArray *)arr;

+ (NSMutableArray *)letterToNumber:(NSArray *)arr;
+ (NSMutableArray *)numberToLetter:(NSArray *)arr;

+ (NSString *)resultArrayToString:(NSArray *)arr;
+ (NSString *)shortestString:(int)dis andRoute:(NSString *)route;

@end
