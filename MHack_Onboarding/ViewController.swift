//
//  ViewController.swift
//  Number Guessing App
//

import UIKit

class ViewController: UIViewController {
    
    //Class Level Variables
    let lowerbound: Int = 1
    let upperBound: Int = 50
    
    var userGuess: Int = 1
    var magicNumber: Int!
    var success: Bool = false
    var numberG: Int = 0
    var m: String = "1 guess"
    //MARK: - IB Outlets Here
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var guess: UILabel!
    @IBOutlet weak var button: UIButton!
    
    //MARK: - App Fucntions
    @IBAction func guessButtonPressed(_ sender: Any) {
        if button.title(for: .normal) == "Restart"{
            alert()
        }
        else{
            compareGuess()
            numberG += 1
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        let value = Int(slider.value)
        guess.text = String(value)
        userGuess = value
    }
    
    //The "init" function. This function gets called once right before the user can see the screen.
    //We usually do all the setup for our apps in this function
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
       
    }
    
    //Generates a random number that the user has to guess
    func generateRandomNumber(){
        magicNumber = .random(in: lowerbound ... upperBound)
        print("Number: \(magicNumber ?? 1)")    }
    
    //Compare the user guess with the magic number
    func compareGuess() -> Void {
        titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 35.0)
        if userGuess != magicNumber {
            titleLabel.textColor = UIColor.systemRed
            slider.thumbTintColor = UIColor.systemRed
            slider.tintColor = UIColor.systemPink
            button.backgroundColor = UIColor.systemRed
            if userGuess > magicNumber{
                titleLabel.text = "The magic number is lower than \(userGuess), don't be so greedy!"
            }
            else if userGuess < magicNumber {
                titleLabel.text = "The magic number is higher than \(userGuess), do better!"
            }
        }else{
               titleLabel.text = "Amazing!\nYour guess is correct"
               titleLabel.textColor = UIColor.systemGreen
               slider.thumbTintColor = UIColor.systemGreen
               slider.tintColor = UIColor.cyan
               button.backgroundColor = UIColor.systemGreen
               button.setTitle("Restart", for: .normal)
           }
    }
    
    //Reset the guessing game
    func backToGuess() -> Void {
        titleLabel.text = "Guess the number!"
        titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40.0)
        titleLabel.textColor = UIColor.systemOrange
        slider.thumbTintColor = UIColor.systemOrange
        slider.tintColor = UIColor.systemYellow
        slider.value = 1
        guess.text = "1"
        button.backgroundColor = UIColor.systemOrange
        button.setTitle("Guess!", for: .normal)
        numberG = 0
    }
    
    //Alert the number of guess
    func alert() {
        if numberG > 1{
            m = "\(numberG) guesses"
        }
        let alert = UIAlertController(title: "You have used", message: m, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: { _ in
            self.backToGuess()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    //MARK: - Put IB Actions Below Here
    
}

