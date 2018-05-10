//
//  ViewController.swift
//  ARDicee
//
//  Created by Vincent Ratford on 4/27/18.
//  Copyright © 2018 Vincent Ratford. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
//        displayCube()
        
//        displayRedCube()
        
//        displaySpaceShip()
        
//        displayMoon()
        
//        displayEarth()
        
        displayDice()
        
   
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
     

        // Run the view's session
        sceneView.session.run(configuration)
    
    }
        
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    func displayCube() {
  
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01) // create geometry called cube
        
        // Change the color of each side
        
        let colors = [UIColor.green, // front
            UIColor.red, // right
            UIColor.blue, // back
            UIColor.yellow, // left
            UIColor.purple, // top
            UIColor.gray] // bottom
        
        let sideMaterials = colors.map { color -> SCNMaterial in
            let material = SCNMaterial()
            material.diffuse.contents = color
            material.locksAmbientWithDiffuse = true
            return material
        }
        
        cube.materials = sideMaterials
        
        //        let frontMaterial = sideMaterials[0]      // changes the front material to white
        //        frontMaterial.diffuse.contents = UIColor.white
        //
        
        let node = SCNNode() // point in 3d space
        
        node.position = SCNVector3(x: 0, y: 0, z: -0.5) // position of point
        
        node.geometry = cube // node has geometry of cube
        
        sceneView.scene.rootNode.addChildNode(node)  // place in sceneview
        
        sceneView.autoenablesDefaultLighting = true // adds light and shadows to cube
        
    }
    
    func displaySpaceShip() {
                // Create a new scene
                let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
                // Set the scene to the view
                sceneView.scene = scene
        
    }
    
    func displayRedCube() {
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01) // create geometry called cube
        
        let material = SCNMaterial() // material is color red
        
        material.diffuse.contents = UIColor.red
        
        cube.materials = [material] // passing to array
        
        let node = SCNNode() // point in 3d space
        
        node.position = SCNVector3(x: 0, y: 0, z: -0.5) // position of point
        
        node.geometry = cube // node has geometry of cube
        
        sceneView.scene.rootNode.addChildNode(node)  // place in sceneview
        
        sceneView.autoenablesDefaultLighting = true // adds light and shadows to cube
        
    }
    
    func displayMoon() {
            
            let sphere = SCNSphere(radius: 0.2)
            
            let material = SCNMaterial() // material is color red
            
            material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
            
            sphere.materials = [material] // passing to array
            
            let node = SCNNode() // point in 3d space
            
            node.position = SCNVector3(x: 0, y: 0, z: -0.5) // position of point
            
            node.geometry = sphere // node has geometry of sphere
            
            sceneView.scene.rootNode.addChildNode(node)  // place in sceneview
            
            sceneView.autoenablesDefaultLighting = true // adds light and shadows to sphere
            
        }
    
    func displayEarth() {
        
        let sphere = SCNSphere(radius: 0.15)
        
        let material = SCNMaterial() // material is color red
        
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_earth_daymap.jpg")
        
        sphere.materials = [material] // passing to array
        
        let node = SCNNode() // point in 3d space
        
        node.position = SCNVector3(x: 0, y: 0, z: -0.5) // position of point
        
        node.geometry = sphere // node has geometry of sphere
        
        sceneView.scene.rootNode.addChildNode(node)  // place in sceneview
        
        sceneView.autoenablesDefaultLighting = true // adds light and shadows to sphere
        
    }

    func displayDice() {
        
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
        
        diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
        
        sceneView.scene.rootNode.addChildNode(diceNode)
         
        }
        
    }

}
