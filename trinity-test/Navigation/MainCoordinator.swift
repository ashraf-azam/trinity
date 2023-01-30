//
//  MainCoordinator.swift
//  trinity-test
//
//  Created by Snappy on 30/01/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var coordinator: MainCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ContactViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = ContactViewModel()
        navigationController.pushViewController(vc, animated: true)
    }

    func navigateToContactDetail(contact: Contact) {
        let vc = ContactDetailViewController.instantiate()
        vc.coordinator = self
        vc.intent = contact
//        vc.viewModel = ContactDetailViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
}
