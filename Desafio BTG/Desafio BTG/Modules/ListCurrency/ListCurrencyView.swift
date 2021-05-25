//
//  ListCurrencyView.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit

class ListCurrencyView: UIView{
    
    let listTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListCell.self, forCellReuseIdentifier: "listCell")
        return tableView
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    
    
}

extension ListCurrencyView: ViewCoding{
    func buildViewHierarchy() {
        addSubview(listTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            listTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        
        ])
    }
    
    func setupAdditionalConfiguration() {
        listTableView.dataSource = self
    }
    
}

extension ListCurrencyView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListCell else {return UITableViewCell()}
        cell.backgroundColor = .red
        return cell
    }
    
    
}
