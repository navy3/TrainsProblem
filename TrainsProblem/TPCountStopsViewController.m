//
//  TPCountStopsViewController.m
//  TrainsProblem
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPCountStopsViewController.h"
#import "TPTrainFactory.h"

#define kBase1Tag    1000
#define kBase2Tag    2000

@interface TPCountStopsViewController ()

@property (nonatomic, retain) NSArray *ctrlArray;
@property (nonatomic, retain) UILabel *startLabel;
@property (nonatomic, retain) UILabel *endLabel;
@property (nonatomic, retain) UITextField *numberField;
@property (nonatomic, retain) NSMutableArray *stopsArray;
@property (nonatomic, retain) UITextView *resultTextView;

@end

@implementation TPCountStopsViewController

@synthesize ctrlArray,startLabel,endLabel,stopsArray,numberField,resultTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Stops", @"Stops");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self buildUI];
   
    //init input array ,1 is "starting",2 "Ending",3,"<=,=",4 "all route array"
    NSArray *arr = [NSArray arrayWithObjects:@"2",@"2",@"0",nil];
    self.stopsArray = [NSMutableArray arrayWithArray:arr];
}

- (void)dealloc
{
    TP_RELEASE(ctrlArray);
    TP_RELEASE(startLabel);
    TP_RELEASE(endLabel);
    TP_RELEASE(numberField);
    TP_RELEASE(stopsArray);
    TP_RELEASE(resultTextView);
    [super dealloc];
}

- (void)buildUI
{
    self.ctrlArray = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E", nil];

    //input start stop
    
    if (!startLabel) {
        self.startLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 30)] autorelease];
        startLabel.text = NSLocalizedString(@"Starting At : C", );
        [self.view addSubview:startLabel];
    }
    
    for (int i = 0; i < [ctrlArray count]; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setFrame:CGRectMake(20 + 60*i, 60, 40, 40)];
        [btn setTitle:[ctrlArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = kBase1Tag + i;
        [self.view addSubview:btn];
    }
    
    //input end stop
    if (!endLabel) {
        self.endLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 110, 280, 30)] autorelease];
        endLabel.text = NSLocalizedString(@"Ending At : C", );
        [self.view addSubview:endLabel];
    }
    
    for (int i = 0; i < [ctrlArray count]; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setFrame:CGRectMake(20 + 60*i, 150, 40, 40)];
        [btn setTitle:[ctrlArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn2Action:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = kBase2Tag + i;
        [self.view addSubview:btn];
    }
    
    //input number
    self.numberField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 200, 120, 40)] autorelease];
    numberField.borderStyle = UITextBorderStyleRoundedRect;
    numberField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    numberField.keyboardType = UIKeyboardTypeNumberPad;
    numberField.textAlignment = UITextAlignmentCenter;
    numberField.text = @"3";
    [self.view addSubview:numberField];
    
    UIButton *hideBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [hideBtn setFrame:CGRectMake(180, 200, 120, 40)];
    [hideBtn setTitle:NSLocalizedString(@"Hide Keyborad", ) forState:UIControlStateNormal];
    [hideBtn addTarget:self action:@selector(hideAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hideBtn];
    
    UISegmentedControl *segCtrl = [[UISegmentedControl alloc] initWithItems:
                                   [NSArray arrayWithObjects:@"<=",@"=", nil]];
    segCtrl.segmentedControlStyle = UISegmentedControlStyleBordered;
    [segCtrl setFrame:CGRectMake(20, 250, 120, 40)];
    segCtrl.selectedSegmentIndex = 0;
    [segCtrl addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segCtrl];
    [segCtrl release];
    
    UIButton *resultBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [resultBtn setFrame:CGRectMake(180, 250, 120, 40)];
    [resultBtn setTitle:NSLocalizedString(@"Result",) forState:UIControlStateNormal];
    [resultBtn addTarget:self action:@selector(resultAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resultBtn];
    
    self.resultTextView = [[[UITextView alloc] initWithFrame:CGRectMake(20, 300, 280, 100)] autorelease];
    resultTextView.editable = NO;
    [self.view addSubview:resultTextView];
}

- (void)resultAction:(id)sender
{
    if ([numberField.text length]) {
        if (0 == [[stopsArray objectAtIndex:2] intValue]) {
            TPTrainParameter *para = [[TPTrainParameter alloc] init];
            para.distance = [numberField.text intValue];
            para.pathString = [stopsArray objectAtIndex:0];
            para.endRoute = [[stopsArray objectAtIndex:1] intValue];
            
            TPTrainFactory *fac = [[TPTrainFactory alloc] initWithType:TP_Less];
            resultTextView.text = [fac result:para];
            [para release];
            [fac release];
        }
        else {
            TPTrainParameter *para = [[TPTrainParameter alloc] init];
            para.distance = [numberField.text intValue];
            para.pathString = [stopsArray objectAtIndex:0];
            para.endRoute = [[stopsArray objectAtIndex:1] intValue];
            
            TPTrainFactory *fac = [[TPTrainFactory alloc] initWithType:TP_Greater];
            resultTextView.text = [fac result:para];
            [para release];
            [fac release];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil 
                                                        message:NSLocalizedString(@"please input stops number", ) 
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"Cancel", ) 
                                              otherButtonTitles: nil];
        [alert show];
        [alert release];
    }
}

- (void)btn1Action:(id)sender
{
    int index  = [(UIButton *)sender tag] - kBase1Tag;
    startLabel.text = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"Starting At :", ),[ctrlArray objectAtIndex:index]];
    [stopsArray replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%d",index]];
}

- (void)btn2Action:(id)sender
{
    int index  = [(UIButton *)sender tag] - kBase2Tag;
    endLabel.text = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"Ending At :", ),[ctrlArray objectAtIndex:index]];
    [stopsArray replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%d",index]];
}

- (void)hideAction:(id)sender
{
    [numberField resignFirstResponder];
}

- (void)segAction:(id)sender
{
    [stopsArray replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"%d",[(UISegmentedControl *)sender selectedSegmentIndex]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
