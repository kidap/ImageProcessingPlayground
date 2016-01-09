//: Playground - noun: a place where people can play

import UIKit



let image = UIImage(named: "sample")


/*----------------------------------------------------------------------------------------------------------------------------------*/
// Enumeration: Filters
/*----------------------------------------------------------------------------------------------------------------------------------*/
enum filter:String{
    case grayscale = "grayscale"
    case brightness = "brightness"
    case contrast = "contrast"
    case sepia = "sepia"
    case transparency = "transparency"
}

/*----------------------------------------------------------------------------------------------------------------------------------*/
// Class: Image Processor
/*----------------------------------------------------------------------------------------------------------------------------------*/
class ImageProcessor {
    var image: UIImage
    
    
    init(image:UIImage){
        self.image = image
    }
    
    //func applyFilter( filterByFunction: (Int)->UIImage, _ intensity: Int = 100) ->UIImage{
    //    return filterByFunction(intensity
    //}
    
    // Multiple filters from Enumeration
    func applyFilters(filterTypes filters: (type:filter,intensity:Int)...) ->UIImage{
        for filter in filters{
            applyFilter(filterType: filter.type, intensity: filter.intensity)
        }
        return self.image
    }
    
    // Multiple filters from String
    func applyFilters(filterTypes filters: (type:String,intensity:Int)...) ->UIImage{
        for filter in filters{
            applyFilter(filterType: filter.type, intensity: filter.intensity)
        }
        return self.image
    }
    
    // Apple filter from String
    func applyFilter( filterType filterName: String) ->UIImage{
        switch(filterName.lowercaseString){
        case filter.grayscale.rawValue:
            return filter1()
        case filter.brightness.rawValue:
            return filter2()
        case filter.contrast.rawValue:
            return filter3()
        case filter.sepia.rawValue:
            return filter4()
        case filter.transparency.rawValue:
            return filter5()
        default: return self.image
        }
    }
    
    // Apply filter from String, with intensity
    func applyFilter( filterType filterName: String, intensity: Int) ->UIImage{
        switch(filterName.lowercaseString){
        case filter.grayscale.rawValue:
            return filter1(intensity)
        case filter.brightness.rawValue:
            return filter2(intensity)
        case filter.contrast.rawValue:
            return filter3(intensity)
        case filter.sepia.rawValue:
            return filter4(intensity)
        case filter.transparency.rawValue:
            return filter5(intensity)
        default: return self.image
        }
    }
    
    // Apple filter from Enumeration
    func applyFilter( filterType filterName: filter) ->UIImage{
        switch(filterName){
        case .grayscale:
            return filter1()
        case .brightness:
            return filter2()
        case .contrast:
            return filter3()
        case .sepia:
            return filter4()
        case .transparency:
            return filter5()
        }
    }
    
    // Apply filter from Enumeration, with intensity
    func applyFilter( filterType filterName: filter, intensity: Int) ->UIImage{
        
        switch(filterName){
        case .grayscale:
            return filter1(intensity)
        case .brightness:
            return filter2(intensity)
        case .contrast:
            return filter3(intensity)
        case .sepia:
            return filter4(intensity)
        case .transparency:
            return filter5(intensity)
        }
    }
    
    /*---------------------------------------------------*/
    // Methods: Filters
    /*---------------------------------------------------*/
    
    //Grayscale
    func filter1(intensity: Int = 50) -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let red: Double = Double(pixel.red)
                let green: Double = Double(pixel.green)
                let blue: Double = Double(pixel.blue)
                
                //Apply filter
                let newRed : Double = 0.2989 * red + 0.5870 * green + 0.1140 * blue
                let newGreen : Double = 0.2989 * red + 0.5870 * green + 0.1140 * blue
                let newBlue : Double = 0.2989 * red + 0.5870 * green + 0.1140 * blue
                
                //Apply intensity
                pixel.red = UInt8(max(0,min(255,(newRed * Double(intensity+50) / 100))))
                pixel.green = UInt8(max(0,min(255,(newGreen * Double(intensity+50) / 100))))
                pixel.blue = UInt8(max(0,min(255,(newBlue * Double(intensity+50) / 100))))
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        self.image = myRGBA.toUIImage()!
        return self.image
    }
    
    //Brightness
    func filter2(intensity: Int = 100) -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let red: Double = Double(pixel.red)
                let green: Double = Double(pixel.green)
                let blue: Double = Double(pixel.blue)
                
                //Apply filter and intensity
                pixel.red = UInt8(max(0, min(255, (red * ( Double(intensity+50)) / 100))))
                pixel.green = UInt8(max(0, min(255, (green * (Double(intensity+50)) / 100))))
                pixel.blue = UInt8(max(0, min(255, (blue * (Double(intensity+50)) / 100))))

                myRGBA.pixels[index] = pixel
            }
        }
        
        self.image = myRGBA.toUIImage()!
        return self.image
    }
    
    //Contrast
    func filter3(intensity: Int = 100) -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        let contrast: Double = ( Double(intensity) / 100 ) * 510 - 255
        let factor: Double = ( 259 * ( contrast + 255 ) ) / ( 255 * ( 259 - contrast ) )
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let red: Double = Double(pixel.red)
                let green: Double = Double(pixel.green)
                let blue: Double = Double(pixel.blue)
                
                //Apply filter and intensity
                pixel.red = UInt8(max(0, min(255, (factor * (red - 128)) + 128 )))
                pixel.green = UInt8(max(0, min(255, (factor * (green - 128)) + 128 )))
                pixel.blue = UInt8(max(0, min(255, (factor * (blue - 128)) + 128 )))
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        self.image = myRGBA.toUIImage()!
        return self.image
    }
    
    //Sepia
    func filter4(intensity: Int = 50) -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let red: Double = Double(pixel.red)
                let green: Double = Double(pixel.green)
                let blue: Double = Double(pixel.blue)
                
                //Apply filter
                let newRed : Double = 0.393 * red + 0.769 * green + 0.189 * blue
                let newGreen : Double = 0.349 * red + 0.686 * green + 0.168 * blue
                let newBlue : Double = 0.272 * red + 0.534 * green + 0.131 * blue
                
                //Apply intensity
                pixel.red = UInt8(max(0,min(255,(newRed * Double(intensity+50) / 100))))
                pixel.green = UInt8(max(0,min(255,(newGreen * Double(intensity+50) / 100))))
                pixel.blue = UInt8(max(0,min(255,(newBlue * Double(intensity+50) / 100))))
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        self.image = myRGBA.toUIImage()!
        return self.image
    }
    
    //Transparency
    func filter5(intensity: Int = 75) -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                
                pixel.alpha = UInt8(max(0,min(255,(255 * Double(100-intensity) / 100))))
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        self.image = myRGBA.toUIImage()!
        return self.image
    }
}


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


/*
Your Playground code should fulfill the following project requirements:

1. Be able to apply a filter formula to each pixel of the image.
2. The formula should have parameters that can be modified so that the filter can have a small or large effect on the image.
3. Be able to apply several different filters to the image, in a specific order (e.g. a ‘pipeline of filters’). These could be different formulas (e.g. brightness vs. contrast) or could be the same formula with different parameters.
4. Have some method or interface to apply default filter formulas and parameters that can be accessed by name.

The fun part is that you may decide for yourself exactly what type of calculations you would like to apply to the image pixels – e.g. brightness, contrast, gray-scale, etc. You may want to look up more advance calculations on the Internet for ideas. But a simple formula like the one covered in the Image Processing lecture is fine.

You must also decide on the exact architecture of the ‘app'. Try to break up the code into logical functional parts using structs and classes, wherever you think it’s most appropriate. To get you started, we recommend you think about implementing an ImageProcessing class/struct that can manage and apply your Filter class/struct instances to the image.


STEP 1: We provide an image and starter code
• In this assignment we are providing the starter code.
• Download the starter project (download link will be provided in the peer assessment section)

STEP 2: Create a simple filter
• Start by writing some code to apply a basic filter formula to each pixel in the image and test it.

STEP 3: Create the image processor
• Encapsulate your chosen Filter parameters and/or formulas in a struct/class definition.
• Create and test an ImageProcessor class/struct to manage an arbitrary number Filter instances to apply to an image. It should allow you to specify the order of application for the Filters.

STEP 4: Create predefined filters
• Create five reasonable default Filter configurations (e.g. "50% Brightness”, “2x Contrast”), and provide an interface to access instances of such defaults by name. (e.g. could be custom subclasses of a Filter class, or static instances of Filter available in your ImageProcessor interface, or a Dictionary of Filter instances). There is no requirement to do this in a specific manner, but it’s good to think about the different ways you could go about it.

STEP 5: Apply predefined filters
• In the ImageProcessor interface create a new method to apply a predefined filter giving its name as a String parameter. The ImageProcessor interface should be able to look up the filter and apply it.


SUBMISSION: Zip your .playground file and upload it to your submission. Your peer reviewers will download your zipped file and test in their playground.

TIP: Playgrounds are a safe space, they can only access the files within the playground (you cannot access files outside of the playground).

*/
