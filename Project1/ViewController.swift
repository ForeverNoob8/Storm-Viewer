//
//  ViewController.swift
//  Project1
//
//  Created by Toni on 17.9.2020.
//  Copyright © 2020 asikainen.toni. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    /// Vaiheet joilla saadaan TVC (TableViewController) toimimaan toivotusti:
    /// Poistetaan perus UIViewController storyboardissa ja tuodaan tilalle object librarysta UITableViewController, jotta saadaan tableview toimimaan sovelluksessa. Tämän jälkeen SB:ssä (storyboardissa), identifier inspectorissa muutetaan class: UITableViewController -> UIViewControlleriksi (joka viittaa tähän tiedostoon).
    /// Tämän jälkeen mennään SB:ssä attributes inspectoriin ja laitetaan täppä VC kentän alapuolella olevaan valintaruutuun 'is initial view controller'
    /// Valitaan SB:ssä: VC -> DO (Document Outline valikko) -> TV (Table View) -> TVC (Table View Cell). Muutetaan sen identifier, attribute inspectorissa. Identifier: Picture, ja Style muutetaan Customista -> Basic:ksi
    /// Tämän jälkeen valitaan VC ja painetaan 'Embed in Navigation Controller (NC)'
    
    /// Luodaan uusi tiedosto, cocoa touch tyyppiä, nimeltään DetailViewController
    /// Luodaan uusi VC, SB:nytlk joka nimetään AI (Attribute Inspectorissa) Storyboard ID:ssä 'Detail' ja muutetaan luokaksi DetailViewController
    /// Tuo Object Librarysta uusi image view ja aseta se Detail VC:n päälle. Levitä se peittämään koko ruutu. Tämän jälkeen valitse image view, mene 'Editor' -> Resolve Auto Layout Issues -> Reset To Suggested Constraints. Tämä sitoo kuvan kiinni näytön reunoihin
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        /// FileManager hoitaa tiedostojen käsittelyn.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        /// Luodaan loop jolla käydään fm-propertyyn nimetty kansio lävitse ja tuodaan kaikki tiedostot joissa on alku "nssl" pictures array:n.
        
        for item in items {
            if item.hasPrefix("nssl") {
                // This is picture to load
                pictures.append(item)
            }
        }
        
    }
    
    /// Tämä metodi määrittelee montako riviä meidän TVC:ssä on käytössä
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count /// luodaan niin monta riviä kun on kuvia bundlessa
    }
    
    /// Tämä metodi määrittelee miltä kunkin rivin pitäisi näyttää
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // HUOM! Tämän metodin on pakko palauttaa UITableViewCell
        /// Tämä property sisällyttää dequeueReusableCell metodin joka kierrättää taulukon soluja niin, että se näyttää aina näytöllä olevien solujen määrää vastaavan määrän dataa ja laittaa ruutua vierittäessä datan jonoon odottamaan uudelleenkäyttöä. Täten TVC:n ei tarvitse luoda uusia soluja vaan se käyttää olemassaolevia ja säästää täten tilaa ja järjestelmän kapasiteettia
        /// Metodissa käytetään SB:ssä nimettyä 'Picture' solua
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath ) // Muista kutsua oikea indexpath!!
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

