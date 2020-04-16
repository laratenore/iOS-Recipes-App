//
//  AddViewController.swift
//  Recipe
//
//  Created by Lara Tenore on 05/04/20.
//  Copyright © 2020 Lara Tenore Ferreira. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var recipeContent: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //titleText.backgroundColor = UIColor.black
        //recipeContent.backgroundColor = UIColor.black
        
        addButton.isEnabled = false
        doneButton.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.textTitleDidChange), name: UITextField.textDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.recipeContentDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    @objc func textTitleDidChange() {
        doneAddButtonStates()
    }
    
    @objc func recipeContentDidChange() {
        doneAddButtonStates()
    }
    
    @IBAction func keyboardDoneButton_click(_ sender: Any) {
        titleText.resignFirstResponder()
    }
    @IBAction func doneButton_click(_ sender: Any) {
        //para esconder o teclado
        recipeContent.resignFirstResponder()
    }
    
    func doneAddButtonStates() {
        
        if recipeContent.text != "" {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
        
        if titleText.text != "" && recipeContent.text != "" {
            addButton.isEnabled = true
            addButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        } else {
            addButton.isEnabled = false
            addButton.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func addButton_click(_ sender: Any) {
        
        activityIndicator.startAnimating()
        
        RecipeManager.AddRecipe(title: titleText.text!, content: recipeContent.text!)
        
        titleText.text = ""
        recipeContent.text = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.activityIndicator.stopAnimating()
        }
        
        var defaults = UserDefaults.standard
        defaults.set("mystring", forKey: "myobject")
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
