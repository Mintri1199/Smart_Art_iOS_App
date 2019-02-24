//
//  NetworkManager.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/23/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation
import UIKit

func getImage(urlString: String, completion: @escaping (UIImage?) -> ()) {
    let imageUrl = URL(string: urlString)
    let session = URLSession(configuration: .default)
    
    let request = URLRequest(url: imageUrl!)
    
    let task = session.dataTask(with: request) { (data, response, error) in
        guard let data = data, error == nil else { return }
        
        let image = UIImage(data: data)
        completion(image)
    }
    task.resume()
}
