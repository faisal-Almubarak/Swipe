//
//  AddImage.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI

struct AddImage: UIViewControllerRepresentable {
    
    @Binding var showImagePicker: Bool
    @Binding var pickedImage: UIImage
    @Binding var imageData: Data
   
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
       // imagePicker.sourceType = .photoLibrary
       // imagePicker.allowsEditing = true
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //Can be used to initialize initial values and its called right after the makeUIViewController method completes its task.
    }
    
    func makeCoordinator() -> Coordinator {
        //To implement the necessary delegates / datasource or other classes
        Coordinator(self)
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parentImagePicker: AddImage
        
        init(_ imagePicker: AddImage) {
            self.parentImagePicker = imagePicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[.originalImage] as! UIImage
            
            
            if let mediaData = uiImage.jpegData(compressionQuality: 0.5) {
                parentImagePicker.imageData = mediaData
            }
            parentImagePicker.pickedImage = uiImage
            parentImagePicker.showImagePicker = false
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parentImagePicker.showImagePicker = false
        }
    }
    
}

