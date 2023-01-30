//
//  ContactTableviewCell.swift
//  trinity-test
//
//  Created by Snappy on 30/01/2023.
//

import Foundation
import UIKit

class ContactTableviewCell: UITableViewCell {
    static let primaryOrange: UIColor = #colorLiteral(red: 1, green: 0.4784313725, blue: 0.09019607843, alpha: 1)

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contactView.layer.cornerRadius = contactView.frame.height / 2
        contactView.backgroundColor = ContactTableviewCell.primaryOrange
        nameLabel.font = .boldSystemFont(ofSize: 14)
    }
    
    var viewModel: ContactTableviewModel? = nil {
        didSet {
            guard let viewModel = self.viewModel else { return }
            self.nameLabel.text = viewModel.firstName
        }
    }
    
}
