//
//  DEViewController.m
//  DondeEstoy
//
//  Created by Antonio Conde on 2/18/13.
//  Copyright (c) 2013 com.conde. All rights reserved.
//

#import "DEViewController.h"
#import "DEMapPoint.h"

@implementation DEViewController
// Metodos de instancia
// Inicializador de vista
-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Crea el objeto location manager
        locationManager = [[CLLocationManager alloc] init];
        // Establece el delegado que recibira el mensaja cuando se encuentre la posición
        [locationManager setDelegate:self];
        // Establece la precision (accuracy) a la mejor posible
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    return self;
}
// viewDidLoad -> se ejecuta cuando se termina de cargar la vista
- (void) viewDidLoad {
    [mundoView setShowsUserLocation:YES];
}

// Detecta el pulsado del boton para cambiar el tipo de mapa
- (IBAction)segmentedControllerValueChanged:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            [mundoView setMapType:MKMapTypeStandard];
            break;
        case 1:
            [mundoView setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [mundoView setMapType:MKMapTypeHybrid];
            break;
    }
}

// findLocation
- (void)findLocation {
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTextField setHidden:YES];
}
// founLocation
- (void) foundLocation:(CLLocation *)lugar {
    CLLocationCoordinate2D c = [lugar coordinate];
    // Crea un objeto mapPoint
    DEMapPoint *mp = [[DEMapPoint alloc] initCoordenada:c titulo:[locationTextField text]];
    // Lo agrega al mapa
    [mundoView addAnnotation:mp];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(c, 500, 500);
    [mundoView setRegion:region animated:YES];
    // Reset el UI
    [locationTextField setText:@""];
    [activityIndicator stopAnimating];
    [locationTextField setHidden:NO];
    [locationManager stopUpdatingLocation];
}


// Delegados de locationManager
// Delegado que recibirá el mensaje de locationManager
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    // Segundos desde que se creo la nueva localización
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    if (t < -180) {     // Hace mas de tres minutos, ignorar son datos de cache
        return;
    }
    [self foundLocation:newLocation];
}
// Delegado que recibirá un error (si se produce) en el posicionamiento de locationManager
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"No se puede encontrar la localización: %@", error);
}

// Delecagos de MKMapView
// Recibe un mensaje cuando MapViw ha terminado de actualizar la posición del usuario
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D centro = [userLocation coordinate];
    MKCoordinateRegion area = MKCoordinateRegionMakeWithDistance(centro, 5000, 5000);
    [mundoView setRegion:area animated:YES];
}

// Delegados de UITextField
// Ha terminado de introducir y manda el texto
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}
@end
