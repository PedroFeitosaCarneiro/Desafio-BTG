//
//  ListCell.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit

class ListCell: UITableViewCell {
    
    private var currencyCodeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = ""
        return label
    }()
    
    private var currencyNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    
}

extension ListCell: ViewCoding{
    func buildViewHierarchy() {
        addSubview(currencyCodeLabel)
        addSubview(currencyNameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            currencyCodeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            currencyCodeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            currencyCodeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            
            
            currencyNameLabel.leadingAnchor.constraint(equalTo: currencyCodeLabel.trailingAnchor, constant: 15),
            currencyNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            currencyNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        
        ])
    }
    
    
}
