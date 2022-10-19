//
//  SchoolCell.swift
//  GODING-EO
//
//  Created by 강한별 on 2022/10/19.
//

import UIKit

class SchoolCell: UITableViewCell {
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var schoolAdress: UILabel!
    @IBOutlet weak var schoolNumber: UILabel!
    @IBOutlet weak var schoolLogoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
