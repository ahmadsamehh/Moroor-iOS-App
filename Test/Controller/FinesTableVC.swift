//
//  FinesTableVC.swift
//  Test
//
//  Created by Ahmad Sameh on 5/4/20.
//  Copyright © 2020 Ahmad Sameh. All rights reserved.
//

import UIKit

class FinesTableVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    var finesCount : Int = 0
    var fines_location_array : [String] = []
    var fines_time_array : [String] = []
    


    @IBOutlet weak var myTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell {
            
            
            cell.updateCellViews(fineLocation: fines_location_array[indexPath.row], fineTime: fines_time_array[indexPath.row])
            
            return cell
            
        }else{
            
            return CustomCell()
        }
  
    }

    

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Pay Now") { (rowAction, indexPath) in
            
           
            //self.myTableView.reloadData()
            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
            self.PayFine(indexPath: indexPath)
        }
        
        
        return [deleteAction]
        
    }
    
    
    
    
    
    func PayFine (indexPath : IndexPath){
  
        fines_location_array.remove(at: indexPath.row)
        fines_time_array.remove(at: indexPath.row)
    }
    

}
