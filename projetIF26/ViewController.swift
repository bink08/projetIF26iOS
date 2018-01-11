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
    
    @IBOutlet var detailField: UITextField!
    @IBOutlet var TextField: UITextField!
    var idToDo = Int()
    var thetoDo: toDo = toDo(id: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDo.Connecting()
        toDo.createTable()
        thetoDo = toDo(id: idToDo)
        TextField.text = thetoDo.nom
        detailField.text = thetoDo.detail

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButton(_ sender: Any) {
        self.thetoDo.setNom(nom: TextField.text!)
        self.thetoDo.setDetail(detail: detailField.text!)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        self.thetoDo.delete()
    }
}

