//
//  WebVViewController.swift
//  Aula01
//
//  Created by Faculdade Catolica do Tocantins on 04/03/17.
//  Copyright © 2017 FCTecnologia. All rights reserved.
//

import UIKit

class WebVViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var vrTextTitle: UITextField!
    @IBOutlet weak var vrWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vrTextTitle.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var srtURL = vrTextTitle.text!
        if(!srtURL.contains("http://") || !srtURL.contains("https://"))
        {
            srtURL = "http://" + srtURL
        }
        let url = URL(string: srtURL)
        
        let requisicao = URLRequest(url: url!)
        vrWebView.loadRequest(requisicao)
        
        return true
    }
    
    

}
