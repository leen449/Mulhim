//
//  GIFView.swift
//  Mulhim2
//
//  Created by leen binmueqal on 10/02/1447 AH.
//

import SwiftUI
import UIKit

struct GIFView: UIViewRepresentable {
    private let name: String // Name of the GIF asset in your project
    
    init(name: String) {
        self.name = name
    }
    
    func makeUIView(context: Context) -> UIImageView {
        // Load the GIF from your assets
        guard let asset = NSDataAsset(name: name),
              let animatedImage = UIImage.gifImageWithData(asset.data) else {
            return UIImageView() // Return empty view if GIF fails to load
        }
        
        let imageView = UIImageView(image: animatedImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        // No update needed for static GIF display
    }
}

// Helper extension to create UIImage from GIF data
extension UIImage {
    class func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        
        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()
        var duration: Double = 0.0
        
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let image = UIImage(cgImage: cgImage)
                images.append(image)
                
                if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
                   let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
                   let delayTime = gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double {
                    duration += delayTime
                }
            }
        }
        
        return UIImage.animatedImage(with: images, duration: duration)
    }
}
