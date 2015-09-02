//
//  DraggableAnnotationAppDelegate.h
//  DraggableAnnotation
//

#import <UIKit/UIKit.h>

@class DraggableAnnotationViewController;

@interface DraggableAnnotationAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DraggableAnnotationViewController *viewController;

@end
