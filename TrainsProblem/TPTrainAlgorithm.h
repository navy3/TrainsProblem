//
//  TPTrainAlgorithm.h
//  TrainsProblem
//
//  Created by  on 12-6-4.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPTrainParameter.h"
#import "TPHelper.h"

@interface TPTrainAlgorithm : NSObject
{
    NSArray *routeArray;
}

@property (nonatomic, retain) NSArray *routeArray;

- (NSString *)countResult:(TPTrainParameter *)train;

@end
