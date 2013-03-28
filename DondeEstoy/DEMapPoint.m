//
//  DEMapPoint.m
//  DondeEstoy
//
//  Created by Antonio Conde on 2/19/13.
//  Copyright (c) 2013 com.conde. All rights reserved.
//

#import "DEMapPoint.h"

@implementation DEMapPoint
// Sintetizamos las propiedades
@synthesize coordinate, title;

//Inicializador
-(id) initCoordenada:(CLLocationCoordinate2D)c titulo:(NSString *)t {
    self = [super init];
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    return self;
}

//Overrides init
-(id) init {
    return [self initCoordenada:CLLocationCoordinate2DMake(43.07, -89.32) titulo:@"Casa"];
}

@end
