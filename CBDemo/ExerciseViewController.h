//
//  ExerciseExerciseViewController.h
//  Ardency
//
//  Created by Lin Zhang on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ExerciseViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{    
	// the map view
	MKMapView* _mapView;
	
    // routes points
    NSMutableArray* _points;
    
	// the data representing the route points. 
	MKPolyline* _routeLine;
	
	// the view we create for the line on the map
	MKPolylineView* _routeLineView;
	
	// the rect that bounds the loaded points
	MKMapRect _routeRect;
    
    // location manager
    CLLocationManager *_locationManager;    
    
    // current location
    CLLocation *currentLocation;
    
    NSTimer *timer;
    int timestamp;
}

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) MKMapView* mapView;
@property (nonatomic, retain) NSMutableArray* points;
@property (nonatomic, retain) MKPolyline* routeLine;
@property (nonatomic, retain) MKPolylineView* routeLineView;
@property (nonatomic, retain) CLLocationManager* locationManager;

-(void) configureRoutes;

@end
