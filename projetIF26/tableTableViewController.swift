//
//  tableTableViewController.swift
//  projetIF26
//
//  Created by clément nivelet on 29/12/2017.
//  Copyright © 2017 if26. All rights reserved.
//

import UIKit

class tableTableViewController: UITableViewController {

    var toDos = [0]
    let identifiantToDoCellule = "celluleToDo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDo.Connecting()
        toDo.createTable()
        toDos = toDo.listToDo()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    override func  tableView(_ tableView: UITableView, cellForRowAt indexPath:   IndexPath)   ->   UITableViewCell{
        let aToDo = toDo(id: indexPath.row)
        let   cell = tableView.dequeueReusableCell(withIdentifier: identifiantToDoCellule, for: indexPath)
        cell.textLabel?.text   =   "\(aToDo.nom)"
        cell.detailTextLabel?.text   =   /*"\(aToDo.date) - \(aToDo.detail)"*/"\(aToDo.detail)"
        return   cell
    }
    
    override   func   tableView(_   tableView:   UITableView,   titleForHeaderInSection   section:   Int)   ->   String?   {          return   nil
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    @IBAction func addToDo() {
        print   ("Bouton insert")
        let   alert   =   UIAlertController(title:   "Insert To Do",   message:   nil,   preferredStyle:   .alert);                       alert.addTextField   {   (tf)   in   tf.placeholder   =   "nom"}
        alert.addTextField   {   (tf)   in   tf.placeholder   =   "details"}
        let   action   =   UIAlertAction(title:   "Submit",   style:   .default)   {   (_)   in
            guard
                let   nom   =   alert.textFields?.first?.text,
                let   details   =   alert.textFields?.last?.text
                else   {   return   }
            print   (nom)
            print   (details)
            toDo.insertToDo(nom: nom, date: Date(), detail: details)
            self.toDos = toDo.listToDo()
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert,   animated:   true,   completion:   nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVeiw : ViewController = segue.destination as! ViewController
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        destinationVeiw.idToDo = indexPath!.row
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
