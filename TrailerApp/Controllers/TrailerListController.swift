//
//  TrailerListController.swift
//  TrailerApp
//
//  Created by Rick De Vries on 15/04/2019.
//  Copyright © 2019 Rick De Vries. All rights reserved.
//
import Alamofire
import UIKit

class TrailerListController: UITableViewController {
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "TrailerListCell", bundle: nil), forCellReuseIdentifier: "TrailerListCell")
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrailerListCell", for: indexPath) as! TrailerListCell
        
        cell.movie = movies[indexPath.item]
        tableView.rowHeight = 111
        
        return cell
    }
    
    func getData() {
        Alamofire.request(String(format: NSLocalizedString("URL", comment: "API URL"))).responseData(completionHandler: {[weak self] (response) in
            guard let jsonData = response.data else { return }
            
            let Decoder = JSONDecoder()
            let movies = try! Decoder.decode([Movie].self, from: jsonData)
            
            self?.movies = movies
            
            self?.tableView.reloadData()
        })
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "TrailerDetailController") as! TrailerDetailController
        detailVC.movie = movies[indexPath.row]
        self.present(detailVC, animated: true)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
}
