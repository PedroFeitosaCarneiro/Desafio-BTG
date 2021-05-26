//
//  ConversionCurrencyView.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit


class ConversionCurrencyView: UIView{
    
    var didTapFirstCurrencyButton: (() -> Void)?
    var didTapSecondCurrencyButton: (() -> Void)?
    var didTapConvertButton: ((String, String, Float) -> Void)?
    
    var viewModel: ConversionCurrencyViewModel? {
        didSet {
            DispatchQueue.main.async { [self] in
                self.dataSource = viewModel?.currencyCodes ?? []
                self.toTextField.text = viewModel?.textFieldValue ?? ""
                self.firstCurrencyButton.setTitle(viewModel?.fromButtonTittle, for: .normal)
                self.SecondCurrencyButton.setTitle(viewModel?.toButtonTittle, for: .normal)
            }
        }
    }
    
    private var dataSource: [String] = []
    
    private var fromTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "from..."
        textField.backgroundColor = .lightGray
        textField.clipsToBounds = true
        textField.textAlignment = .center
        textField.layer.cornerRadius = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var toTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "to..."
        textField.backgroundColor = .lightGray
        textField.clipsToBounds = true
        textField.textAlignment = .center
        textField.layer.cornerRadius = 3
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var convertButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Convert", for: .normal)
        button.backgroundColor = .darkGray
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        return button
    }()
    
     private var firstCurrencyButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("USD", for: .normal)
        button.backgroundColor = .systemPink
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        return button
    }()
    
     private var SecondCurrencyButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("BRL", for: .normal)
        button.backgroundColor = .systemPink
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        return button
    }()
    
    private var tittleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Currency Converter"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 28.0)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    @objc func firstCurrencyButtonPressed() {
        didTapFirstCurrencyButton?()
    }
    
    @objc func secondCurrencyButtonPressed() {
        didTapSecondCurrencyButton?()
    }
    
    @objc func conversionButtonPressed(){
        guard let numericText = fromTextField.text else {return}
        
        didTapConvertButton?(firstCurrencyButton.titleLabel?.text ?? "", SecondCurrencyButton.titleLabel?.text ?? "", Float(numericText) ?? 0)
    }
    
}

extension ConversionCurrencyView: ViewCoding{
    func buildViewHierarchy() {
        addSubview(tittleLabel)
        addSubview(fromTextField)
        addSubview(toTextField)
        addSubview(convertButton)
        addSubview(firstCurrencyButton)
        addSubview(SecondCurrencyButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            tittleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            tittleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -350),
            tittleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            tittleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
        
            fromTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            fromTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -270),
            fromTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            fromTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),

            toTextField.topAnchor.constraint(equalTo: fromTextField.bottomAnchor, constant: 20),
            toTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
            toTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            toTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),


            convertButton.topAnchor.constraint(equalTo: toTextField.bottomAnchor, constant: 60),
            convertButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
            convertButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            convertButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90),
            
        
            firstCurrencyButton.topAnchor.constraint(equalTo: fromTextField.topAnchor),
            firstCurrencyButton.bottomAnchor.constraint(equalTo:fromTextField.bottomAnchor),
            firstCurrencyButton.leadingAnchor.constraint(equalTo: fromTextField.trailingAnchor, constant: 10),
            firstCurrencyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            SecondCurrencyButton.topAnchor.constraint(equalTo: toTextField.topAnchor),
            SecondCurrencyButton.bottomAnchor.constraint(equalTo:toTextField.bottomAnchor),
            SecondCurrencyButton.leadingAnchor.constraint(equalTo: toTextField.trailingAnchor, constant: 10),
            SecondCurrencyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
        
        
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        firstCurrencyButton.addTarget(self, action: #selector(firstCurrencyButtonPressed), for: .touchDown)
        SecondCurrencyButton.addTarget(self, action: #selector(secondCurrencyButtonPressed), for: .touchDown)
        convertButton.addTarget(self, action: #selector(conversionButtonPressed), for: .touchDown)
    }
}
