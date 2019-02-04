//
//  testingBranch.swift
//  Smart_Art
//
//  Created by MattHew Phraxayavong on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class MoodCreator: UIViewController {
    var date: Date!
    var quiz: QuizEntry.Quiz!
    var index: Int!
//    var delegate: moveData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
//        setupHousingView()
        
        //updates UI
        
        //updateUI()
        
        // Gives functions to buttons
        
//        housingView.buttonStack.artist1Button.addTarget(self, action: #selector(pressMood(_:)), for: .touchUpInside)
//        housingView.buttonStack.artist2Button.addTarget(self, action: #selector(pressMood(_:)), for: .touchUpInside)
        
//        housingView.datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .touchUpInside)
//
//        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
//        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    // checks if index exists, if it does exists that means we are editing an existing cell, if it doesnt exist then we are creating a new cell
    
//    @objc func doneButtonPressed() {
//        if let selectedIndex = index {
//            delegate?.passData(quiz: quiz, date: date, index: selectedIndex, editing: true)
//        } else {
//            delegate?.passData(quiz: quiz, date: date, index: 0, editing: false)
//        }
//        navigationController?.popViewController(animated: true)
//    }
    
    
//    var housingView = HousingView(frame: .zero)
    
    //Every time date changes, the variable on line 12 changes
    
//    @objc func datePickerChanged(_ sender: UIDatePicker) {
//        date = sender.date
//    }
//
//    func setupHousingView() {
//        view.addSubview(housingView)
//        housingView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            housingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            housingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            housingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            housingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            ])
//    }
//
//
//    @objc func pressMood(_ sender: UIButton) {
//        switch sender.tag  {
//        case 0:
//            updateQuiz(to: .artist2)
//        case 1:
//            updateQuiz(to: .good)
//        case 2:
//            updateQuiz(to: .artist3)
//        case 3:
//            updateQuiz(to: .bad)
//        case 4:
//            updateQuiz(to: .artist4)
//        default:
//
//            //NOTE: error handling
//            print("unhandled button tag")
//        }
//    }
    
    // updates the UI // calls the quiz and changes the date
    
//    private func updateUI() {
//        updateQuiz(to: quiz)
//        housingView.datePicker.date = date
//    }
//
    
    
    // updates color of selected quiz when selected
//    private func updateQuiz( to newQuiz: QuizEntry.Quiz) {
//        let unselectedColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//
//        switch newQuiz {
//        case .artist1:
//            quiz = .artist1
//            housingView.buttonStack.artist1Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist2Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist3Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist4Button.backgroundColor = unselectedColor
//            housingView.buttonStack.terribleButton.backgroundColor = unselectedColor
//        case .artist2:
//            quiz = .artist2
//            housingView.buttonStack.artist1Button.backgroundColor = newQuiz.colorValue
//            housingView.buttonStack.artist2Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist3Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist4Button.backgroundColor = unselectedColor
//            housingView.buttonStack.terribleButton.backgroundColor = unselectedColor
//        case .good:
//            quiz = .good
//            housingView.buttonStack.artist1Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist2Button.backgroundColor = newQuiz.colorValue
//            housingView.buttonStack.artist3Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist4Button.backgroundColor = unselectedColor
//            housingView.buttonStack.terribleButton.backgroundColor = unselectedColor
//        case .artist3:
//            quiz = .artist3
//            housingView.buttonStack.artist1Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist2Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist3Button.backgroundColor = newQuiz.colorValue
//            housingView.buttonStack.artist4Button.backgroundColor = unselectedColor
//            housingView.buttonStack.terribleButton.backgroundColor = unselectedColor
//        case .bad:
//            quiz = .bad
//            housingView.buttonStack.artist1Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist2Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist3Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist4Button.backgroundColor = newQuiz.colorValue
//            housingView.buttonStack.terribleButton.backgroundColor = unselectedColor
//        case .artist4:
//            quiz = .artist4
//            housingView.buttonStack.artist1Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist2Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist3Button.backgroundColor = unselectedColor
//            housingView.buttonStack.artist4Button.backgroundColor = unselectedColor
//            housingView.buttonStack.terribleButton.backgroundColor = newQuiz.colorValue
//        }
//    }
//
}

// An extension to find the viewController a component is in
extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
