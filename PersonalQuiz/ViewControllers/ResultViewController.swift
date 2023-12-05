//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Paul Makey on 30.11.23.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answers: [Answer]!

    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        guard let resultAnimal = getMostFrequentAnswer(for: answers) else { return }
        animalTypeLabel.text = ("Вы – \(resultAnimal.rawValue)")
        animalDescriptionLabel.text = resultAnimal.definition
    }
    
    @IBAction func doneButtonDidTapped() {
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func getMostFrequentAnswer(for answers: [Answer]) -> Animal? {
        var result: Animal?
        var oldValue = 0
        
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            var counter = 0
            
            answers.forEach { answer in
                if animal == answer.animal {
                    counter += 1
                }
            }
            
            if counter > oldValue {
                oldValue = counter
                result = animal
            }
        }
        return result ?? nil
    }
}
