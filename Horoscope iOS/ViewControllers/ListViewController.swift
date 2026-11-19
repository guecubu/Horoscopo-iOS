//
//  ViewController.swift
//  Horoscope iOS
//
//  Created by Turno Mananas on 18/11/2026.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

//    MARK: Properties
    var horoscopeList = Horoscope.HoroscopeList
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Horoscope Cell",
            for: indexPath
        ) as! HoroscopeViewCell
        
        let horoscope = horoscopeList[indexPath.row]
        cell.render(with: horoscope)
        return cell
        
    }
    
    // MARK: SearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty){
            horoscopeList = Horoscope.HoroscopeList
            
        } else {
            horoscopeList = Horoscope.HoroscopeList.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.dates.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        horoscopeList = Horoscope.HoroscopeList
        tableView.reloadData()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        detailVC.horoscope = horoscopeList[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: false)
        
//            if let detailVC = segue.destination as? DetailViewController,
//               let indexPath = tableView.indexPathForSelectedRow {
//    
//                detailVC.horoscope = Horoscope.HoroscopeList[indexPath.row]
//            }
    }

    
    
}

