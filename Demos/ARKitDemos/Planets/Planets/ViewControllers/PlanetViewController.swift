//
//  PlanetViewController.swift
//  Planets
//
//  Created by Ingrid Guerrero on 17/08/19.
//  Copyright © 2019 Cris. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class PlanetViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    var earthNode = SCNNode()
    var sunNode = SCNNode()
    var venusNode = SCNNode()
    var moonNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        setupPlanetsNodes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.session.run(configuration)
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}


extension PlanetViewController {
    
    fileprivate func setupPlanetsNodes() {
        let relativeRotationAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.deg2rad()), z: 0, duration: 8)
        let repeatRelativeRotationAction = SCNAction.repeatForever(relativeRotationAction)
        
        let earthParentNode = SCNNode()
        earthParentNode.position = SCNVector3(0, 0, -1)
        
        let venusParentNode = SCNNode()
        venusParentNode.position = SCNVector3(0, 0, -1)
        
        sunNode = createPlanet(radius: 0.4,
                               position: SCNVector3(0, 0, -1),
                               diffuse: UIImage(named: "SunDiffuse"),
                               specular: nil,
                               emission: nil,
                               normalMap: nil)
        
        sceneView.scene.rootNode.addChildNode(sunNode)
        sceneView.scene.rootNode.addChildNode(earthParentNode)
        sceneView.scene.rootNode.addChildNode(venusParentNode)
        
        earthNode = createPlanet(radius: 0.2,
                                 position: SCNVector3(1.5, 0, 0),
                                 diffuse: UIImage(named: "EarthDiffuse"),
                                 specular: UIImage(named: "EarthSpecular"),
                                 emission: UIImage(named: "EarthEmission"),
                                 normalMap: UIImage(named: "EarthNormal"))
        
        earthParentNode.addChildNode(earthNode)
        
        venusNode = createPlanet(radius: 0.1,
                                 position: SCNVector3(0.8, 0, 0),
                                 diffuse: UIImage(named: "VenusAtmosphere"),
                                 specular: nil,
                                 emission: nil,
                                 normalMap: nil)
        
        venusParentNode.addChildNode(venusNode)
        
        moonNode = createPlanet(radius: 0.05,
                                position: SCNVector3(0, 0, -0.3),
                                diffuse: UIImage(named: "VenusAtmosphere"),
                                specular: nil,
                                emission: nil,
                                normalMap: nil)
        
        earthNode.addChildNode(moonNode)
        
        sunNode.runAction(repeatRelativeRotationAction)
        earthNode.runAction(repeatRelativeRotationAction)
        venusNode.runAction(repeatRelativeRotationAction)
        
        let earthRotationAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.deg2rad()), z: 0, duration: 14)
        let earthRepeatRotationAction = SCNAction.repeatForever(earthRotationAction)
        earthParentNode.runAction(earthRepeatRotationAction)
        
        let venusRotationAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.deg2rad()), z: 0, duration: 10)
        let venusRepeatRotationAction = SCNAction.repeatForever(venusRotationAction)
        venusParentNode.runAction(venusRepeatRotationAction)
    }
    
    fileprivate func createPlanet(radius: CGFloat, position: SCNVector3, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normalMap: UIImage?) -> SCNNode {
        
        let planet = SCNNode()
        planet.geometry = SCNSphere(radius: radius)
        planet.position = position
        
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normalMap
        return planet
    }
}
