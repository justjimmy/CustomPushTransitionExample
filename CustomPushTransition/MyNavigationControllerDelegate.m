//
//  MyNavigationControllerDelegate.m
//  CustomPushTransition
//
//  Created by Jimmy Lee on 22/11/2013.
//
//

#import "MyNavigationControllerDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MyAnimatedTransition.h"


@interface MyNavigationControllerDelegate ()

@end

@implementation MyNavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    NSLog(@"animationControllerForOperation:");
    
    if ([fromVC class] == [MasterViewController class] && [toVC class] == [DetailViewController class]) {
        return [MyAnimatedTransition new];
    }
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    NSLog(@"interactionControllerForAnimationController:");
    
    if ([animationController class] == [MyAnimatedTransition class]) {
        if (_interactiveTransition && _interactiveTransition.interactive) {
            return _interactiveTransition;
        }
    }
    return nil;
}

@end

