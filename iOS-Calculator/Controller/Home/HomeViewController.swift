//
//  HomeViewController.swift
//  iOS-Calculator
//
//  Created by Jose Maria Gomez Cereto on 3/12/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    
    //Result
    @IBOutlet var resultLabel: UILabel!
    
    //Numbers
    @IBOutlet var number0: UIButton!
    @IBOutlet var number1: UIButton!
    @IBOutlet var number2: UIButton!
    @IBOutlet var number3: UIButton!
    @IBOutlet var number4: UIButton!
    @IBOutlet var number5: UIButton!
    @IBOutlet var number6: UIButton!
    @IBOutlet var number7: UIButton!
    @IBOutlet var number8: UIButton!
    @IBOutlet var number9: UIButton!
    @IBOutlet var numberDecimal: UIButton!
    
    //Operators
    @IBOutlet var operatorAC: UIButton!
    @IBOutlet var operatorPlusMinus: UIButton!
    @IBOutlet var operatorPercent: UIButton!
    @IBOutlet var operatorResult: UIButton!
    @IBOutlet var operatorSubstraction: UIButton!
    @IBOutlet var operatorAdition: UIButton!
    @IBOutlet var operatorMultiplication: UIButton!
    @IBOutlet var operatorDivision: UIButton!
    

    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // UI
        
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorSubstraction.round()
        operatorAdition.round()
        operatorMultiplication.round()
        operatorDivision.round()
        
    }

    //MARK: - Button Actions
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorAditionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        sender.shine()
        print(sender.tag)
    }
    
}
