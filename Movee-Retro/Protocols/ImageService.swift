//
//  ImageDownloader.swift
//  Movee
//
//  Created by Cristian Kocza on 05/07/2020.
//

import UIKit
import Combine

protocol ImageService {
    func downloadImage(withURL url: URL) -> Future<UIImage, Error>
}
