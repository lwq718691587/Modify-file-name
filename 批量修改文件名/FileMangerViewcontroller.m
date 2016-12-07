//
//  FileMangerViewcontroller.m
//  批量修改文件名
//
//  Created by 刘伟强 on 2016/12/7.
//  Copyright © 2016年 刘伟强. All rights reserved.
//

#import "FileMangerViewcontroller.h"

@interface FileMangerViewcontroller ()
@property (weak) IBOutlet NSTextField *starNmuber;

@property (weak) IBOutlet NSTextField *filepatch;

@property (weak) IBOutlet NSTextField *name_new1;
@property (weak) IBOutlet NSTextField *name_new2;



@end

@implementation FileMangerViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}
- (IBAction)okbtn:(id)sender {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray * dataArr = [[NSArray alloc] initWithArray:[fileManager contentsOfDirectoryAtPath:[NSString stringWithFormat:@"%@",self.filepatch.stringValue] error:nil]];
    int index = [self.starNmuber.stringValue intValue];
 
    for (NSString *str in dataArr) {
        if (![str hasPrefix:@"."]) {
          
            NSString *oldPatch = [NSString stringWithFormat:@"%@/%@",self.filepatch.stringValue,str];
            NSString *newPatch = [NSString stringWithFormat:@"%@/%@%d%@",self.filepatch.stringValue,self.name_new1.stringValue,index,self.name_new2.stringValue];
            [fileManager moveItemAtPath:oldPatch toPath:newPatch error:nil];
              index++;
        }

    }
}

@end
