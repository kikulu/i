//
//  CurrentLocationAnnotation.h
//  DraggableAnnotation
//

#import <MapKit/MapKit.h>

@interface Place : MKPlacemark {
        CLLocationCoordinate2D coordinate;
        NSString *title;
        NSString *subtitle;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

@end