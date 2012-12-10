//
//  TPDifferentTrainAlgorithm.m
//  TrainsProblem
//
//  Created by  on 12-6-5.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPDifferentTrainAlgorithm.h"

@interface TPDifferentTrainAlgorithm()

@property (nonatomic, retain) TPTrainParameter *tpTrian;

@end

@implementation TPDifferentTrainAlgorithm
@synthesize tpTrian;

- (void)dealloc
{
    TP_RELEASE(tpTrian);
    [super dealloc];
}

- (NSString *)countResult:(TPTrainParameter *)train
{
    self.tpTrian = train;
    
    NSString *startStr = tpTrian.pathString;

    int currentValue = tpTrian.currentValue;
    
    if (currentValue >= tpTrian.distance) 
        return [TPHelper resultArrayToString:tpTrian.resultArray];    
    int startInt = [[startStr substringFromIndex:[startStr length] -1] intValue];
    
    if (startInt == tpTrian.endRoute && currentValue > 0) 
        [tpTrian.resultArray addObject:startStr];
    
    for (int i = 0; i < [[self.routeArray objectAtIndex:startInt] count]; i++) {
        int temp = [[[self.routeArray objectAtIndex:startInt] objectAtIndex:i] intValue];
        if (-1 != temp) {
            tpTrian.pathString = [NSString stringWithFormat:@"%@-%d",startStr,i];
            tpTrian.currentValue = currentValue + temp;
            [self countResult:tpTrian];
        }
    }
    return [TPHelper resultArrayToString:tpTrian.resultArray];    
    
}

@end
