//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var titleAnimalLabel: UILabel!
    @IBOutlet var difinitionAnimalLabel: UILabel!
    
    var answers: [Answer] = []
    private var animal: AnimalType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animal = findTopAnimal(of: answers)
        titleAnimalLabel.text = "Вы - \(animal!.rawValue)!"
        difinitionAnimalLabel.text = animal?.definition
       
        self.navigationItem.hidesBackButton = true
        
    }
    
    //Мне не нравится как получилась эта функция, но вроде работает...
    private func findTopAnimal(of answers: [Answer]) -> AnimalType {
        var countAnimals: [AnimalType: Int] = [:]
        
        for answer in answers {
            if countAnimals[answer.type] == nil {
                countAnimals[answer.type] = 1
            } else {
                countAnimals[answer.type]? += 1
            }
        }

        let animals = Array(countAnimals.keys)
        let counts = Array(countAnimals.values)
        let indexTopAnimal = counts.firstIndex(of: counts.max()!)
        
        return animals[indexTopAnimal!]
    }
}
