//
//  GameTableViewCell.swift
//  FindNewGame
//
//  Created by Irsyad Ashari on 08/10/20.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gamePoster: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDesc: UILabel!
    
    static let identifier = "gamecell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        gamePoster.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
