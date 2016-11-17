//
//  ViewController.swift
//  MyCoreData
//
//  Created by Training on 11/17/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import CoreData
import SQLite

class ViewController: UIViewController {

    @IBAction func btnReadSQLite(_ sender: Any) {
    }
    @IBAction func btnSaveSQLite(_ sender: Any) {
        do{
             let filemgr = FileManager.default
            let dirPaths = filemgr.urls(for: .documentDirectory,                                       in: .userDomainMask)
            
            let databasePath = dirPaths[0].appendingPathComponent("mydb.sqlite").path
            
        let db = try Connection(databasePath)
        let tbl = Table("mytab")
        let id = Expression<Int64>("id")
        let name = Expression<String?>("name")
        let email = Expression<String>("email")
        
        try db.run(tbl.create{t in
            t.column(id, primaryKey: true)
            t.column(name)
            t.column(email)
        })
        let insert = tbl.insert(name<-"Vittayasak",email<-"vittayasak@gmail.com")
        let rowid = try db.run(insert)
        }catch{
            print("error : \(error)")
        }
    }
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func btnSaveCoreData(_ sender: Any) {
        let context = getContext()
        let path = NSTemporaryDirectory();
        print("path: \(path)")
        let person = NSEntityDescription.entity(forEntityName: "Person", in: context)
        let tx = NSManagedObject(entity: person!, insertInto: context)
        tx.setValue(2,forKey:"id")
        tx.setValue("John", forKey: "name")
        tx.setValue("08122222",forKey:"phone")
        tx.setValue("john@gmail.com",forKey:"email")
        
        do{
            try context.save()
            print("-- saved!---")
        }catch let err as Error{
            print("error-> \(err)")
        }
        
    }
    
    @IBAction func btnReadCoreData(_ sender: Any) {
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
  
            print ("num of results = \(searchResults.count)")

            for p in searchResults as [NSManagedObject] {

                print("\(p.value(forKey: "name"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myp = UserDefaults.standard
        let fname = myp.string(forKey: "firstname_preference")
        print("Firstname -> \(fname!)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

