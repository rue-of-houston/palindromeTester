//
//  ViewController.m
//  palindromeTester
//
//  Created by Andersons on 6/10/17.
//  Copyright © 2017 Rueben Anderson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton * button = (UIButton *) sender;
    
    if (button != nil)
    {
        if (button.tag == 0)
        {
            NSString *text;
            BOOL     isValidStr = false;
            
            if (textField != nil)
            {
                
                NSString *value = [textField text];
                text = [NSString stringWithFormat:@"%@", value];
                
                // validate the string
                isValidStr = [self validateString:text];
                
            }
            else
            {
                text = @"";
            }
            
            // ensure the string is proper format (no spaces!)
            if (isValidStr)
            {
                textField.backgroundColor = [UIColor whiteColor];
                
                BOOL isPalindrome = [self doPalindromeCheck:text];
                
                
                // conditional for the shown message
                if ([text isEqualToString:@""])
                {
                    NSString *msg = @"This is an empty string!";
                    NSLog(@"%@", msg);
                    [self showAlert:msg];
                }
                else if (isPalindrome)
                {
                    NSString *msg = @"This is a palindrome!";
                    NSLog(@"%@", msg);
                    [self showAlert:msg];
                }
                else
                {
                    NSString *msg = @"This is not a palindrome!";
                    NSLog(@"%@", msg);
                    [self showAlert:msg];
                }
            }
            else
            {
                textField.backgroundColor = [UIColor redColor];
                NSString *msg = @"Input cannot contain white spaces!";
                NSLog(@"%@", msg);
                [self showAlert:msg];
            }
        }
    }
}



#pragma support functions below

-(BOOL) doPalindromeCheck:(NSString *) text
{
    BOOL result = false;
    NSUInteger textLen = [text length];
    unichar buffer[textLen];
    
    if (text != nil)
    {
        NSRange range = NSMakeRange(0, textLen);
        [text getCharacters:buffer range:range];
        
        NSMutableString * forward = [[NSMutableString alloc]init];
        NSMutableString * backward = [[NSMutableString alloc]init];
        
        for (int i = 0; i < textLen; i++)
        {
            // create seperate strings of the text forward and backward
            [forward appendString:[NSString stringWithFormat:@"%C", buffer[i]]];
            [backward appendString:[NSString stringWithFormat:@"%C", buffer[textLen - (i + 1)]]];
        }
        
        // get the lowecase versions
         NSString *fwdStr = [forward lowercaseString];
         NSString *bwdStr = [backward lowercaseString];
        
        if ([fwdStr isEqualToString:bwdStr])
        {
            // check for empty string || a false positive
            if (![fwdStr isEqualToString:@""] || ![bwdStr isEqualToString:@""])
            {
                result = true;
            }
        }
        
    }
    
    
    return result;
}



-(BOOL) validateString:(NSString *) text
{
    BOOL isValidStr = false;
    NSError *error;
    NSString * pattern = @"\\s+";
    
    // create a regex object with the given pattern
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    // capture the number of matches
    NSUInteger matches = [regex numberOfMatchesInString:text options:0 range:NSMakeRange(0, [text length])];
    
    if (matches == 0)
    {
        isValidStr = true;
    }
    
    return isValidStr;
}



-(void) showAlert:(NSString *) text
{
    
    // create the alert view
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Palindrome Result" message:text preferredStyle:UIAlertControllerStyleAlert];
    
    // create the alert action
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    
    // add the action to the view
    [alert addAction:action];
    
    //show the new alert view
    [self presentViewController:alert animated:true completion:nil];
}


@end
