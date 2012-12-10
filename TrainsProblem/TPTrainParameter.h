//
//  TPTrainParameter.h
//  TrainsProblem
//
//  Created by  on 12-6-4.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPTrainParameter : NSObject
{
    NSMutableArray *inputArray;
    
    int endRoute;
    
    //total stops,or route value;
    int distance;
   
    //used for count shortest and different stops;
    int currentValue;
    
    NSString *pathString;
    
    NSMutableArray *resultArray;

}

@property (nonatomic, copy) NSString *pathString;

@property (nonatomic, retain) NSMutableArray *inputArray;
@property (nonatomic, retain) NSMutableArray *resultArray;

@property (nonatomic, assign) int distance;
@property (nonatomic, assign) int currentValue;
@property (nonatomic, assign) int endRoute;

@end
