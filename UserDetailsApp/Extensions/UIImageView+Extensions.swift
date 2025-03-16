//
//  UIImageView+Extensions.swift
//  UserDetailsApp
//
//  Created by Apple on 16/03/25.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>() // Global Image Cache

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        // Show loader
        let loader = UIActivityIndicatorView(style: .medium)
        loader.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        loader.startAnimating()
        loader.hidesWhenStopped = true
        DispatchQueue.main.async {
            self.addSubview(loader)
        }
        
        // Check if the image is already cached
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            loader.stopAnimating()
            loader.removeFromSuperview()
            return
        }
        
        // Download image from URL
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                loader.stopAnimating()
                loader.removeFromSuperview()
            }
            
            if let error = error {
                print("Failed to load image: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let downloadedImage = UIImage(data: data) else { return }
            
            // Cache the downloaded image
            imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
            
            DispatchQueue.main.async {
                self?.image = downloadedImage
            }
        }.resume()
    }
}
