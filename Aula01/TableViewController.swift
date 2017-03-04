//
//  TableViewController.swift
//  Aula01
//
//  Created by Faculdade Catolica do Tocantins on 04/03/17.
//  Copyright © 2017 FCTecnologia. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cardapio = ["Pizzas", "Bebidas", "Sobremesas", "pickerView"]
    var itensCardapio = [["Calabresa", "California", "Mussarela", "Portuguesa", "Quatro Queijos"], ["Cervejas", "Vinhos", "Sucos"], ["Salada de Frutas", "Sorvete", "Torta Doce"], ["PickerView"]]

    @IBOutlet weak var vrTabela: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Preenchimento dos metodos de datasource
    //Retorna o numero de secoes da tabela
    func numberOfSections(in tableView: UITableView) -> Int {
        return cardapio.count
    }
    
    //retorna o numero de linhas em cada seção
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itensCardapio[section].count
    }
    
    //Titulo usado para cada cabeçalho de sessao
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cardapio[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula:CelulaCustomizada = vrTabela.dequeueReusableCell(withIdentifier: "celula") as! CelulaCustomizada
        
        celula.vrImage.image = UIImage(named: itensCardapio[indexPath.section][indexPath.row])
        celula.vrLabel.text = itensCardapio[indexPath.section][indexPath.row]
        
        return celula
    }
    
    
    /******** METODOS DE DELEGATE **************/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        print(indexPath.row)
        if indexPath.section == 3
        {
            performSegue(withIdentifier: "seguePicker", sender: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
