//
//  TPShortestTrainAlgorithm.m
//  TrainsProblem
//
//  Created by  on 12-6-5.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPShortestTrainAlgorithm.h"

@interface TPShortestTrainAlgorithm()

@property (nonatomic, copy) NSString *shortestRoute;
@property (nonatomic, assign) int shortestValue;
@property (nonatomic, retain) TPTrainParameter *tpTrian;

@end

@implementation TPShortestTrainAlgorithm

@synthesize shortestRoute,shortestValue,tpTrian;

- (void)dealloc
{
    TP_RELEASE(shortestRoute);
    TP_RELEASE(tpTrian);
    [super dealloc];
}

- (NSString *)countResult:(TPTrainParameter *)train
{
    [self resetShort];
    return [self countShortest:train];
}

- (void)resetShort
{
    self.shortestRoute = @"";
    self.shortestValue = INT32_MAX;
}

- (NSString *)countShortest:(TPTrainParameter *)train
{
    self.tpTrian = train;
    
    NSString *startStr = tpTrian.pathString;
    int currentValue = tpTrian.currentValue;
    
    int startInt = [[startStr substringFromIndex:[startStr length] -1] intValue];
    
    if (startInt == tpTrian.endRoute && currentValue > 0 && currentValue < shortestValue) 
    {
        self.shortestRoute = startStr;
        self.shortestValue = currentValue;
        return [TPHelper shortestString:shortestValue andRoute:shortestRoute];
    }
    
    for (int i = 0; i < [[self.routeArray objectAtIndex:startInt] count]; i++) {
        int temp = [[[self.routeArray objectAtIndex:startInt] objectAtIndex:i] intValue];
        if (-1 != temp) {
            NSRange range = [startStr rangeOfString:[NSString stringWithFormat:@"%d",i]];
            if (range.length > 0 && i != tpTrian.endRoute) 
                continue;
            tpTrian.pathString = [NSString stringWithFormat:@"%@-%d",startStr,i];
            tpTrian.currentValue = currentValue + temp;
            [self countShortest:tpTrian];
        }
    } 
    
    return [TPHelper shortestString:shortestValue andRoute:shortestRoute];
}
@end
