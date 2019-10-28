//
//  ImageView+Ext.swift
//  LiveStyledTask
//
//  Created by Akib Quraishi on 22/09/2019.
//  Copyright © 2019 AkibiOS. All rights reserved.
//

import Foundation
import UIKit

private let imageCache = NSCache<AnyObject, AnyObject>()


public extension UIImageView {
    
    
    convenience init(cornerRadius:CGFloat) {
        self.init(image:nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
    
    
    
    
    func downloadImageWithCache(stringURL:String) {
        self.image = nil
        let imageURL = URL(string: stringURL)
        
        //if cache exist ------
        
        if let imageFromCache = imageCache.object(forKey: stringURL as AnyObject) as? UIImage {
           // print("IMAGE_DOWNLOADER: \n", "Using cache")
            self.image = imageFromCache
        } else {
           // print("IMAGE_DOWNLOADER: \n", "Downloading image")
            
            URLSession.shared.dataTask(with: imageURL!) { (data, res, err) in
                
                if err == nil {
                    
                    DispatchQueue.main.async {
                        if let downloadedImage = UIImage(data: data!){
                            imageCache.setObject(downloadedImage, forKey: stringURL as AnyObject)
                            self.image = downloadedImage
                        }
                    }
                    
                } else {
                   // print("IMAGE_DOWNLOADER: \n", "\(err!)")
                }
                
            }.resume()
        }
    }
    
    
    
}
