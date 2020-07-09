//
//  SDWebImage+Movee.swift
//  Movee
//
//  Created by Cristian Kocza on 05/07/2020.
//

import Foundation
import SDWebImage
import Combine

extension SDWebImageManager: ImageService {
    func downloadImage(withURL url: URL) -> Future<UIImage, Error> {
        return Future { promise in
            self.loadImage(with: url, options: [], progress: nil) { image, _, error, _, _, _ in
                if let image = image {
                    promise(.success(image))
                } else {
                    promise(.failure(error ?? NSError(domain: "Movee", code: -1, userInfo: nil)))
                }
            }
        }
    }
}
