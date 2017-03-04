//
//  ViewController.swift
//  Aula01
//
//  Created by Faculdade Catolica do Tocantins on 04/03/17.
//  Copyright © 2017 FCTecnologia. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var paradigmasSelected:Int = 0
    var paradigmas = ["Estruturadas","Orientados à Objetos"]
    var linguagens = [["C", "Pascal"],["Java", "Swift", "C Sharp"]]
    @IBOutlet weak var vrImageView: UIImageView!
    @IBOutlet weak var vrPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        vrPickerView.delegate = self
        vrPickerView.dataSource = self
        vrImageView.image = UIImage(named: linguagens[0][0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return paradigmas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0
        {
            return paradigmas.count
        }
        
        return linguagens[paradigmasSelected].count
    }
    
    //preenche o titulo de cada linha do componente
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
            return paradigmas[row]
        }
        return linguagens[paradigmasSelected][row]
    }
    
    //implementa o metodo do delegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            paradigmasSelected = row
            vrImageView.image = UIImage(named: linguagens[paradigmasSelected][0])
            vrPickerView.reloadComponent(1)
            vrPickerView.selectRow(0, inComponent: 1, animated: true)
            
        }
        else
        {
            vrImageView.image = UIImage(named: linguagens[paradigmasSelected][row])
        }
    }

}

