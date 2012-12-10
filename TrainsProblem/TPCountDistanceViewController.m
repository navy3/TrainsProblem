//
//  TPCountDistanceViewController.m
//  TrainsProblem
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 freelancer. All rights reserved.
//

#import "TPCountDistanceViewController.h"
#import "TPTrainFactory.h"

#define kBaseTag    1000

@interface TPCountDistanceViewController ()

@property (nonatomic, retain) UITextView *inputTextView;
@property (nonatomic, retain) UITextView *resultTextView;
@property (nonatomic, retain) NSArray *ctrlArray;
@end

@implementation TPCountDistanceViewController

@synthesize inputTextView,resultTextView,ctrlArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Distance", @"Distance");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)buildUI
{
    self.inputTextView = [[[UITextView alloc] initWithFrame:CGRectMake(20, 20, 280, 100)] autorelease];
    //inputTextView.backgroundColor = [UIColor lightGrayColor];
    inputTextView.editable = NO;
    [self.view addSubview:inputTextView];
    
    self.ctrlArray = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E", nil];
    for (int i = 0; i < [ctrlArray count]; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setFrame:CGRectMake(20 + 60*i, 130, 40, 40)];
        [btn setTitle:[ctrlArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = kBaseTag + i;
        [self.view addSubview:btn];
    }
    
    self.resultTextView = [[[UITextView alloc] initWithFrame:CGRectMake(20, 180, 280, 100)] autorelease];
    resultTextView.editable = NO;
    [self.view addSubview:resultTextView];
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clearBtn setFrame:CGRectMake(20, 290, 120, 40)];
    [clearBtn setTitle:NSLocalizedString(@"Clear",) forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];
    
    UIButton *resultBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [resultBtn setFrame:CGRectMake(180, 290, 120, 40)];
    [resultBtn setTitle:NSLocalizedString(@"Result",) forState:UIControlStateNormal];
    [resultBtn addTarget:self action:@selector(resultAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resultBtn];
}

- (void)btnAction:(id)sender
{
    int index  = [(UIButton *)sender tag] - kBaseTag;
    if ([inputTextView.text length]) {
        inputTextView.text = [NSString stringWithFormat:@"%@-%@",inputTextView.text,[ctrlArray objectAtIndex:index]];
    }
    else {
        inputTextView.text = [ctrlArray objectAtIndex:index];
    }

}

- (void)resultAction:(id)sender
{
    TPTrainParameter *para = [[TPTrainParameter alloc] init];
    para.inputArray = [NSMutableArray arrayWithArray:[inputTextView.text componentsSeparatedByString:@"-"]];

    TPTrainFactory *fac = [[TPTrainFactory alloc] initWithType:TP_Distance];
    resultTextView.text = [fac result:para];
    
    [para release];
    [fac release];
}

- (void)clearAction:(id)sender
{
    inputTextView.text = nil;
    resultTextView.text = nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    [self buildUI];

}

- (void)dealloc
{
    TP_RELEASE(inputTextView);
    TP_RELEASE(resultTextView);
    TP_RELEASE(ctrlArray);
    [super dealloc];
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
