//
//  CurrencyPickerView.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 26/05/21.
//

import Foundation
import UIKit



class CurrencyPickerView: UIView {
    
    let pickerTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PickerCell.self, forCellReuseIdentifier: "pickerCell")
        return tableView
    }()
    
    
    var didSelect: ((String) -> Void)?
    
    var viewModel: PickerCurrencyViewModel? {
        didSet{
            DispatchQueue.main.async {
                self.pickerTableView.reloadData()
            }
            
        }
    }
    
    var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
}

extension CurrencyPickerView: ViewCoding{
    func buildViewHierarchy() {
        addSubview(pickerTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            pickerTableView.topAnchor.constraint(equalTo: topAnchor),
            pickerTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pickerTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pickerTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        self.pickerTableView.delegate = self
        self.pickerTableView.dataSource = self
    }
    
    
}


extension CurrencyPickerView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currencyCodes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as? PickerCell else {return UITableViewCell()}
        cell.model = viewModel?.currencyCodes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?(viewModel?.currencyCodes[indexPath.row].0 ?? "")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
