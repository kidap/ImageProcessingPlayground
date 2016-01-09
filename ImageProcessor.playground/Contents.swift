//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

// Process the image!


class ImageProcessor {
    var image: UIImage
    
    
    init(image:UIImage){
        self.image = image
    }
    
    func applyFilter( filterByFunction: ()->UIImage) ->UIImage{
        return filterByFunction()
    }
    func applyFilter( filterByName filterName: String) ->UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        switch(filterName){
        case "Hello":
            break
        
        default: break
        }
        
        return myRGBA.toUIImage()!
    }
    func filter1() -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        let avgRed = 122
        let avgGreen = 133
        let avgBlue = 51
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                pixel.alpha = pixel.alpha / 2
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        return myRGBA.toUIImage()!
    }
    
    //Grayscale
    func filter2() -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                
                var red: Double = Double(pixel.red)
                var blue: Double = Double(pixel.blue)
                var green: Double = Double(pixel.green)
                var alpha: Double = Double(pixel.alpha)
                
                pixel.green = UInt8(0.2989 * red + 0.5870 * green + 0.1140 * blue)
                pixel.blue = UInt8(0.2989 * red + 0.5870 * green + 0.1140 * blue)
                pixel.red = UInt8(0.2989 * red + 0.5870 * green + 0.1140 * blue)
                
                /*
                pixel.green = UInt8(max(0, min(255, green / 2)))
                pixel.blue = UInt8(max(0, min(255, blue / 2 )))
                pixel.red = UInt8(max(0, min(255, red / 2)))
                //pixel.alpha = pixel.alph
                */
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        return myRGBA.toUIImage()!
    }

    // Brighten
    func filter3() -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                
                var red: Double = Double(pixel.red)
                var blue: Double = Double(pixel.blue)
                var green: Double = Double(pixel.green)
                var alpha: Double = Double(pixel.alpha)
                

                pixel.green = UInt8(max(0, min(255, green + 50)))
                pixel.blue = UInt8(max(0, min(255, blue + 50 )))
                pixel.red = UInt8(max(0, min(255, red + 50)))
                //pixel.alpha = pixel.alph
 
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        return myRGBA.toUIImage()!
    }
    
    // Red
    func filter4() -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                
                var red: Double = Double(pixel.red)
                var blue: Double = Double(pixel.blue)
                var green: Double = Double(pixel.green)
                var alpha: Double = Double(pixel.alpha)
                
                
                pixel.green = UInt8(max(0, min(255, green - 50)))
                pixel.blue = UInt8(max(0, min(255, blue + 50 )))
                pixel.red = UInt8(max(0, min(255, red + 50)))
                //pixel.alpha = pixel.alph
                
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        return myRGBA.toUIImage()!
    }
    
    // Red
    func filter5() -> UIImage{
        let myRGBA = RGBAImage(image: self.image)!
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                
                var red: Double = Double(pixel.red)
                var blue: Double = Double(pixel.blue)
                var green: Double = Double(pixel.green)
                var alpha: Double = Double(pixel.alpha)
                
                
                pixel.green = UInt8(max(0, min(255, green )))
                pixel.blue = UInt8(max(0, min(255, blue + green - red )))
                pixel.red = UInt8(max(0, min(255, red - green)))
                //pixel.alpha = pixel.alph
                
                
                myRGBA.pixels[index] = pixel
            }
        }
        
        return myRGBA.toUIImage()!
    }
}


let imageProc = ImageProcessor(image: image!)

var processedImage = imageProc.applyFilter(imageProc.filter2)

processedImage = imageProc.applyFilter(imageProc.filter3)

processedImage = imageProc.applyFilter(imageProc.filter4)

processedImage = imageProc.applyFilter(imageProc.filter5)


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
