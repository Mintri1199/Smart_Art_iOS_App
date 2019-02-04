//
//  Quiz.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

struct QuizEntry {
    var quiz: Quiz
    var date: Date
    
    
    enum Quiz: Int {
        case artist1
        case artist2
        case good
        case artist3
        case bad
        case artist4
        
        var stringValue: String {
            switch self {
            case .artist1:
                return ""
            case .artist2:
                return "Amazing"
            case .good:
                return "Good"
            case .artist3:
                return "Neutral"
            case .bad:
                return "Bad"
            case .artist4:
                return "Terrible"
            }
        }
        
        var colorValue: UIColor {
            switch self {
            case .artist1:
                return .clear
            case .artist2:
                return .green
            case .good:
                return .blue
            case .artist3:
                return .gray
            case .bad:
                return .orange
            case .artist4:
                return .red
            }
        }
        
    }
}
