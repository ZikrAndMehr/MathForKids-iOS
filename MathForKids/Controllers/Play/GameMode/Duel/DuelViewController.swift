//
//  DuelViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 05/07/2023.
//

import UIKit

class DuelViewController: UIViewController {

    @IBOutlet private weak var playerOneView: UIView!
    
    @IBOutlet private weak var A1Button: UIButton!
    @IBOutlet private weak var B1Button: UIButton!
    @IBOutlet private weak var C1Button: UIButton!
    @IBOutlet private weak var D1Button: UIButton!
    
    @IBOutlet private weak var a1Label: UILabel!
    @IBOutlet private weak var operation1Label: UILabel!
    @IBOutlet private weak var b1Label: UILabel!
    
    @IBOutlet private weak var correctQuestionsCount1Label: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var correctQuestionsCount2Label: UILabel!
    
    @IBOutlet private weak var a2Label: UILabel!
    @IBOutlet private weak var operation2Label: UILabel!
    @IBOutlet private weak var b2Label: UILabel!
    
    @IBOutlet private weak var A2Button: UIButton!
    @IBOutlet private weak var B2Button: UIButton!
    @IBOutlet private weak var C2Button: UIButton!
    @IBOutlet private weak var D2Button: UIButton!
    
    private var min = AppConstants.minValue
    private var max = AppConstants.maxValue
    private let operationString: String
    private var questions: [Question] = []
    private var questionNumber = 0
    private var ans = 0
    private var correctQuestions1 = ""
    private var correctQuestionsCount1 = 0
    private var correctQuestions2 = ""
    private var correctQuestionsCount2 = 0
    
    init(operationString: String) {
        self.operationString = operationString
        super.init(nibName: "DuelViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        playerOneView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        if let newMinValue = getIntValueFrom(key: AppConstants.keyMinValue) {
            min = newMinValue
        }
        if let newMaxValue = getIntValueFrom(key: AppConstants.keyMaxValue) {
            max = newMaxValue
        }
        
        for _ in 1...10 {
            questions.append(Question(operationString, min, max))
        }
        
        operation1Label.text = operationString
        operation2Label.text = operationString
        
        setupQuestion()
    }
    
    private func setupQuestion() {
        progressView.progress = Float((questionNumber + 1) * 10)
        
        correctQuestionsCount1Label.text = String(correctQuestionsCount1)
        correctQuestionsCount2Label.text = String(correctQuestionsCount2)
        
        let a = questions[questionNumber].getA()
        let b = questions[questionNumber].getB()
        ans =  questions[questionNumber].getC()
        
        a1Label.text = a
        b1Label.text = b
        
        a2Label.text = a
        b2Label.text = b
        
        let random = questions[questionNumber].getRandom()
        
        let optionA = String(random[0])
        let optionB = String(random[1])
        let optionC = String(random[2])
        let optionD = String(random[3])
        
        A1Button.setTitle(optionA, for: .normal)
        B1Button.setTitle(optionB, for: .normal)
        C1Button.setTitle(optionC, for: .normal)
        D1Button.setTitle(optionD, for: .normal)
        
        A2Button.setTitle(optionA, for: .normal)
        B2Button.setTitle(optionB, for: .normal)
        C2Button.setTitle(optionC, for: .normal)
        D2Button.setTitle(optionD, for: .normal)
        
        switch Int.random(in: 1...4) {
        case 1:
            A1Button.setTitle(String(ans), for: .normal)
            A2Button.setTitle(String(ans), for: .normal)
        case 2:
            B1Button.setTitle(String(ans), for: .normal)
            B2Button.setTitle(String(ans), for: .normal)
        case 3:
            C1Button.setTitle(String(ans), for: .normal)
            C2Button.setTitle(String(ans), for: .normal)
        case 4:
            D1Button.setTitle(String(ans), for: .normal)
            D2Button.setTitle(String(ans), for: .normal)
        default: break
        }
    }
    
    // Player 1
    @IBAction private func A1ButtonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        optionSelectedPlayer1(text)
    }
    
    @IBAction private func B1ButtonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        optionSelectedPlayer1(text)
    }
    
    @IBAction private func C1ButtonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        optionSelectedPlayer1(text)
    }
    
    @IBAction private func D1ButtonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        optionSelectedPlayer1(text)
    }
    
    // Player 2
    @IBAction private func A2ButtonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        optionSelectedPlayer2(text)
    }
    
    @IBAction private func B2ButtonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        optionSelectedPlayer2(text)
    }
    
    @IBAction private func C2ButtonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        optionSelectedPlayer2(text)
    }
    
    @IBAction private func D2ButtonClicked(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        optionSelectedPlayer2(text)
    }
    
    private func getIntValueFrom(key: String) -> Int? {
        UserDefaults.standard.object(forKey: key) as? Int
    }
    
    private func optionSelectedPlayer1(_ text: String) {
        let currentQuestion = questions[questionNumber]

        if text == String(ans) {
            correctQuestions1.append(
                "\(currentQuestion.getA())" +
                "\(operationString)" +
                "\(currentQuestion.getB())" +
                "\(AppConstants.equal)" +
                "\(text)\n"
            )
            correctQuestionsCount1 += 1
            
            questionNumber += 1
            
            if questionNumber == 10 {
                navigateToResultVC()
            } else {
                setupQuestion()
            }
        }
    }
    
    private func optionSelectedPlayer2(_ text: String) {
        let currentQuestion = questions[questionNumber]

        if text == String(ans) {
            correctQuestions2.append(
                "\(currentQuestion.getA())" +
                "\(operationString)" +
                "\(currentQuestion.getB())" +
                "\(AppConstants.equal)" +
                "\(text)\n"
            )
            correctQuestionsCount2 += 1
            
            questionNumber += 1
            
            if questionNumber == 10 {
                navigateToResultVC()
            } else {
                setupQuestion()
            }
        }
    }
    
    private func navigateToResultVC() {
        // Note ResultViewController adjusted for Duel Mode
        let resultVC = ResultViewController(
            preViewControllerNibName: "DuelViewController",
            operationString: operationString,
            correctQuestionCount: correctQuestionsCount1, // Player 1
            wrongQuestionCount: correctQuestionsCount2, // Player 2
            correctQuestions: correctQuestions1, // Player 1
            wrongQuestions: correctQuestions2 // Player 2
        )
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
}
