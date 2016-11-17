//
//  ImageUtil.swift
//  Pokedex
//
//  Created by Training on 11/17/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
import UIKit

class ImageUtil{
    static func loadImageByURL(imgView:UIImageView, urlStr:String){
        let img_url = URL(string: urlStr)
        getDataFromUrl(url: img_url!) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            //            print(response?.suggestedFilename ?? url.lastPathComponent)
            //            print("Download Finished")
            let img_view = imgView
            DispatchQueue.main.async() { () -> Void in
                img_view.image = UIImage(data: data)
            }
        }
    }
    
    private static func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}
