//
//  ContactViewController.swift
//  trinity-test
//
//  Created by Snappy on 30/01/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ContactViewController: BaseViewController<ContactViewModel>, Storyboarded, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let tableviewCell: String = "ContactTableviewCell"
        
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        tableView.register(self.tableViewCellNib(), forCellReuseIdentifier: tableviewCell)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        tableView.rowHeight = 100
        title = "Contacts"
    }
    
    func tableViewCellNib() -> UINib {
        return UINib(nibName: tableviewCell, bundle: Bundle.main)
    }
    
    override func setupTransformInput() {
        viewModel.contentReady = rx.viewDidAppear.asDriver()
    }
    
    override func subscribe() {
        let cardBinding = viewModel.contactList.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: tableviewCell)) {
                index , item, cell in
                if let cardCell = cell as? ContactTableviewCell {
                    let contactVM = ContactTableviewModel(contact: item)
                    cardCell.viewModel = contactVM
                }
            }
        
        disposeBag.insert(
            cardBinding
        )
    }
}
