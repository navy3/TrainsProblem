//
//  TPDistanceTrainAlgorithm.m
//  TrainsProblem
//
//  Created by  on 12-6-5.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPDistanceTrainAlgorithm.h"

@implementation TPDistanceTrainAlgorithm

- (NSString *)countResult:(TPTrainParameter *)train
{
    int distance = 0;


    NSMutableArray *mutableArray = [TPHelper letterToNumber:train.inputArray];
    

    for (int i = 0; i < [mutableArray count] - 1; i++) {
        
        NSArray *tempArray = [self.routeArray objectAtIndex:[[mutableArray objectAtIndex:i] intValue]];
        
        int temp = [[tempArray objectAtIndex:[[mutableArray objectAtIndex:i+1] intValue]] intValue];
        if (-1 == temp) {
            return NSLocalizedString(@"NO SUCH ROUTE", );
        }
        else {
            distance += temp;
        }
        
    }
        
    if (0 == distance) 
        return NSLocalizedString(@"NO SUCH ROUTE", );
    else
        return [NSString stringWithFormat:@"Distance:%d",distance];
}
@end
