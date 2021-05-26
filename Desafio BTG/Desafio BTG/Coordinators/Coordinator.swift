//
//  Coordinator.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    
    init(navigationController:UINavigationController, factory: ModuleFactory)
    var childCoordinators: [Coordinator] { get set }
    func start()
    
}
