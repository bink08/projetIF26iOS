//
//  toDo.swift
//  projetIF26
//
//  Created by clément nivelet on 17/12/2017.
//  Copyright © 2017 if26. All rights reserved.
//

import UIKit
import SQLite

class toDo: NSObject {
    static var database: Connection!
    static let toDoTable = Table("toDo")
    var id: Int
    var nom: String
    var date: Date
    var detail: String
    
    
    init(id: Int) {
        createTable()
        let selfToDO = toDo.toDoTable.filter(Expression<Int>("id") == self.id)
        self.id = id
        self.nom = "\(selfToDO[Expression<String>("nom")])"
        let dateFormater = DateFormatter()
        self.date = dateFormater.date(from: "\(selfToDO[Expression<Date>("date")])")!
        self.detail = "\(selfToDO[Expression<String>("detail")])"
    }
    
    class func Connection(){
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask,appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("toDo").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            toDo.database = database
        } catch {
            print(error)
        }
    }
    
    private func createTable() {
        let createTable = toDo.toDoTable.create { (table) in
            table.column(Expression<Int>("id"), primaryKey: true)
            table.column(Expression<String>("nom"))
            table.column(Expression<Date>("date"))
            table.column(Expression<String>("detail"))
        }
        do {
            try toDo.database.run(createTable)
            print("Created Table")
        }catch {
            print(error)
        }
    }
    
    class func insertToDo(id: Int, nom: String, date: Date, detail: String) {
        let nomTable = Expression<String>("nom")
        let dateTable = Expression<Date>("date")
        let detailTable = Expression<String>("detail")
        let insertToDo = toDo.toDoTable.insert(nomTable <- nom, dateTable <- date, detailTable <- detail)
        do {
            try toDo.database.run(insertToDo)
            print("Inserted toDo")
        }catch {
            print(error)
        }
    }
    
    class func listToDo () -> [Int]{
        var listToDo = [Int]()
        do {
            let toDos = try toDo.database.prepare(toDo.toDoTable)
            for toDo in toDos {
                listToDo = listToDo + [toDo[Expression<Int>("id")]]
            }
        } catch {
            print(error)
        }
        return listToDo
    }
    
    func setNom(nom: String){
        let selfToDO = toDo.toDoTable.filter(Expression<Int>("id") == self.id)
        let updateToDo = selfToDO.update(Expression<String>("nom") <- nom)
        do {
            try toDo.database.run(updateToDo)
            self.nom = nom
        } catch {
            print(error)
        }
    }
    
    func setDate(date: Date){
        let selfToDO = toDo.toDoTable.filter(Expression<Int>("id") == self.id)
        let updateToDo = selfToDO.update(Expression<Date>("date") <- date)
        do {
            try toDo.database.run(updateToDo)
            self.date = date
        } catch {
            print(error)
        }
    }
    
    func setDetail(detail: String){
        let selfToDO = toDo.toDoTable.filter(Expression<Int>("id") == self.id)
        let updateToDo = selfToDO.update(Expression<String>("detail") <- detail)
        do {
            try toDo.database.run(updateToDo)
            self.detail = detail
        } catch {
            print(error)
        }
    }
    func delete(){
        let selfToDO = toDo.toDoTable.filter(Expression<Int>("id") == self.id)
        let deleteToDo = selfToDO.delete()
        do {
            try toDo.database.run(deleteToDo)
            
        } catch {
            print(error)
        }
    }
    
}
