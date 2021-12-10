//
//  ViewController.h
//  TestEmoticonEditSpan
//
//  Created by active on 2020/07/30.
//  Copyright © 2020 activeKJS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *show;
@property (weak, nonatomic) IBOutlet UIButton *but1;
@property (weak, nonatomic) IBOutlet UIButton *but2;
@property (weak, nonatomic) IBOutlet UITextView *dpdl;
@property (weak, nonatomic) IBOutlet UITextView *testtext3;

- (IBAction)clickbut1:(id)sender;
- (IBAction)clickbut2:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *testtext4;
@property (weak, nonatomic) IBOutlet UITextView *testtext2;
@property (weak, nonatomic) IBOutlet UILabel *show2;

@end

