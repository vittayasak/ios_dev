//
//  ViewController.swift
//  MyCoreData
//
//  Created by Training on 11/17/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

