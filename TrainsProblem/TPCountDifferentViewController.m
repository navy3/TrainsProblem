//
//  TPCountDifferentViewController.m
//  TrainsProblem
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPCountDifferentViewController.h"
#import "TPTrainFactory.h"

#define kBase1Tag    1000
#define kBase2Tag    2000

@interface TPCountDifferentViewController ()

@property (nonatomic, retain) NSArray *ctrlArray;
@property (nonatomic, retain) UILabel *fromLabel;
@property (nonatomic, retain) UILabel *toLabel;
@property (nonatomic, retain) UITextView *resultTextView;
@property (nonatomic, retain) NSMutableArray *inputArray;
@property (nonatomic, retain) UITextField *numberField;

@end

@implementation TPCountDifferentViewController

@synthesize ctrlArray,fromLabel,toLabel,resultTextView,inputArray,numberField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Different", @"Different");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)dealloc
{
    TP_RELEASE(numberField);
    TP_RELEASE(ctrlArray);
    TP_RELEASE(fromLabel);
    TP_RELEASE(toLabel);
    TP_RELEASE(resultTextView);
    TP_RELEASE(inputArray);
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self buildUI];
    
    //init input array, first is "from",second is "to",third is "route value",fourth is "max distance" fifth is "result array"
    NSArray *arr = [NSArray arrayWithObjects:@"2",@"2",@"30",nil];
    self.inputArray = [NSMutableArray arrayWithArray:arr];
}

- (void)buildUI
{
    self.ctrlArray = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E", nil];
    
    //input start stop
    
    if (!fromLabel) {
        self.fromLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 30)] autorelease];
        fromLabel.text = NSLocalizedString(@"From : C", );
        [self.view addSubview:fromLabel];
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
    if (!toLabel) {
        self.toLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 110, 280, 30)] autorelease];
        toLabel.text = NSLocalizedString(@"To : C", );
        [self.view addSubview:toLabel];
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
    numberField.text = @"30";
    [self.view addSubview:numberField];
    
    UIButton *hideBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [hideBtn setFrame:CGRectMake(180, 200, 120, 40)];
    [hideBtn setTitle:NSLocalizedString(@"Hide Keyborad", ) forState:UIControlStateNormal];
    [hideBtn addTarget:self action:@selector(hideAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hideBtn];
    
    UIButton *resultBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [resultBtn setFrame:CGRectMake(180, 250, 120, 40)];
    [resultBtn setTitle:NSLocalizedString(@"Result",) forState:UIControlStateNormal];
    [resultBtn addTarget:self action:@selector(resultAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resultBtn];
    
    self.resultTextView = [[[UITextView alloc] initWithFrame:CGRectMake(20, 300, 280, 100)] autorelease];
    resultTextView.editable = NO;
    [self.view addSubview:resultTextView];
}

- (void)hideAction:(id)sender
{
    [numberField resignFirstResponder];
}

- (void)btn1Action:(id)sender
{
    int index  = [(UIButton *)sender tag] - kBase1Tag;
    fromLabel.text = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"From :", ),[ctrlArray objectAtIndex:index]];
    [inputArray replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%d",index]];
}

- (void)btn2Action:(id)sender
{
    int index  = [(UIButton *)sender tag] - kBase2Tag;
    toLabel.text = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"To :", ),[ctrlArray objectAtIndex:index]];
    [inputArray replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%d",index]];
}

- (void)resultAction:(id)sender
{    
    if ([numberField.text length]) {
        
        TPTrainParameter *para = [[TPTrainParameter alloc] init];
        para.pathString = [inputArray objectAtIndex:0];
        para.endRoute = [[inputArray objectAtIndex:1] intValue];
        para.distance = [numberField.text intValue];

        TPTrainFactory *fac = [[TPTrainFactory alloc] initWithType:TP_Different];
        
        resultTextView.text = [fac result:para];
        
        [para release];
        [fac release];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil 
                                                        message:NSLocalizedString(@"please input max distance", ) 
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"Cancel", ) 
                                              otherButtonTitles: nil];
        [alert show];
        [alert release];
    }

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
