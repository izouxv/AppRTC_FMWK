//
//  WebRTCViewController.swift
//  WebRTC iOS Swift
//
//  Created by Sushil Dahal on 2/2/16.
//  Copyright © 2016 Sushil Dahal.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

import UIKit


extension UIView {
    public  func addSubViewXAsWholeXXXXXXXX(_ view:UIView){
        view.removeFromSuperview()
        
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let viewsDic : [String: UIView] = ["view": view]
        self.addConstraintsXXXXXX("H:|[view]|", viewsDic)
        self.addConstraintsXXXXXX("V:|[view]|", viewsDic)
    }
    public func addConstraintsXXXXXX(_ constraintsVFL: String,_ views: [String: UIView],_ metrics: [String: AnyObject]?=nil,_ options: NSLayoutFormatOptions = NSLayoutFormatOptions()) {
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: constraintsVFL, options:options, metrics: metrics, views: views)
        self.addConstraints(constraints)
    }
}



// The view controller that is displayed when WebRTC iOS Swift is loaded.
open class WebRTCViewControllerBase: UIViewController, ARDAppClientDelegate, RTCEAGLVideoViewDelegate {
 
    open func LayoutVideoViews(_ remoteView1:UIView,_ localView1:UIView){
    }
    
    var remoteView: RTCEAGLVideoView = RTCEAGLVideoView()
    var localView: RTCEAGLVideoView = RTCEAGLVideoView()
    
    open var roomName: String?
    open var serAddr: String = "https://apprtc.appspot.com"
    var client: ARDAppClient?
    var localVideoTrack: RTCVideoTrack?
    var remoteVideoTrack: RTCVideoTrack?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        LayoutVideoViews(remoteView,localView)
        
        // Do any additional setup after loading the view, typically from a nib.
        initialize()
        connectToChatRoom()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disconnect()
    }
    
    open  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func endButton(sender: UIButton) {
//        disconnect()
//        self.navigationController?.popToRootViewControllerAnimated(true)
//    }
    
    //    MARK: RTCEAGLVideoViewDelegate
    open func appClient(_ client: ARDAppClient!, didChange state: ARDAppClientState) {
        switch state{
        case ARDAppClientState.connected:
            print("Client Connected")
            break
        case ARDAppClientState.connecting:
            print("Client Connecting")
            break
        case ARDAppClientState.disconnected:
            print("Client Disconnected")
            remoteDisconnected()
        }
    }
    
    open func appClient(_ client: ARDAppClient!, didReceiveLocalVideoTrack localVideoTrack: RTCVideoTrack!) {
        self.localVideoTrack = localVideoTrack
        self.localVideoTrack?.add(localView)
    }
    
    open func appClient(_ client: ARDAppClient!, didReceiveRemoteVideoTrack remoteVideoTrack: RTCVideoTrack!) {
        self.remoteVideoTrack = remoteVideoTrack
        self.remoteVideoTrack?.add(remoteView)
    }
    
    open func appClient(_ client: ARDAppClient!, didError error: Error!) {
        //        Handle the error
        showAlertWithMessage(error.localizedDescription)
        disconnect()
    }
    
    //    MARK: RTCEAGLVideoViewDelegate
    open func videoView(_ videoView: RTCEAGLVideoView!, didChangeVideoSize size: CGSize) {
        //        Resize localView or remoteView based on the size returned
    }
    
    //    MARK: Private
    func initialize(){
        disconnect()
        //        Initializes the ARDAppClient with the delegate assignment
        client = ARDAppClient.init(delegate: self)
        
        //        RTCEAGLVideoViewDelegate provides notifications on video frame dimensions
        remoteView.delegate = self
        localView.delegate = self
    }
    
    
    open func connectToChatRoom(){
        if let room = roomName{
            client?.serverHostUrl = serAddr// "https://apprtc.appspot.com"
            client?.connectToRoom(withId: room, options: nil)
        }
    }
    
    func remoteDisconnected(){
        if(remoteVideoTrack != nil){
            remoteVideoTrack?.remove(remoteView)
        }
        remoteVideoTrack = nil
    }
    
    open func disconnect(){
        if(client != nil){
            if(localVideoTrack != nil){
                localVideoTrack?.remove(localView)
            }
            if(remoteVideoTrack != nil){
                remoteVideoTrack?.remove(remoteView)
            }
            localVideoTrack = nil
            remoteVideoTrack = nil
            client?.disconnect()
        }
    }
    
    func showAlertWithMessage(_ message: String){
        let alertView: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alertView.addAction(alertAction)
        self.present(alertView, animated: true, completion: nil)
    }
}





