//
//  TPTrainFactory.m
//  TrainsProblem
//
//  Created by  on 12-6-5.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPTrainFactory.h"
#import "TPDistanceTrainAlgorithm.h"
#import "TPLessTrainAlgorithm.h"
#import "TPGreaterTrainAlgorithm.h"
#import "TPShortestTrainAlgorithm.h"
#import "TPDifferentTrainAlgorithm.h"
#import "TPTrainParameter.h"
#import "TPTrainAlgorithm.h"

@interface TPTrainFactory()

@property (nonatomic, retain) TPTrainAlgorithm *algorithm;
@property (nonatomic, retain) TPTrainParameter *tpTrain;
@end

@implementation TPTrainFactory

@synthesize algorithm,tpTrain;

- (void)dealloc
{
    TP_RELEASE(algorithm);
    TP_RELEASE(tpTrain);
    [super dealloc];
}

- (id)initWithType:(int)type
{
    if (self = [super init]) {
        switch (type) {
            case TP_Distance:
                self.algorithm = [[TPDistanceTrainAlgorithm alloc] init];
                break;
            case TP_Less:
                self.algorithm = [[TPLessTrainAlgorithm alloc] init];
                break;
            case TP_Greater:
                self.algorithm = [[TPGreaterTrainAlgorithm alloc] init];
                break;
            case TP_Shortest:
                self.algorithm = [[TPShortestTrainAlgorithm alloc] init];
                break;
            case TP_Different:
                self.algorithm = [[TPDifferentTrainAlgorithm alloc] init];
                break;
            default:
                break;
        }
    }
    return self;
}

- (NSString *)result:(TPTrainParameter *)para
{    
    self.tpTrain = para;
    return [self.algorithm countResult:tpTrain];
}
@end
