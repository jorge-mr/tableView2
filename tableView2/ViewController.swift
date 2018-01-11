//
//  ViewController.swift
//  tableView2
//
//  Created by Jorge MR on 10/01/18.
//  Copyright © 2018 jorge_a_mtz_r. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //var emojiss = ["🛸","🏄🏻‍♂️","🌥","🐉","🐙","🎒","🧝🏼‍♂️","⏰","🔫","📫","💙","🍒","🦄","🧠","🤖","🤮"]
    
    var arregloEmojis : [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarEmojis()
    }
    
    func cargarEmojis(){
        var emoji = Emoji(figura: "🛸", nombre: "nave espacial")
        arregloEmojis.append(emoji)
        emoji = Emoji(figura: "🏄🏻‍♂️", nombre: "surfista")
        arregloEmojis.append(emoji)
        emoji = Emoji(figura: "🌥", nombre: "nube")
        arregloEmojis.append(emoji)
        emoji = Emoji(figura: "🐉", nombre: "dragon")
        arregloEmojis.append(emoji)
        emoji = Emoji(figura: "🐙", nombre: "pulpo")
        arregloEmojis.append(emoji)
        emoji = Emoji(figura: "🎒", nombre: "mochila")
        arregloEmojis.append(emoji)
        emoji = Emoji(figura: "🧝🏼‍♂️", nombre: "duende")
        arregloEmojis.append(emoji)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arregloEmojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        cell.emoji.text = arregloEmojis[indexPath.row].figura
        cell.nombre.text = arregloEmojis[indexPath.row].nombre
        if arregloEmojis[indexPath.row].seleccionado {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        arregloEmojis[indexPath.row].seleccionado = !arregloEmojis[indexPath.row].seleccionado
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.arregloEmojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let deafultText = "Estamos en el ios lab"
            let shareActivity = UIActivityViewController(activityItems: [deafultText], applicationActivities: [])
            self.present(shareActivity, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return [deleteAction,shareAction]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

