//
//  MyInteractiveTransition.m
//  CustomPushTransition
//
//  Created by Jimmy Lee on 22/11/2013.
//
//

#import "MyInteractiveTransition.h"

@implementation MyInteractiveTransition

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
        UIScreenEdgePanGestureRecognizer *pushGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePushGesture:)];
        pushGesture.edges = UIRectEdgeRight;
        
        id topView = [navigationController topViewController].view;
        [topView addGestureRecognizer:pushGesture];
    }
    return self;
}

- (void)handlePushGesture:(UIScreenEdgePanGestureRecognizer *)recognizer {
    NSLog(@"handlePushGesture:");
    
    UIView *view = _navigationController.topViewController.view;
    CGPoint location = [recognizer locationInView:view];
    CGPoint velocity = [recognizer velocityInView:view];
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan: {
            // We're being invoked via a gesture recognizer – we are necessarily interactive
            self.interactive = YES;
            [_navigationController.topViewController performSegueWithIdentifier:@"showDetail" sender:self.navigationController];
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGFloat ratio = 1.0f - (location.x / CGRectGetWidth(view.bounds));
            NSLog(@"Percentage: %f, Velocity: %f", ratio, velocity.x);
            [self updateInteractiveTransition:ratio];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            NSLog(@"Location: %f, ", location.x);
            
            if ((velocity.x > -200) && (
                                       (velocity.x >= 0.0) ||
                                       (location.x > (view.frame.size.width / 2.0f)) ||
                                       (recognizer.state == UIGestureRecognizerStateCancelled)) ) {
                NSLog(@"cancelInteractiveTransition");
                [self cancelInteractiveTransition];
            }
            else {
                NSLog(@"finishInteractiveTransition");
                [self finishInteractiveTransition];
            }
            self.interactive = NO;
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStatePossible:
        default:
            break;
    }
}

@end
