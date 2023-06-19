//
//  PracticeViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 18/06/2023.
//

import UIKit

class PracticeViewController: UIViewController {
    
    @IBOutlet weak var currentQuestionNumber: UILabel!
    
    @IBOutlet weak var numberOfCorrectQuestion: UILabel!
    @IBOutlet weak var numberOfWrongQuestion: UILabel!
    
    @IBOutlet weak var a: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var b: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    private var min = AppConstants.minValue
    private var max = AppConstants.maxValue
    private let operationString: String
    private var questions: [Question] = []
    private var questionNumber = 0
    private var ans = 0
    private var showNextQuestion = true
    private var correctQuestions = ""
    private var correctQuestionsCount = 0
    private var wrongQuestions = ""
    private var wrongQuestionsCount = 0
    
    init(operationString: String) {
        self.operationString = operationString
        super.init(nibName: "PracticeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        if let newMinValue = getIntValueFrom(key: AppConstants.keyMinValue) {
            min = newMinValue
        }
        if let newMaxValue = getIntValueFrom(key: AppConstants.keyMaxValue) {
            max = newMaxValue
        }
        
        for _ in 1...10 {
            questions.append(Question(operationString, min, max))
        }
        
        operation.text = operationString
        
        setupQuestion()
    }
        
    private func setupQuestion() {
        currentQuestionNumber.text = "\(questionNumber + 1)/10"
        
        a.text = questions[questionNumber].getA()
        b.text = questions[questionNumber].getB()
        ans =  questions[questionNumber].getC()
        
        let random = questions[questionNumber].getRandom()
        
        optionA.setTitle(String(random[0]), for: .normal)
        optionB.setTitle(String(random[1]), for: .normal)
        optionC.setTitle(String(random[2]), for: .normal)
        optionD.setTitle(String(random[3]), for: .normal)
        
        switch Int.random(in: 1...4) {
        case 1:
            optionA.setTitle(String(ans), for: .normal)
        case 2:
            optionB.setTitle(String(ans), for: .normal)
        case 3:
            optionC.setTitle(String(ans), for: .normal)
        case 4:
            optionD.setTitle(String(ans), for: .normal)
        default: break
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func optionAClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == String(ans) {
            correctOptionSelected(button: sender)
        } else {
            wrongOptionSelected(button: sender)
        }
    }
    
    @IBAction func optionBClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == String(ans) {
            correctOptionSelected(button: sender)
        } else {
            wrongOptionSelected(button: sender)
        }
    }
    
    @IBAction func optionCClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == String(ans) {
            correctOptionSelected(button: sender)
        } else {
            wrongOptionSelected(button: sender)
        }
    }
    
    @IBAction func optionDClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == String(ans) {
            correctOptionSelected(button: sender)
        } else {
            wrongOptionSelected(button: sender)
        }
    }
    
    private func getIntValueFrom(key: String) -> Int? {
        UserDefaults.standard.object(forKey: key) as? Int
    }
    
    private func correctOptionSelected(button: UIButton) {
        let currentQuestion = questions[questionNumber]

        if showNextQuestion {
            correctQuestions.append(
                "\(currentQuestion.getA())" +
                "\(operationString)" +
                "\(currentQuestion.getB())" +
                "\(AppConstants.equal)" +
                "\(String(describing: button.titleLabel))"
            )
            correctQuestionsCount += 1
        }
        
        questionNumber += 1
        showNextQuestion = true
        
        if questionNumber == 10 {
            self.navigationController?.popViewController(animated: true)
        } else {
            numberOfCorrectQuestion.text = String(correctQuestionsCount)
            setupQuestion()
        }
    }
    
    private func wrongOptionSelected(button: UIButton) {
        showToast(message: "Wrong answer, Please try again!")
        
        if showNextQuestion {
            let currentQuestion = questions[questionNumber]
            wrongQuestions.append(
                "\(currentQuestion.getA())" +
                "\(operationString)" +
                "\(currentQuestion.getB())" +
                "\(AppConstants.equal)" +
                "\(String(describing: button.titleLabel))"
            )
            wrongQuestionsCount += 1
            showNextQuestion = false
            
            numberOfWrongQuestion.text = String(wrongQuestionsCount)
        }
    }
    
    func showToast(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        self.present(alertController, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }
}
