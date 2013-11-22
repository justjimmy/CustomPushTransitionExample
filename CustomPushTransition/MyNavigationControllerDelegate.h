//
//  MyNavigationControllerDelegate.h
//  CustomPushTransition
//
//  Created by Jimmy Lee on 22/11/2013.
//
//

#import <Foundation/Foundation.h>
#import "MyInteractiveTransition.h"

@interface MyNavigationControllerDelegate : NSObject<UINavigationControllerDelegate>
@property (nonatomic, strong) MyInteractiveTransition *interactiveTransition;
@end
