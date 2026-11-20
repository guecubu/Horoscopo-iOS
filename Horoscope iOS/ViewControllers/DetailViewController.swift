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
    let api = HoroscopeApiService()
    
    @IBOutlet weak var favoriteIcon: UIBarButtonItem!
    @IBOutlet weak var ShareIcon: UIBarButtonItem!
    @IBOutlet weak var dates: UILabel!
    @IBOutlet weak var SignImage: UIImageView!
    @IBOutlet weak var predictionText: UITextView!
    @IBOutlet weak var periodSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHoroscope()
        title = horoscope.name
        navigationItem.subtitle = horoscope.dates
        dates.text = horoscope.dates
        SignImage.image = horoscope.sign
        isFavorite = SessionManager().isFavorite(id: horoscope.id)
        setFavoriteIcon()

    }
    
    private func loadHoroscope() {
        
        let sign = horoscope.id
        
        Task {
            do {
                let response: HoroscopeResponse
                let period: String
                switch periodSegment.selectedSegmentIndex {
                case 0:
                    period = "daily"
                case 1:
                    period = "weekly"
                case 2:
                    period = "monthly"
                default:
                    return
                }
                
                response = try await api
                    .getHoroscopePrediction(sign: sign, period: period)
//
//                DispatchQueue.main.async {
//                    self.predictionText.text = response.data.horoscope
//                }
                updatePrediction(response.data.horoscope)
                
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func setFavoriteIcon() {
        favoriteIcon.image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }
    
    @MainActor
    private func updatePrediction(_ text: String) {
        predictionText.text = text
    }
    
    
    @IBAction func periodChanged(_ sender: UISegmentedControl) {
        loadHoroscope()
       
    }

    @IBAction func favoriteMenuClicked(_ sender: Any) {
        let session = SessionManager()
        let id = isFavorite ? "" : horoscope.id
        session.setFavorite(id: id)
        isFavorite = !isFavorite
        setFavoriteIcon()
        
    }
    
    @IBAction func shareMenuClicked(_ sender: Any) {
        let textShare = [horoscope.name, horoscope.dates, predictionText.text!]
        
        let activityVC = UIActivityViewController(
            activityItems: textShare,
            applicationActivities: nil
        )
        
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
        
    }
}
