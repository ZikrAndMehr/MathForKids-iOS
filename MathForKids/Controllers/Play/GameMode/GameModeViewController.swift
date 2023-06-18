//
//  GameModeViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 17/06/2023.
//

import UIKit

class GameModeViewController: UIViewController {
    
    let keyOperation: String
    
    init(keyOperation: String) {
        self.keyOperation = keyOperation
        print(keyOperation)
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
        let practiceVC = PracticeViewController(nibName: "PracticeViewController", bundle: nil)
        self.navigationController?.pushViewController(practiceVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
