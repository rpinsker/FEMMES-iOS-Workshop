//
//  MainViewController.m
//  FEMMESWorkshop
//
//  Created by Rachel Pinsker on 4/14/15.
//  Copyright (c) 2015 ___rpinsker___. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *sv;
@property (nonatomic, strong) NSMutableArray *labelsArray;
@property (nonatomic, strong) NSMutableArray *backgroundViewsArray;

@end

#define NUMBER_OF_SCREENS 5

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // make variables for screen dimensions
    CGFloat screenHeight = self.view.frame.size.height;
    CGFloat screenWidth = self.view.frame.size.width;
    
    // make the labels
    self.labelsArray = [[NSMutableArray alloc] init];
    for (int i = 1; i <= NUMBER_OF_SCREENS; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((i-1)*screenWidth, 0, screenWidth, screenHeight)];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 3;
        [self.labelsArray addObject:label];
    }
    UILabel *label1 = self.labelsArray[0];
    UILabel *label2 = self.labelsArray[1];
    UILabel *label3 = self.labelsArray[2];
    UILabel *label4 = self.labelsArray[3];
    UILabel *label5 = self.labelsArray[4];
    
    // make the scroll view
    self.sv = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.sv.contentSize = CGSizeMake(screenWidth * NUMBER_OF_SCREENS, screenHeight);
    self.sv.delegate = self;
    self.sv.scrollEnabled = YES;
    self.sv.pagingEnabled = YES;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] init];
    tapGR.numberOfTapsRequired = 1;
    [tapGR addTarget:self action:@selector(backgroundTapped)];
    [self.sv addGestureRecognizer:tapGR];
    
    // make the background color rectangles
    self.backgroundViewsArray = [[NSMutableArray alloc] init];
    for (int i = 1; i <= NUMBER_OF_SCREENS; i++) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake((i-1)*screenWidth, 0, screenWidth, screenHeight)];
        [self.backgroundViewsArray addObject:backgroundView];
    }
    UIView *backgroundView1 = self.backgroundViewsArray[0];
    UIView *backgroundView2 = self.backgroundViewsArray[1];
    UIView *backgroundView3 = self.backgroundViewsArray[2];
    UIView *backgroundView4 = self.backgroundViewsArray[3];
    UIView *backgroundView5 = self.backgroundViewsArray[4];
    
    // add the subviews to the view and the scrollview
    [self.view addSubview:self.sv];
    for (UIView *v in self.backgroundViewsArray) {
        [self.sv addSubview:v];
    }
    for (UILabel *l in self.labelsArray) {
        [self.sv addSubview:l];
    }
    
    /*****************************************/
    /*****************************************/
    /*****************************************/
    /*** Play around with colors and text! ***/
    
    /* SCREEN 1 */
    label1.text = @"Hello World!";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont fontWithName:@"AvenirNext-Medium" size:40.0];
    
    backgroundView1.backgroundColor = [UIColor colorWithRed:.5 green:.2 blue:.2 alpha:.6];
    
    /* END SCREEN 1 */
    
    /* SCREEN 2 */
    NSString *myName = @"Rachel";
    label2.text = [NSString stringWithFormat:@"My name is %@",myName];
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont fontWithName:@"SavoyeLetPlain" size:40.0];
    
    
    backgroundView2.backgroundColor = [UIColor colorWithRed:0 green:.9 blue:.5 alpha:.4];
    
    /* END SCREEN 2 */
    
    /* SCREEN 3 */
    int myAge = 20;
    label3.text = [NSString stringWithFormat:@"I am %d years old",myAge];
    label3.textColor = [UIColor darkGrayColor];
    label3.font = [UIFont fontWithName:@"ChalkboardSE-Bold" size:23.0];
    
    backgroundView3.backgroundColor = [UIColor colorWithRed:.5 green:0 blue:.5 alpha:.4];
    
    /* END SCREEN 3 */
    
    /* SCREEN 4 */
    NSString *mySchool = @"The University of Chicago";
    label4.text = [NSString stringWithFormat:@"I go to school at %@",mySchool];
    label4.textColor = [UIColor darkGrayColor];
    label4.font = [UIFont fontWithName:@"AmericanTypewriter" size:23.0];
    
    backgroundView4.backgroundColor = [UIColor colorWithRed:.8 green:.3 blue:0 alpha:.7];
    
    /* END SCREEN 4 */
    
    /* SCREEN 5 */
    label5.text = @"Goodbye!";
    label5.textColor = [UIColor colorWithRed:0.0 green:.3 blue:0.0 alpha:.8];
    label5.font = [UIFont fontWithName:@"Noteworthy-Bold" size:40.0];

    backgroundView5.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:0 alpha:.5];
    
    /* END SCREEN 5 */
    
}

- (void) backgroundTapped
{
    CGFloat screenWidth = self.view.frame.size.width;
    CGFloat currentX = self.sv.contentOffset.x;
    int currentPageNumber = currentX/screenWidth + 1;
    
    UIView *currentView = self.backgroundViewsArray[currentPageNumber - 1];
    
    // generate 3 random numbers between 0.0 and 1.0 for the red, green, and blue values
    float red = (float)rand() / (float) RAND_MAX;
    float green = (float)rand() / (float) RAND_MAX;
    float blue = (float)rand() / (float) RAND_MAX;
    float alpha = (float) rand() / 2.0*(float) RAND_MAX + .5;
    
    if (red > 1.0) red = 1.0;
    if (blue > 1.0) blue = 1.0;
    if (green > 1.0) green = 1.0;
    if (alpha > 1.0) alpha = 1.0;

    [currentView setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:alpha]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
