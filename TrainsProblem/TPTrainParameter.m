//
//  TPTrainParameter.m
//  TrainsProblem
//
//  Created by  on 12-6-4.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPTrainParameter.h"

@implementation TPTrainParameter

@synthesize inputArray,resultArray,distance,pathString,currentValue,endRoute;

- (id)init
{
    if (self = [super init]) {
        
        self.resultArray = [NSMutableArray arrayWithCapacity:0];
        
        self.distance = 0;
        self.pathString = @"";
        self.currentValue = 0;
    }
    return self;
}

- (void)dealloc
{
    TP_RELEASE(inputArray);
    TP_RELEASE(resultArray);
    TP_RELEASE(pathString);
    [super dealloc];
}
@end
