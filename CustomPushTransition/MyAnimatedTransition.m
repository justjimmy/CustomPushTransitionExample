//
//  MyAnimatedTransition.m
//  CustomPushTransition
//
//  Created by Jimmy Lee on 22/11/2013.
//
//

#import "MyAnimatedTransition.h"

@implementation MyAnimatedTransition

static NSTimeInterval const ANIMATION_DURATION = 0.3f;

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return ANIMATION_DURATION;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    UIView *snapshot = [fromViewController.view snapshotViewAfterScreenUpdates:YES];
    [container addSubview:snapshot];
    
    [container addSubview:toViewController.view];
    toViewController.view.transform = CGAffineTransformMakeTranslation(container.frame.size.width, 0);
    

    [UIView animateWithDuration:ANIMATION_DURATION delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [snapshot removeFromSuperview];
            [transitionContext completeTransition:NO];
        }
        else {
            [transitionContext completeTransition:finished];
        }
    }];
}

@end
