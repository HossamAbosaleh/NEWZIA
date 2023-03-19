//
//  LoadingCViewCell.swift
//  NEWZIA
//
//  Created by Abo Saleh on 19/03/2023.
//

import UIKit

class LoadingCViewCell: UICollectionViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuraCell() {
        activityIndicator.startAnimating()
    }

}
