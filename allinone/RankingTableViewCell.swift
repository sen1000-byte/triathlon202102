//
//  RankingTableViewCell.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/18.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var scoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
