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
    
    //MARK: - Variables
    
    private var total: Double = 0 // Total
    private var temp: Double = 0 // Valor por pantalla
    private var operating = false // Indicar si se ha seleccionado un operador
    private var decimal = false // Indicar si el valor es o no decimal
    private var operation: OperationType = .none
    
    // MARK: - Constantes
    
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLenght = 9
    private let kTotal = "total"
    
    private enum OperationType {
        case none, adition, substraction, multiplication, division, percent
    }
    
    //Formateo de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    //Formateo de valores auxiliares
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    //Formateo de valores por pantalla por defecto
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    //Formateo de valores por pantalla en formato científico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
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
        
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        total = UserDefaults.standard.double(forKey: kTotal)
        
        result()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        
        clear()
        
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent {
            result()
        }
        operating = true
        operation = .percent
        result()
        
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .division
        sender.selectOperation(true)
        
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        operating = true
        operation = .multiplication
        sender.selectOperation(true)
        
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
    
    if operation != .none {
                result()
            }
        operating = true
        operation = .substraction
        sender.selectOperation(true)
    
        sender.shine()
        }
    
    @IBAction func operatorAditionAction(_ sender: UIButton) {
   
                 if operation != .none {
                result()
            }
            operating = true
            operation = .adition
            sender.selectOperation(true)
            
            sender.shine()
        
       
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        
        result()
        
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLenght {
            return
        }
        
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
       
        operatorAC.setTitle("C", for: .normal)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLenght {
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        // Hemos seleccionado una operación
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        //Hemos seleccionado decimales
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    // Limpia los valores
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    // Obtiene el resultado final
    private func result() {
        
        switch operation {
            
        case .none:
            // No hacemos nada
            break
        case .adition:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        // Formateo  en pantalla
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLenght {
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        operation = .none
        
        selectVisualOperation()
        
        UserDefaults.standard.set(total, forKey: kTotal)
        
        print("Total: \(total)")
    }
    
    // Muestra de forma visual la operacion seleccionada
    
    private func selectVisualOperation() {
        
        if !operating {
            // No estamos operando
            operatorAdition.selectOperation(false)
            operatorSubstraction.selectOperation(false)
            operatorMultiplication.selectOperation(false)
            operatorDivision.selectOperation(false)
            
        } else {
            switch operation {
            case .none, .percent:
                operatorAdition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .adition:
                operatorAdition.selectOperation(true)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .substraction:
                operatorAdition.selectOperation(false)
                operatorSubstraction.selectOperation(true)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .multiplication:
                operatorAdition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(true)
                operatorDivision.selectOperation(false)
                break
            case .division:
                operatorAdition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(true)
                break
            }
            
        }
        
    }
    
}
