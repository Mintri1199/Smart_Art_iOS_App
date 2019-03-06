//
//  NetworkManager.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/23/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation
import UIKit

// This function will get us the quizzes for the selection Screen
func getQuizzes(completion: @escaping ([Quiz]) -> Void) {
    let urlString = "https://smart-art-api.herokuapp.com/api/all"
    let url = URL(string: urlString)
    let decoder = JSONDecoder()
    let task = URLSession.shared.dataTask(with: url!) {(data, reponse, error) in
        guard let dataResponse = data , error == nil else {print(error?.localizedDescription ?? "Response Error"); return}
        let decoded = try? decoder.decode([Quiz].self, from: dataResponse)
        completion(decoded!)
    }
    task.resume()
}

// This function allow us to get an image using a url string for the individual question
func getImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
    // Turn string parameter into url
    let imageUrl = URL(string: urlString)
    // configure urlSession
    let session = URLSession(configuration: .default)
    // configure urlRequest
    let request = URLRequest(url: imageUrl!)

    let task = session.dataTask(with: request) { (data, _, error) in
        guard let data = data, error == nil else { return }
        let image = UIImage(data: data)
        completion(image)
    }
    task.resume()
}
