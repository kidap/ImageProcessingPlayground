//: Playground - noun: a place where people can play

import UIKit


let image = UIImage(named: "sample")

/*----------------------------------------------------------------------------------------------------------------------------------*/
//  Parameters for each filter formula that can change the intensity of the effect of the filter
//      ->intensity 0-100
/*----------------------------------------------------------------------------------------------------------------------------------*/
let imageProc = ImageProcessor(image: image!)
imageProc.applyFilter(filterType: filter.brightness, intensity: 100)


/*----------------------------------------------------------------------------------------------------------------------------------*/
// Interface to specify the order and parameters for an arbitrary number of filter calculations that should be applied to an image
/*----------------------------------------------------------------------------------------------------------------------------------*/
// Apply 2 filters
let imageProcMultipleFilters = ImageProcessor(image: image!)
imageProcMultipleFilters.applyFilters(filterTypes: (type: "Grayscale", intensity: 80),(type: "Contrast", intensity: 80))

// Apply 3 filters
let imageProcMultipleFilters2 = ImageProcessor(image: image!)
imageProcMultipleFilters2.applyFilters(filterTypes: (type: filter.sepia, intensity: 100),(type: filter.brightness, intensity: 70),(type: filter.transparency, intensity: 50))


/*----------------------------------------------------------------------------------------------------------------------------------*/
// Interface to apply specific default filter formulas/parameters to an image, by specifying each configuration’s name as a String
/*----------------------------------------------------------------------------------------------------------------------------------*/
let imageProcDefaultFilter = ImageProcessor(image: image!)
imageProcDefaultFilter.applyFilter(filterType: "SEPIA")

let imageProcDefaultFilter2 = ImageProcessor(image: image!)
imageProcDefaultFilter2.applyFilter(filterType: filter.contrast)
