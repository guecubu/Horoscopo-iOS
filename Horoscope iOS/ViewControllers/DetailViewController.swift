//
//  DetailViewController.swift
//  Horoscope iOS
//
//  Created by Turno Mananas on 19/11/2026.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope: Horoscope!
    var isFavorite = false
    
    @IBOutlet weak var favoriteIcon: UIBarButtonItem!
    @IBOutlet weak var ShareIcon: UIBarButtonItem!
    @IBOutlet weak var dates: UILabel!
    @IBOutlet weak var predictionText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = horoscope.name
        navigationItem.subtitle = horoscope.dates
        dates.text = horoscope.dates
        
        isFavorite = SessionManager().isFavorite(id: horoscope.id)
        
    }
    
    func setFavoriteIcon() {
        favoriteIcon.image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }
    
    
    
    @IBAction func FavoriteAction(_ sender: Any) {
        var button = sender as! UIButton
        setFavoriteIcon()
        
    }
    
    @IBAction func ShareAction(_ sender: Any) {
        let textShare = [horoscope.name]
        
        let activityVC = UIActivityViewController(
            activityItems: textShare,
            applicationActivities: nil
        )
        
        activityVC.popoverPresentationController?.sourceView = self.view
        
    }
}
