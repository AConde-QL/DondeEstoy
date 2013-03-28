//
//  DEMapPoint.h
//  DondeEstoy
//
//  Created by Antonio Conde on 2/19/13.
//  Copyright (c) 2013 com.conde. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface DEMapPoint : NSObject <MKAnnotation>
{
}
// Inicializador designado
- (id) initCoordenada:(CLLocationCoordinate2D)c titulo:(NSString *)t;

//Propiedades
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;      // Requerida por MKAnnotation
@property (nonatomic, copy) NSString *title;                           // Opcional por MKAnnotation


@end
