//
//  ImageUtils.swift
//  WTTechnicalTest
//
//  Created by Sebastian Mejia on 23/01/22.
//

import Foundation

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                self.image = UIImage(data: data)
            }
        }
    }
}
