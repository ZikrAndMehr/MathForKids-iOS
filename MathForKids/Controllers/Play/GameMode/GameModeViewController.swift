//
//  GameModeViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 17/06/2023.
//

import UIKit

class GameModeViewController: UIViewController {
    
    private let keyOperation: String
    
    init(keyOperation: String) {
        self.keyOperation = keyOperation
        super.init(nibName: "GameModeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction private func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func practiceButtonClicked(_ sender: Any) {
        let practiceVC = PracticeViewController(operationString: keyOperation)
        self.navigationController?.pushViewController(practiceVC, animated: true)
    }
    
    @IBAction func quizButtonClicked(_ sender: UIButton) {
        let quizVC = QuizViewController(operationString: keyOperation)
        self.navigationController?.pushViewController(quizVC, animated: true)
    }
    
    @IBAction func duelButtonClicked(_ sender: UIButton) {
        let duelVC = DuelViewController(operationString: keyOperation)
        self.navigationController?.pushViewController(duelVC, animated: true)
    }
    
    @IBAction func timeButtonClicked(_ sender: UIButton) {
        let timeVC = TimeViewController(operationString: keyOperation)
        self.navigationController?.pushViewController(timeVC, animated: true)
    }
}
