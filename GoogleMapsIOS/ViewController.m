//
//  ViewController.m
//  GoogleMapsIOS
//
//  Created by Pablo Robles Sánchez on 3/15/15.
//  Copyright (c) 2015 Pablo Robles Sánchez. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController () {
    GMSMapView *mapView_;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.place = [[NSArray alloc] initWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"GeoPList" ofType:@"plist"]];
    NSLog(@"Abri el property list");
    NSString *latitud = [[self.place objectAtIndex:self.row] objectForKey:@"latitud"];
    NSString *longitud = [[self.place objectAtIndex:self.row] objectForKey:@"longitud"];
    //NSDecimalNumber *lat = [NSDecimalNumber decimalNumberWithString:latitud];
    //NSDecimalNumber *lon = [NSDecimalNumber decimalNumberWithString:longitud];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[latitud doubleValue]
                                                            longitude:[longitud doubleValue]
                                                                 zoom:19];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake([latitud doubleValue], [longitud doubleValue]);
    //NSString *titulo = [[NSString alloc] initWithFormat:[[self.place objectAtIndex:self.row] objectForKey:@"nombre"]];
    marker.title = [[self.place objectAtIndex: self.row] objectForKey:@"nombre"];
    marker.snippet = [[self.place objectAtIndex: self.row] objectForKey:@"etiqueta"];
    marker.map = mapView_;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
