//
//  VocaTableViewCell.swift
//  MxoVocabulary
//
//  Copyright © 2017年 ＭxoStudio. All rights reserved.
//

import UIKit

class VocaTableViewCell: UITableViewCell {
    @IBOutlet var eName: UILabel!
    @IBOutlet var cName: UILabel!
    @IBOutlet var Phonetic: UILabel!
    @IBOutlet var Img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
