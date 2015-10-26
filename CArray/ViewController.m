//
//  ViewController.m
//  CArray
//
//  Created by trung bao on 22/10/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *index;
@property (weak, nonatomic) IBOutlet UILabel *labelrandom;
@property (weak, nonatomic) IBOutlet UILabel *labelSapxep;

@end

@implementation ViewController
{
    int mang[8][8];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)taomang:(id)sender {
    NSString *ran=[self.index text];
    int x=[ran intValue]+1;
    NSMutableArray *random=[[NSMutableArray alloc] init];
    for (int a=0; a<8; a++) {
        for (int b=0; b<8; b++) {
            [random addObject:[NSString stringWithFormat:@"%d",arc4random_uniform(x)]];
        }
    }
    NSArray *mangrandom=[NSArray arrayWithArray:random];
    NSString *scrren=@"";
    for (int i=0; i<mangrandom.count; i++) {
        scrren=[scrren stringByAppendingString:[NSString stringWithFormat:@"%ld ",(long)[mangrandom[i] integerValue]]];
    }
    self.labelrandom.text=[NSString stringWithString:scrren];
}
-(NSMutableArray *) quickSort: (NSMutableArray *) unsortedDataArray
{
    NSMutableArray *lessArray = [[NSMutableArray alloc] init];
    NSMutableArray *greaterArray =[[NSMutableArray alloc] init];
    if ([unsortedDataArray count] <1)
    {
        return nil;
    }
    int randomPivotPoint = arc4random()%(unsortedDataArray.count);
    int pivotValue = [unsortedDataArray[randomPivotPoint] intValue];
    [unsortedDataArray removeObjectAtIndex:randomPivotPoint];
    for (int i=0; i<unsortedDataArray.count; i++) {
        int num=[unsortedDataArray[i] intValue];
        if (num < pivotValue)
        {
            [lessArray addObject:unsortedDataArray[i]];
        }
        else
        {
            [greaterArray addObject:unsortedDataArray[i]];
        }
    }
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    [sortedArray addObjectsFromArray:[self quickSort:lessArray]];
    [sortedArray addObject:[NSString stringWithFormat:@"%d",pivotValue]];
    [sortedArray addObjectsFromArray:[self quickSort:greaterArray]];
    return sortedArray;
}

- (IBAction)sapxep:(id)sender {
    NSMutableArray *test=[self.labelrandom.text componentsSeparatedByString:@" "];
    NSMutableArray *hoanchinh=[self quickSort:test];
    NSString *chuan =[[NSString alloc] init];
    for (int i=0; i<hoanchinh.count; i++) {
     chuan=[chuan stringByAppendingString:[NSString stringWithFormat:@"%d ",[hoanchinh[i] intValue]]];
    }
    self.labelSapxep.text=[NSString stringWithString:chuan];
}

    
@end

