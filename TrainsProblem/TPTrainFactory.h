//
//  TPTrainFactory.h
//  TrainsProblem
//
//  Created by  on 12-6-5.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPTrainParameter.h"

enum
{
    TP_Distance = 0,
    TP_Less,
    TP_Greater,
    TP_Shortest,
    TP_Different
}TPAlgorithmTypes;

@interface TPTrainFactory : NSObject

- (id)initWithType:(int)type;
- (NSString *)result:(TPTrainParameter *)para;

@end
