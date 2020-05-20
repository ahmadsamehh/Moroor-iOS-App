//
//  TableViewController.swift
//  Test
//
//  Created by Ahmad Sameh on 12/8/19.
//  Copyright © 2019 Ahmad Sameh. All rights reserved.
//

import UIKit


class TableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    
    
    var finesCount : Int = 0
    var fines_location_array : [String] = []
    var fines_time_array : [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(finesCount)
        print(fines_time_array)
        print(fines_location_array)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.FinePlaceLabel.text = fines_location_array[indexPath.row]
        cell.FineTimeLabel.text = fines_time_array[indexPath.row]
        
        return cell
        
    }


}
