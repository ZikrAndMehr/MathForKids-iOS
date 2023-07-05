//
//  ResultViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 05/07/2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet private weak var correctQuestionCountLabel: UILabel!
    @IBOutlet private weak var wrongQuestionCountLabel: UILabel!
    @IBOutlet private weak var correctQuestionsLabel: UILabel!
    @IBOutlet private weak var wrongQuestionsLabel: UILabel!
    
    private let preViewControllerNibName: String
    private let operationString: String
    private let correctQuestionCount: Int
    private let wrongQuestionCount: Int
    private let correctQuestions: String
    private let wrongQuestions: String
    
    init(preViewControllerNibName: String,
         operationString: String,
         correctQuestionCount: Int,
         wrongQuestionCount: Int,
         correctQuestions: String,
         wrongQuestions: String
    ) {
        self.preViewControllerNibName = preViewControllerNibName
        self.operationString = operationString
        self.correctQuestionCount =  correctQuestionCount
        self.wrongQuestionCount = wrongQuestionCount
        self.correctQuestions = correctQuestions
        self.wrongQuestions = wrongQuestions
        super.init(nibName: "ResultViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let correctQuestionCountLS = NSLocalizedString("correct_question_count", comment: "")
        correctQuestionCountLabel.text = String(format: correctQuestionCountLS, correctQuestionCount)

        let wrongQuestionCountLS = NSLocalizedString("wrong_question_count", comment: "")
        wrongQuestionCountLabel.text = String(format: wrongQuestionCountLS, wrongQuestionCount)
        
        correctQuestionsLabel.text = correctQuestions
        wrongQuestionsLabel.text = wrongQuestions
    }

    @IBAction private func restartButtonClicked(_ sender: UIButton) {
        switch preViewControllerNibName {
        case "PracticeViewController":
            navigateToPracticeVC()
        case "QuizViewController":
            navigateToQuizVC()
        default: break
        }
    }
    
    @IBAction private func exitButtonClicked(_ sender: UIButton) {
        guard let navigationController = self.navigationController else { return }
        
        if let viewController = navigationController.viewControllers.first(where: { $0 is GameModeViewController
        }) {
            navigationController.popToViewController(viewController, animated: true)
        }
    }
    
    private func navigateToPracticeVC() {
        let practiceVC = PracticeViewController(operationString: operationString)
        self.navigationController?.pushViewController(practiceVC, animated: true)
    }
    
    private func navigateToQuizVC() {
        
    }
}
