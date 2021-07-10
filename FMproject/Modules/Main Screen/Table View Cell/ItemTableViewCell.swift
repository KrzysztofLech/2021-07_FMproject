//
//  ItemTableViewCell.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet private var shadowView: UIView!
    @IBOutlet private var containerView: UIView!
    
    @IBOutlet private var itemImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var modificationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowRadius = 16
        shadowView.layer.shadowOpacity = 0.3
    }
    
    func configure(withData data: DataViewModel) {
        itemImageView.image = nil   ///
        
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        modificationLabel.text = data.modificationDate
    }
}
