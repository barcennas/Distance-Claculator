//
//  ViewController.swift
//  Millas a Metros
//
//  Created by Abraham Barcenas M on 9/25/16.
//  Copyright © 2016 Abraham Barcenas M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtDistancia: UITextField!
    @IBOutlet var segEntrada: UISegmentedControl!
    @IBOutlet var segSalida: UISegmentedControl!
    @IBOutlet var lblResultado: UILabel!
    
    let mileUnit = 1.609
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblResultado.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        let SelectedIndex = segEntrada.selectedSegmentIndex
        
        if SelectedIndex == 0 {
            txtDistancia.placeholder = "Ingrese distancia en Millas"
        }else if SelectedIndex == 1{
            txtDistancia.placeholder = "Ingrese distancia en Kilometros"
        }else{
            txtDistancia.placeholder = "Ingrese distancia en Yardas"
        }
        
    }
    
    @IBAction func convertir(_ sender: UIButton) {
        
        //if(txtDistancia.text != ""){
            
        if let distancia = Double(txtDistancia.text!) {
            
            //let distancia = Double(txtDistancia.text!)!
            var resultado : Double!
            var textoEntrada : String!
            var textoSalida : String!
            
            let SelectedIndexEntrada = segEntrada.selectedSegmentIndex
            let SelectedIndexSalida = segSalida.selectedSegmentIndex
            
            
            switch SelectedIndexEntrada {
            case 0:
                textoEntrada = "Millas"
                if SelectedIndexSalida == 0 {
                    textoSalida = "Milas"
                    resultado = distancia
                }
                else if SelectedIndexSalida == 1{
                    textoSalida = "Kilometros"
                    resultado = distancia * 1.609034
                }
                else{
                    textoSalida = "Yardas"
                    resultado = distancia * 1760.00
                }
            case 1:
                textoEntrada = "Kilometros"
                if SelectedIndexSalida == 0 {
                    textoSalida = "Milas"
                    resultado = distancia / 1.609034
                }
                else if SelectedIndexSalida == 1{
                    textoSalida = "Kilometros"
                    resultado = distancia
                }
                else{
                    textoSalida = "Yardas"
                    resultado = distancia * 1093.61
                }
            case 2:
                textoEntrada = "Yardas"
                if SelectedIndexSalida == 0 {
                    textoSalida = "Milas"
                    resultado = distancia / 1760.00
                }
                else if SelectedIndexSalida == 1{
                    textoSalida = "Kilometros"
                    resultado = distancia / 1093.61
                }
                else{
                    textoSalida = "Yardas"
                    resultado = distancia
                }
            default:
                print("Inexistente")
            }
            
            let res = String(format: "%.2f", resultado)
            
            lblResultado.text = "\(distancia) \(textoEntrada!) = \(res) \(textoSalida!)"
        }else{
        
            let alertVacio = UIAlertController(title: "Oops",
                                               message: "Este campo solo acepta caracteres numericos",
                                               preferredStyle: .alert)
            
            let Ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alertVacio.addAction(Ok)
            
            present(alertVacio, animated: true, completion: nil)
        }
        
    }
    
    //sobrescribe la funcion del UIVewController del status var
    //true la esconde
    //false la muestra
    override var prefersStatusBarHidden: Bool {
        return false
    }

}

