//
//  ToolsCollectionDataSource.swift
//  Snapvideo
//
//  Created by Anastasia Petrova on 02/02/2020.
//  Copyright © 2020 Anastasia Petrova. All rights reserved.
//

import UIKit

final class ToolsCollectionDataSource: NSObject, UICollectionViewDataSource {
    weak var collectionView: UICollectionView?
    let tools: [AnyTool]
    var image: UIImage? {
        didSet {
            collectionView?.reloadData()
        }
    }
    //TODO: Параметризировать инициализатор с коллекций тулзов
    init(collectionView: UICollectionView, tools: [AnyTool]) {
        self.tools = tools
        self.collectionView = collectionView
        super.init()
        collectionView.dataSource = self
        collectionView.register(ToolsCollectionViewCell.self, forCellWithReuseIdentifier: ToolsCollectionViewCell.identifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tools.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToolsCollectionViewCell.identifier, for: indexPath) as! ToolsCollectionViewCell
        cell.toolName.text = tools[indexPath.row].name
        cell.toolImageView.image = UIImage(named: tools[indexPath.row].name)
        return cell
    }
}
