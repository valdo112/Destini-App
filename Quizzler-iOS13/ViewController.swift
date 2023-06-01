//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = quizBrain.getProgress()
       updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
//        progressBar.progress = Float(questionNumber) / Float(quiz.count)
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        progressBar.progress = quizBrain.getProgress()
       updateUI()
        
        
    }
    
    func updateUI(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.firstButton.backgroundColor = UIColor.clear
            self.secondButton.backgroundColor = UIColor.clear
            self.thirdButton.backgroundColor = UIColor.clear
        }
        var answers = quizBrain.getAnswer()
        firstButton.setTitle(answers[0], for: .normal)
        secondButton.setTitle(answers[1], for: .normal)
        thirdButton.setTitle(answers[2], for: .normal)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
    }
    
}

