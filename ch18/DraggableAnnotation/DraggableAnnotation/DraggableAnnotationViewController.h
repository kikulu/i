//
//  DraggableAnnotationViewController.h
//  DraggableAnnotation
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface DraggableAnnotationViewController : UIViewController<UIAlertViewDelegate, CLLocationManagerDelegate, MKMapViewDelegate> {
    CLLocationManager   *locationMgr;
    CLLocation          *currentLocation;
    MKMapView           *mapView;
}

@property (nonatomic, retain) CLLocationManager  *locationMgr;
@property (nonatomic, retain) CLLocation         *currentLocation;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;


@end
