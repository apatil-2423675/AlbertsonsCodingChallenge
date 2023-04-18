//
//  AcronymsTableViewCell.swift
//  AlbertsonsCodingChallenge
//
//  Created by 2423675 on 18/04/23.
//

import UIKit

class AcronymsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sfLabel: UILabel!
    @IBOutlet weak var freqLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Custom method
    func setUpDataOnCell(data: LongFormModel) {
        sfLabel.text = "\(Constant.longForm) - \(data.lf ?? "")"
        freqLabel.text = "\(Constant.frequency) - \(data.freq ?? 0)"
    }
}

