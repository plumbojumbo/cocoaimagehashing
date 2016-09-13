//
//  OSDHash.m
//  CocoaImageHashing
//
//  Created by Andreas Meingast on 10/10/15.
//  Copyright © 2015 Andreas Meingast. All rights reserved.
//

#import "OSCategories.h"
#import "OSDHash.h"
#import "OSFastGraphics.h"

static const NSUInteger OSDHashImageWidthInPixels = 8;
static const NSUInteger OSDHashImageHeightInPixels = 8;
static const OSHashDistanceType OSDHashDistanceThreshold = 8;

@implementation OSDHash

#pragma mark - OSImageHashing Protocol

- (OSHashType)hashImageData:(NSData *)imageData
{
    NSAssert(imageData, @"Image data must not be null");
    NSData *pixels = [imageData RGBABitmapDataForResizedImageWithWidth:OSDHashImageWidthInPixels
                                                             andHeight:OSDHashImageHeightInPixels];
    if (!pixels) {
        return OSHashTypeError;
    }
    OSHashType result = dhash_rgba_8_8([pixels bytes]);
    return result;
}

- (OSHashDistanceType)hashDistanceSimilarityThreshold
{
    return OSDHashDistanceThreshold;
}

@end
