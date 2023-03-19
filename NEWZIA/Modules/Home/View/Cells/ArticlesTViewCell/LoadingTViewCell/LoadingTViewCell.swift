//
//  LoadingTViewCell.swift
//  NEWZIA
//
//  Created by Abo Saleh on 19/03/2023.
//

import UIKit

class LoadingTViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuraCell() {
        activityIndicator.startAnimating()
    }
    
}
