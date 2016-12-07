//
//  ViewController.m
//  批量修改文件名
//
//  Created by 刘伟强 on 2016/12/7.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@property (weak) IBOutlet NSTextField *text1;


@property (weak) IBOutlet NSTextField *text3;
@property (weak) IBOutlet NSTextField *text4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)okbtn:(id)sender {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray * dataArr = [[NSArray alloc] initWithArray:[fileManager contentsOfDirectoryAtPath:[NSString stringWithFormat:@"%@",self.text1.stringValue ] error:nil]];
    
    for (NSString *str in dataArr) {
        
  
        if ([str containsString:self.text3.stringValue]) {
            NSString *newName = [str stringByReplacingOccurrencesOfString:self.text3.stringValue withString:self.text4.stringValue];
            NSString *oldPath = [NSString stringWithFormat:@"%@/%@",self.text1.stringValue,str];
            NSString *newPath = [NSString stringWithFormat:@"%@/%@",self.text1.stringValue,newName];
            [fileManager moveItemAtPath:oldPath toPath:newPath error:nil];
        }
 
    }
}


@end
