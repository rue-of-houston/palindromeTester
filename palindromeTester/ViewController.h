//
//  ViewController.h
//  palindromeTester
//
//  Created by Andersons on 6/10/17.
//  Copyright © 2017 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 
{
    IBOutlet UITextField *textField;
}

-(BOOL) doPalindromeCheck:(NSString *) text;
-(BOOL) validateString:(NSString *) text;
-(void) showAlert:(NSString *) text;
@end

