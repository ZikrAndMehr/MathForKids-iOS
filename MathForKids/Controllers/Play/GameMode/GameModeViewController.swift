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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func practiceButtonClicked(_ sender: Any) {
        let practiceVC = PracticeViewController(operationString: keyOperation)
        self.navigationController?.pushViewController(practiceVC, animated: true)
    }
}
