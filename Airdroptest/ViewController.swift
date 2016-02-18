//
//  ViewController.swift
//  Airdroptest
//
//  Created by Rohaine Hsu on 9/21/15.
//  Copyright © 2015 Rohaine Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filename.delegate = self;
        self.filetext.delegate = self;
        self.fileextension.delegate = self;
        
        self.text.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func filecontent(filepath: String) {
        let documentDirectoryURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
        let fileDestinationUrl = documentDirectoryURL.URLByAppendingPathComponent("\(filepath)")
        do {
            let contentsOfFile = try NSString(contentsOfFile: fileDestinationUrl.path!, encoding: NSUTF8StringEncoding)
            print("Content of file = \(contentsOfFile)")
        } catch let error as NSError {
            print(error)
            print("No file found")
        }
    }
    
    func inboxfilecontent() {
        let documentDirectoryURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
        let fileDestinationUrl = documentDirectoryURL.URLByAppendingPathComponent("Inbox/Other file.txt")
        do {
            let contentsOfFile = try NSString(contentsOfFile: fileDestinationUrl.path!, encoding: NSUTF8StringEncoding)
            print("Content of file = \(contentsOfFile)")
        } catch let error as NSError {
            print(error)
            print("No file found")
        }
    }
    
    func filesinDocs() {
        let documentsURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
        do {
            let directoryContents = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(documentsURL.absoluteURL, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
            print(directoryContents)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func filesinInbox() {
        let documentDirectoryURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
        let fileDestinationUrl = documentDirectoryURL.URLByAppendingPathComponent("Inbox")
        do {
        let directoryContents = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(fileDestinationUrl.absoluteURL, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
        print(directoryContents)
        
        } catch let error as NSError {
        print(error.localizedDescription)
        }
    }

    
    @IBOutlet var filename: UITextField!
    
    @IBOutlet var filetext: UITextField!
    
    @IBOutlet var fileextension: UITextField!
    
    @IBOutlet var text: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func createFile(sender: AnyObject) {
        let documentDirectoryURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        let filename = "\(self.filename.text!).\(self.fileextension.text!)"

        let fileDestinationUrl = documentDirectoryURL.URLByAppendingPathComponent(filename)
        let contentsOfFile = "\(self.filetext.text!)"
        var error: NSError?
        
        do {
            try contentsOfFile.writeToURL(fileDestinationUrl, atomically: true, encoding: NSUTF8StringEncoding)
            if let errorMessage = error {
                print("Failed to create file")
                print("\(errorMessage)")
            } else {
                print("File \(self.filename.text!).\(self.fileextension.text!) created")
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    @IBAction func Checkfilecontent(sender: AnyObject) {
        inboxfilecontent()
    }
    
    @IBAction func listoffiles(sender: AnyObject) {
        filesinDocs()
        filesinInbox()
    }
    
    
    @IBAction func shareFile(sender: AnyObject) {
        
        let documentDirectoryURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        let text = documentDirectoryURL.URLByAppendingPathComponent("sample.txt")

        /*let path = NSBundle.mainBundle().pathForResource("Testfile", ofType: "txt")
        let text = try? NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding)*/
        
        let controller = UIActivityViewController(activityItems: [text], applicationActivities: nil)

        controller.excludedActivityTypes = [UIActivityTypePostToFacebook, UIActivityTypePostToTwitter, UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypePostToFlickr, UIActivityTypePostToTencentWeibo, UIActivityTypeMail]
        
        self.presentViewController(controller, animated: true, completion: nil)
        
        if let pop = controller.popoverPresentationController {
            let v = sender as! UIView
            pop.sourceView = v
            pop.sourceRect = v.bounds
        }
    }

    
    @IBAction func modifyfile(sender: AnyObject) {
        write("sample.txt")
    }
    
    func write(filepath: String) {
        let text = self.text.text!
        let fileManager = NSFileManager.defaultManager()
        let directoryURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileDestinationUrl = directoryURL.URLByAppendingPathComponent("\(filepath)")
        print(fileDestinationUrl)
        
        do {
            try text.writeToFile(fileDestinationUrl.path!, atomically: true, encoding: NSUTF8StringEncoding)
            
            let contentsOfFile = try! NSString(contentsOfURL: fileDestinationUrl, encoding: NSUTF8StringEncoding)
            print("Content of file = \(contentsOfFile)")
            
        } catch let error as NSError {
            print(error)
            print("No file found")
        }
    }


}

