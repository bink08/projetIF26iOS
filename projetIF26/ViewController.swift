//
//  ViewController.swift
//  projetIF26
//
//  Created by clément nivelet on 12/12/2017.
//  Copyright © 2017 if26. All rights reserved.
//
import UIKit
import SQLite

class ViewController: UIViewController {

    var toDos = [0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDo.Connecting()
        toDo.createTable()
        toDos = toDo.listToDo()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        }
        alert.addAction(action)
        present(alert,   animated:   true,   completion:   nil)
    }
    
}

