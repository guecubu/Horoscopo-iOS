//
//  HoroscopeViewCell.swift
//  Horoscope iOS
//
//  Created by Turno Mananas on 18/11/2026.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {

    
    @IBOutlet weak var SignIV: UIImageView!
    @IBOutlet weak var FavoriteIV: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DatesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func render(with horoscope: Horoscope) {
        NameLabel.text = horoscope.name
        DatesLabel.text = horoscope.dates
        SignIV.image = horoscope.sign
        FavoriteIV.isHidden = !SessionManager().isFavorite(id: horoscope.id)
    }
}
