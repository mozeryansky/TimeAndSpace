//
//  ViewController.swift
//  TimeAndSpace
//
//  Created by Ozeryansky, Michael on 6/27/15.
//  Copyright (c) 2015 Michael Ozeryansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var timeButtonHeightConstriant: NSLayoutConstraint!
    
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    @IBOutlet weak var exploreButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // make sure the image is in the background
        //view.sendSubviewToBack(imageView)
        
        // scroll view
        self.scrollView.contentSize = self.imageView.frame.size;
        self.scrollView.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // get next pic
        
    }
    
    // MARK: - Methods
    
    func zoomIn() {
        scrollView.setZoomScale(scrollView.maximumZoomScale / 2, animated: true);
    }
    
    func zoomOut() {
        // zoom out
        scrollView.setZoomScale(1, animated: true);
    }
    
    func doubleTap() {
        if scrollView.zoomScale > scrollView.minimumZoomScale {
            zoomOut()
        } else {
            zoomIn()
        }
    }
    
    // MARK: - Scroll View Delegate
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    // MARK: - Actions
    
    @IBAction func timeButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func spaceButtonPressed(sender: UIButton) {
    
    }
    
    @IBAction func exploreButtonPressed(sender: UIButton) {
        
    }
    
    // MARK: - Gesture Recognizers
 
    @IBAction func tapTwiceRecognized(sender: UITapGestureRecognizer) {
        doubleTap()
    }
}

