//
//  ViewController.swift
//  CoreDataXcode7
//
//  Created by Yung Dai on 2015-09-03.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource {
    
    // set up the managedObjectContext to be reused for any Entity
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var findButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // saving data to the persistent dataStore
    @IBAction func saveContact(sender: AnyObject) {
        
        // set up the entity description
        let entityDescription = NSEntityDescription.entityForName("Contacts", inManagedObjectContext: managedObjectContext)
        
        // use the Contacts subclass for the Contacts Managed object
        // setup the "scratch pad"
        let contact = Contacts(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        

        // set the object values of the Contact class object
        contact.name = name.text
        contact.address = address.text
        contact.phone = phone.text
        
        // try and save the managedObjectContext that we took out from the Contacts Class
        do {
            try managedObjectContext.save()
        } catch let saveError as NSError {
            status.text = "Could not save \(saveError), \(saveError.userInfo)"
        }
        
        // reset the textFields when saved if there are no errors
        do {
            try resetFields()
        } catch let error as NSError {
            status.text = error.localizedDescription
        }
    
    }
    
    // finding a contact in the database
    @IBAction func findContact(sender: AnyObject) {
        
        let entityDescription = NSEntityDescription.entityForName("Contacts",inManagedObjectContext: managedObjectContext)
        
        // set up the request variable
        let request = NSFetchRequest()
        
        request.entity = entityDescription
        
        let pred = NSPredicate(format: "(name = %@)", name.text!)
        request.predicate = pred
        
        // try querying the database for the name object
        do {
            // get all objects from the database based on the request
            let objects = try managedObjectContext.executeFetchRequest(request)
            
            // go through each result
            if let results: AnyObject =  objects {
                if results.count > 0 {
                    let match = results[0] as! NSManagedObject
                    name.text = match.valueForKey("name") as? String
                    address.text = match.valueForKey("address") as? String
                    phone.text = match.valueForKey("phone") as? String
                    status.text = "Matches found: \(results.count)"
                } else {
                    status.text = "No Match"
                }
            }
        // return errors if there are no contacts
        } catch let fetchError as NSError {
            status.text = "Could not get contact: \(pred), \(fetchError)"
        }
    }
    
    func resetFields() throws {
        name.text = ""
        address.text = ""
        phone.text = ""
        status.text = "Contact Saved"
    }
    
    // MARK: TableViewData
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

