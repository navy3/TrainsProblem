//
//  TPTrainAlgorithm.m
//  TrainsProblem
//
//  Created by  on 12-6-4.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPTrainAlgorithm.h"

@implementation TPTrainAlgorithm

@synthesize routeArray;

- (id)init
{
    if (self = [super init]) {
        self.routeArray = [NSArray arrayWithObjects:
                           [NSArray arrayWithObjects:@"-1",@"5",@"-1",@"5",@"7",nil], 
                           [NSArray arrayWithObjects:@"-1",@"-1",@"4",@"-1",@"-1",nil],
                           [NSArray arrayWithObjects:@"-1",@"-1",@"-1",@"8",@"2",nil],
                           [NSArray arrayWithObjects:@"-1",@"-1",@"8",@"-1",@"6",nil],
                           [NSArray arrayWithObjects:@"-1",@"3",@"-1",@"-1",@"-1",nil],
                           nil];
    }
    return self;
}

- (void)dealloc
{
    TP_RELEASE(routeArray);
    [super dealloc];
}

- (NSString *)countResult:(TPTrainParameter *)train
{
    return nil;
}

@end
