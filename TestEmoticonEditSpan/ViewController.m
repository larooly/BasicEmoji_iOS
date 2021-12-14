//
//  ViewController.m
//  TestEmoticonEditSpan
//
//  Created by active on 2020/07/30.
//  Copyright © 2020 activeKJS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _testtext2.delegate = self;
    _testtext3.delegate = self;
    _dpdl.delegate = self;
    NSString* k = @"texststdtf  attach bjghuhuhiji";
    NSRange rna= [k rangeOfString:@"tach"];
    if(rna.location != NSNotFound){
       
        
    }
}
- (void)textViewDidChange:(UITextView *)textView{
    if (textView==_testtext3.self) {
        _testtext4.text=_testtext3.attributedText.string;
        NSLog(@"w? %lu",(unsigned long)_testtext3.attributedText.length);
       // NSTextAttachment
    }
    else if (textView==_dpdl.self) {
        [_dpdl scrollRangeToVisible:NSMakeRange(0, 2)];
    }
    else{
       
    [self practiv];
    }
}

- (IBAction)clickbut2:(id)sender {
    //텍스트뷰에 이미지 추가
    //UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,140,140)];
    NSString *nowText = [_dpdl.text stringByAppendingString:@"/하트/"];
    //NSString *nowText = @"/하트/";
    UIFont *font =  [ UIFont systemFontOfSize:20.f ];
    NSDictionary *attrdict = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:nowText attributes:attrdict];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image =[self imageToimage:[UIImage imageNamed:@"an.gif"] scaledTosize:CGSizeMake(20,20)];//[UIImage systemImageNamed:@"tortoise"];//[UIImage imageNamed:@"raini.png"];// [UIImage systemImageNamed:@"tortoise.fill"];//
    
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedString replaceCharactersInRange:NSMakeRange(nowText.length-4,4) withAttributedString:attrStringWithImage];
    _dpdl.attributedText = attributedString;
    
     NSLog(@"@@@@ %f", textAttachment.image.size.height );
}

- (IBAction)clickbut1:(id)sender {
//    _show.text = _dpdl.text;
//    _show.attributedText = _dpdl.attributedText;
    NSMutableString * k = [NSMutableString stringWithString:  _dpdl.text];
    [k appendString:@"/이모티콘/"];
    _dpdl.text = k;
}
-(UIImage *)imageToimage:(UIImage *)image scaledTosize:(CGSize)newSize{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
-(void)practiv{
    //텍스트뷰에 이미지 추가
       //UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,140,140)];
    NSString *nowText = _testtext2.text;
    UIFont *font =  [ UIFont systemFontOfSize:15.f ];
    NSDictionary *attrdict = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:nowText attributes:attrdict];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image =[self imageToimage:[UIImage imageNamed:@"pinky.png"] scaledTosize:CGSizeMake(20,20)];
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    NSAttributedString *replace = attrStringWithImage;// [[NSAttributedString alloc] initWithString:@"/ㅋㅋ/"];
    while ([attributedString.mutableString containsString:@"/ㅋㅋ/"]) {
        NSRange range =[attributedString.mutableString rangeOfString:@"/ㅋㅋ/"];
        [attributedString replaceCharactersInRange:range withAttributedString:replace];
    }
    
    //addd
    NSLog(@"@@@@+ %@", attributedString.description );
    NSLog(@"@@@@- %@", textAttachment );
    
    NSString __block  *total = @"";
    [attributedString enumerateAttributesInRange:NSMakeRange(0,attributedString.length) options:0 usingBlock:^(NSDictionary *attributes, NSRange range, BOOL *stop){
        NSString *v;
        NSLog( @"%@ 입니다",attributes.description);
        NSObject* x= [attributes valueForKey:@"NSAttachment"];
        if(x){//이거 뭔가 좀 이상하다
            NSLog(@"@@@@ %@", [NSString stringWithFormat:@"%@",x]);
            if(textAttachment == x){
                NSLog(@"같음?");
            }
            v=@"/이모티콘/";
            if(v==nil){
                v=@"";
            }
            
        }else{
            v=[attributedString string];
        }
        NSLog(@"%@   @@@@" , v);
        total = [NSString stringWithFormat:@"%@%@",total,v];
    
    }];
    NSLog(@"원상복귀 : %@",total);
    
    _testtext4.text = total;
    
    
    
    
    _show2.attributedText = attributedString;
    _testtext3.attributedText = attributedString;
    
}
@end
//CGFloat oldWidth = textAttachment.image.size.width;

   //I'm subtracting 10px to make the image display nicely, accounting
   //for the padding inside the textView
  // CGFloat scaleFactor = oldWidth / (_dpdl.frame.size.width - 10);
  // NSLog(@"@@@@ %f", textAttachment.image.size.height );
  
   
  // textAttachment.image = [UIImage imageWithCGImage:textAttachment.image.CGImage scale:scaleFactor orientation:UIImageOrientationUp];
   
//  [attributedString replaceCharactersInRange:NSMakeRange(nowText.length-4,4) withAttributedString:attrStringWithImage];

   
   /*
   NSArray *arrayemo = [[NSArray alloc] initWithObjects:@"/하하/", nil];
   for (NSString * emoji in arrayemo) {
       if([nowText containsString:emoji]){
           nowText = [nowText stringByReplacingOccurrencesOfString:emoji withString: @"🐷"];
       }
   }
   _show2.text = nowText;
    */
//[UIImage systemImageNamed:@"tortoise"];//[UIImage imageNamed:@"raini.png"];// [UIImage systemImageNamed:@"tortoise.fill"];//



  // _dpdl.attributedText = attributedString;
   
 //   NSLog(@"@@@@ %f", textAttachment.image.size.height );
