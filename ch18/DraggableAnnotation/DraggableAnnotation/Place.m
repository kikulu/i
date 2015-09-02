//
//  CurrentLocationAnnotation.m
//  DraggableAnnotation
//

#import "Place.h"

@implementation Place

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coord addressDictionary:(NSDictionary *)addressDictionary {
	
	if ((self = [super initWithCoordinate:coord addressDictionary:addressDictionary])) {
		self.coordinate = coord;
	}
	return self;
}
@end
