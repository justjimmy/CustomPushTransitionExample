//
//  MyInteractiveTransition.h
//  CustomPushTransition
//
//  Created by Jimmy Lee on 22/11/2013.
//
//

#import <UIKit/UIKit.h>

@interface MyInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, weak) UINavigationController *navigationController;
@property (nonatomic) BOOL interactive;
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;
@end
