//
//  DetailViewController.h
//  CustomPushTransition
//
//  Created by Jimmy Lee on 22/11/2013.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
