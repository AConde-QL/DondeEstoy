//
//  DEViewController.h
//  DondeEstoy
//
//  Created by Antonio Conde on 2/18/13.
//  Copyright (c) 2013 com.conde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface DEViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    // Variables del Modelo
    CLLocationManager *locationManager;
    
    //Variables de la vista
    IBOutlet MKMapView *mundoView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTextField;
    IBOutlet UISegmentedControl *tipoMapa;
}
// Métodos de instacia
- (void) findLocation;
- (void) foundLocation:(CLLocation *)lugar;
- (IBAction)segmentedControllerValueChanged:(id)sender;

@end
