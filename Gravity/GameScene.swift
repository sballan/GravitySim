//
//  GameScene.swift
//  Gravity
//
//  Created by Samuel Ballan on 5/20/15.
//  Copyright (c) 2015 Samuel Ballan. All rights reserved.
//

import SpriteKit
import Foundation

class GameScene: SKScene, SKPhysicsContactDelegate {
	let zUserInterface: CGFloat = 10
	
	var worldLayer = World()
	var interfaceLayer: Interface!
	
	
	override func didMoveToView(view: SKView) {
		self.anchorPoint = CGPointMake(0.5, 0.5)
		setupContent()
	}
	
	func setupContent() {
		self.physicsWorld.contactDelegate = self
		self.backgroundColor = SKColor.blackColor()
		
		interfaceLayer = Interface()
		interfaceLayer.zPosition = zUserInterface
		addChild(worldLayer)
		addChild(interfaceLayer)
		
		interfaceLayer.createContent()
		
	}
	
	
	
	 
	#if os(iOS)
	//----On iOS----
//	func makeVector(#touches: Set<NSObject>, node: SKNode) -> CGVector {
//	
//	}
	
	override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
		worldLayer.planet.physicsBody?.applyForce(CGVectorMake(-100, 100))
	}
	
	#else
	//----On Mac----
	func makeVector(#theEvent: NSEvent, node: SKNode) -> CGVector? {
		var clickLocation = theEvent.locationInNode(self)
		var nodeLocation = node.position
		
		var vectorNumber: Int = 100		
		
		switch (true) {
		case clickLocation.x > 0 && clickLocation.y > 0:
			return CGVector(dx: vectorNumber, dy: vectorNumber)
			
		case clickLocation.x < 0 && clickLocation.y > 0:
			return CGVector(dx: -vectorNumber, dy: vectorNumber)
			
		case clickLocation.x > 0 && clickLocation.y < 0:
			return CGVector(dx: vectorNumber, dy: -vectorNumber)
			
		case clickLocation.x < 0 && clickLocation.y < 0:
			return CGVector(dx: -vectorNumber, dy: -vectorNumber)
			
		default: return nil
		}
	}

	override func mouseDown(theEvent: NSEvent) {
		var node: SKNode = self.nodeAtPoint(theEvent.locationInNode(self))
		
		println(theEvent.locationInNode(self))
		
		if node.name == "resetButton" {
			println("RESET")
			worldLayer.removeFromParent()
			worldLayer = World()
			addChild(worldLayer)
		}
		
		worldLayer.planet.physicsBody?.applyForce(makeVector(theEvent: theEvent, node: worldLayer.planet)!)
	}

	#endif
	
	//----Over----
	
	
	override func didSimulatePhysics() {

	}
	
	
	func centerOnNode(node: SKNode) {
		var positionInScene = convertPoint(node.position, fromNode: node.parent!)
		worldLayer.position = CGPointMake(worldLayer.position.x - positionInScene.x, worldLayer.position.y)
	}
	
	func clear() {
		var newScene = GameScene(size: CGSizeMake(view!.frame.size.width, view!.frame.size.height))
		self.view?.presentScene(newScene)
	}
	
	func didBeginContact(contact: SKPhysicsContact) {
		
	}
	
	func didEndContact(contact: SKPhysicsContact) {
		
	}
    
    override func update(currentTime: CFTimeInterval) {
		for child in children {
			child.update()
		}
		
		
		
	}
	
	
}



