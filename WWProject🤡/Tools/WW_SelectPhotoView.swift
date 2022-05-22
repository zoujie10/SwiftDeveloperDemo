//
//  WW_SelectPhotoView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/20.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import Photos
import CoreServices
import TZImagePickerController
//TODO

//3.select Alum
enum SelectPhotoViewType {
    case selecct_single_photo
    case select_multiple_photos
}
class WW_SelectPhotoView: UIView, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    typealias Select_photos_Block = (_ selectArray:NSArray) -> Void
    var select_photo_block : Select_photos_Block?
    
    
    var selectPhotoType : SelectPhotoViewType = .selecct_single_photo
    var imageURL : NSString = ""
    var collectionItemCount : NSInteger = 1
    var selectedPhotos = [UIImage]()
    var selectedAssets = [PHAsset]()
    var isSelectOriginalPhoto : Bool = false //是否选择原图
    var location : CLLocation?
    
    convenience init(selectType : SelectPhotoViewType,imageUrl : NSString) {
        self.init(frame: .zero)
        selectPhotoType = selectType
        imageURL = imageUrl
        makeUI()
    }
    convenience init(selectType : SelectPhotoViewType,photosCount : NSInteger) {
        self.init(frame: .zero)
        selectPhotoType = selectType
        collectionItemCount = photosCount
        makeUI()
    }
    
    
    func makeUI(){
        switch selectPhotoType {
            case .selecct_single_photo:
                configSingleImageViewUI()
                break
            case .select_multiple_photos:
                configMultipleImageViewUI()
                break
        }
    }
    
    func configSingleImageViewUI(){

        self.addSubview(self.selectImageView)
        self.selectImageView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }
        guard imageURL.length > 0 else {return}
        self.selectImageView.kf.setImage(with: URL.init(string: imageURL as String))
        self.selectImageView.kf.indicatorType = .activity
    }
    
    func configMultipleImageViewUI(){
        self.addSubview(takePhotoCollectionView)
        self.takePhotoCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
        }
    }
    
    @objc func  tapImageView(){
        pushTZImagePickerController()
    }
    
    lazy var nav : UINavigationController = {
        let n = UINavigationController.init()
        return n
    }()
    
    lazy var selectImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ww_display_uploadImage_type_UpLoadEg")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapImageView))
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    
    lazy var takePhotoCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 97, height: 97)
        let view = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        view.register(WW_AfterPickImageCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var imagePickerVc : UIImagePickerController = {
        let pick = UIImagePickerController.init()
        pick.delegate = self
//        pick.navigationBar.barTintColor = self.nav.navigationBar.barTintColor
//        pick.navigationBar.tintColor = self.nav.navigationBar.tintColor
        pick.navigationBar.barTintColor = UIColor.red
        pick.navigationBar.tintColor = UIColor.white
        let tzBarItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [TZImagePickerController.self])
        let barItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIImagePickerController.self])
        let titleTextAttributes : NSDictionary = tzBarItem.titleTextAttributes(for: .normal)! as NSDictionary
        barItem.setTitleTextAttributes(titleTextAttributes as? [NSAttributedStringKey : Any], for: .normal)
        return pick
    }()
}

extension WW_SelectPhotoView :TZImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //MARK: Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.selectedPhotos.count > 0 ? self.selectedPhotos.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WW_AfterPickImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WW_AfterPickImageCell
        if (self.selectedPhotos.count > 0){
            cell.uploadImageView.image = self.selectedPhotos[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushTZImagePickerController()
    }
    
    
    //MARK: UIImagePickerController
    func pushTZImagePickerController() {

        let imagePickerVc = TZImagePickerController(maxImagesCount: 6, columnNumber: 4, delegate: self, pushPhotoPickerVc: true)

        // MARK: - 五类个性化设置，这些参数都可以不传，此时会走默认设置
        imagePickerVc!.isSelectOriginalPhoto = isSelectOriginalPhoto
        imagePickerVc!.selectedAssets = selectedAssets as? NSMutableArray // 目前已经选中的图片数组
        imagePickerVc!.allowTakePicture = true // 在内部显示拍照按钮

        imagePickerVc!.uiImagePickerControllerSettingBlock = { imagePickerController in
            imagePickerController?.videoQuality = .typeHigh
        }
        // imagePickerVc.photoWidth = 800;
        // 2. Set the appearance
        // 2. 在这里设置imagePickerVc的外观
        imagePickerVc!.navigationBar.barTintColor = UIColor(r:252,g:85,b:108,a:1)
        imagePickerVc!.iconThemeColor = UIColor(red: 31 / 255.0, green: 185 / 255.0, blue: 34 / 255.0, alpha: 1.0)
        imagePickerVc!.showPhotoCannotSelectLayer = true
        imagePickerVc!.cannotSelectLayerColor = UIColor.white.withAlphaComponent(0.8)
        
        imagePickerVc!.photoPickerPageUIConfigBlock = { collectionView, bottomToolBar, previewButton, originalPhotoButton, originalPhotoLabel, doneButton, numberImageView, numberLabel, divideLine in
            doneButton?.setTitleColor(UIColor.red, for: .normal)
        }
        imagePickerVc!.allowPickingImage = true
        imagePickerVc!.allowPickingOriginalPhoto = false
        
        // 4. 照片排列按修改时间升序
        imagePickerVc!.sortAscendingByModificationDate = true
        imagePickerVc!.maxImagesCount = collectionItemCount
        //    / 5. Single selection mode, valid when maxImagesCount = 1
        /// 5. 单选模式,maxImagesCount为1时才生效
        imagePickerVc!.showSelectBtn = true
        imagePickerVc!.allowCrop = true
        imagePickerVc!.needCircleCrop = false
        
        // 设置竖屏下的裁剪尺寸
        //    NSInteger left = 30;
        //    NSInteger widthHeight = self.sizeWight - 2 * left;
        //    NSInteger top = (self.sizeHeight - widthHeight) / 2;
        //    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
        
        imagePickerVc!.statusBarStyle = .lightContent

        // 设置是否显示图片序号
        imagePickerVc!.showSelectedIndex = false
        let vc = topMostController()
        vc.present(imagePickerVc!, animated: true)
        
    }
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = WW_keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }

    func takePhoto() {
        let authStatus: AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        if authStatus == .restricted || authStatus == .denied {// 无相机权限 做一个友好的提示
            let alert = UIAlertController(title: "无法使用相机", message: """
                请在iPhone的\
                设置-隐私-相机\
                中允许访问相机
                """, preferredStyle: .alert)
            let action = UIAlertAction(title: "取消", style: .cancel, handler: { action in
            })
            let actionSet = UIAlertAction(title: "设置", style: .default, handler: { action in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                   guard UIApplication.shared.canOpenURL(url) else {return}
                    UIApplication.shared.open(url, options:  [UIApplicationOpenURLOptionUniversalLinksOnly : true], completionHandler: nil)
                }
            })
            alert.addAction(action)
            alert.addAction(actionSet)
            nav.present(alert, animated: true) {}
        }else if authStatus == .notDetermined{// fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
            AVCaptureDevice.requestAccess(for: .video) { [self] granted in
                if granted {
                    DispatchQueue.main.async(execute: { [self] in
                        takePhoto()
                    })
                }
            }
        }else if PHPhotoLibrary.authorizationStatus().rawValue == 2{// 已被拒绝，没有相册权限，将无法保存拍的照片
            let alert = UIAlertController(title: "无法访问相册", message: """
                请在iPhone的\
                设置-隐私-相册\
                中允许访问相册
                """, preferredStyle: .alert)
            let action = UIAlertAction(title: "取消", style: .cancel, handler: { action in
            })
            let actionSet = UIAlertAction(title: "设置", style: .default, handler: { action in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    guard UIApplication.shared.canOpenURL(url) else {return}
                    UIApplication.shared.open(url, options:  [UIApplicationOpenURLOptionUniversalLinksOnly : true], completionHandler: nil)
                }
            })
            alert.addAction(action)
            alert.addAction(actionSet)
            nav.present(alert, animated: true) {}
        }else if PHPhotoLibrary.authorizationStatus().rawValue == 0{// 未请求过相册权限
            TZImageManager().requestAuthorization() { [self] in
                takePhoto()
            }
        }else{
            pushImagePickerController()
        }
        
    }
    
    func pushImagePickerController(){
        weak var weakSelf = self
        TZLocationManager().startLocation(successBlock: { locations in
            let strongSelf = weakSelf
            strongSelf!.location = locations?.first
        }) { error in
            let strongSelf = weakSelf
            strongSelf!.location = nil
        }
        
        let sourceType: UIImagePickerController.SourceType = .camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerVc.sourceType = sourceType
            var mediaTypes: [AnyHashable] = []

            mediaTypes.append(kUTTypeImage as String)

            if mediaTypes.count != 0 {
                imagePickerVc.mediaTypes = (mediaTypes as? [String])!
            }
            nav.present(imagePickerVc, animated: true)
        }else{
            print("模拟器中无法打开照相机,请在真机中使用")
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true)
//        let type = info[UIImagePickerController.InfoKey.mediaType] as? String
        let type = info[UIImagePickerControllerMediaType] as! String
        let tzImagePickerVc = TZImagePickerController(maxImagesCount: collectionItemCount, delegate: self)!
        tzImagePickerVc.sortAscendingByModificationDate = true
        tzImagePickerVc.showProgressHUD()
        if type == "public.image"{
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            // save photo and get asset / 保存图片，获取到asset
            TZImageManager().savePhoto(with: image, location: location) { [self] asset, error in
                tzImagePickerVc.hideProgressHUD()
                if let error = error {
                    print("图片保存失败",error)
                } else {
                    let assetModel = TZImageManager().createModel(with: asset)
                    refreshCollectionView(withAddedAsset: assetModel?.asset, image: image)
                }
            }
        }
    }
    func refreshCollectionView(withAddedAsset asset: PHAsset?, image: UIImage?) {
        selectedAssets.append(asset!)
        selectedPhotos.append(image!)

        configData()
        if self.select_photo_block != nil {
            select_photo_block!(self.selectedPhotos as NSArray)
        }
        if asset != nil {
            let phAsset = asset
            if let location = phAsset?.location {
                print("location:\(location)")
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    //MARK: TZImagePickerControllerDelegate
    func tz_imagePickerControllerDidCancel(_ picker: TZImagePickerController!) {
        print("Cancel")
    }
    
    // 这个照片选择器会自己dismiss，当选择器dismiss的时候，会执行下面的代理方法
    // 你也可以设置autoDismiss属性为NO，选择器就不会自己dismis了
    // 如果isSelectOriginalPhoto为YES，表明用户选择了原图
    // 你可以通过一个asset获得原图，通过这个方法：[[TZImageManager manager] getOriginalPhotoWithAsset:completion:]
    // photos数组里的UIImage对象，默认是828像素宽，你可以通过设置photoWidth属性的值来改变它
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool, infos: [[AnyHashable : Any]]!) {
        selectedPhotos = photos
        selectedAssets = assets as! [PHAsset]
        self.isSelectOriginalPhoto = isSelectOriginalPhoto
//        selectImageView.image = photos.first
        configData()
        if select_photo_block != nil {
            select_photo_block!(selectedPhotos as NSArray)
        }
    }
    func isAlbumCanSelect(_ albumName: String!, result: PHFetchResult<AnyObject>!) -> Bool {
        return true
    }
    func configData(){
        switch self.selectPhotoType {
            case .selecct_single_photo:
                selectImageView.image = self.selectedPhotos.first
                break
            case .select_multiple_photos:
                self.takePhotoCollectionView.reloadData()
                break
        }
    }
}

