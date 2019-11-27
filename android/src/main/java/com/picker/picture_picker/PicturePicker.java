package com.picker.picture_picker;

import android.app.Activity;
import android.util.Log;

import com.bumptech.glide.Glide;
import com.bumptech.glide.GlideBuilder;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.GlideException;
import com.luck.picture.lib.PictureSelector;
import com.luck.picture.lib.config.PictureConfig;
import com.luck.picture.lib.config.PictureMimeType;
import com.luck.picture.lib.tools.PictureFileUtils;

import io.flutter.plugin.common.MethodCall;

@SuppressWarnings("ALL")
class PicturePicker {
    static void openSelect(Activity activity, MethodCall call) {

        int maxSelectNum = call.argument("maxSelectNum");
        int minSelectNum = call.argument("minSelectNum");
        int imageSpanCount = call.argument("imageSpanCount");
        int selectionMode = call.argument("selectionMode");
        boolean previewImage = call.argument("previewImage");
        boolean isZoomAnim = call.argument("isZoomAnim");
        boolean isCamera = call.argument("isCamera");
        boolean enableCrop = call.argument("enableCrop");
        boolean compress = call.argument("compress");
        boolean hideBottomControls = call.argument("hideBottomControls");
        boolean freeStyleCropEnabled = call.argument("freeStyleCropEnabled");
        boolean showCropCircle = call.argument("showCropCircle");
        boolean showCropFrame = call.argument("showCropFrame");
        boolean showCropGrid = call.argument("showCropGrid");
        boolean openClickSound = call.argument("openClickSound");
        int minimumCompressSize = call.argument("minimumCompressSize");
        boolean isGif = call.argument("isGif");
        boolean rotateEnabled = call.argument("rotateEnabled");
        boolean scaleEnabled = call.argument("scaleEnabled");
//        List<LocalMedia> selectList = call.argument("selectList");
        int CropW = call.argument("CropW");
        int CropH = call.argument("CropH");
        int cropCompressQuality = call.argument("cropCompressQuality");
        int selectValueType = call.argument("selectValueType");
        int videoQuality = call.argument("videoQuality");
        int videoMaxSecond = call.argument("videoMaxSecond");
        int videoMinSecond = call.argument("videoMinSecond");
        int recordVideoSecond = call.argument("recordVideoSecond");

        int pictureMimeType = 0;
        if (selectValueType == 1) {
            pictureMimeType = PictureMimeType.ofImage();
        } else if (selectValueType == 2) {
            pictureMimeType = PictureMimeType.ofVideo();
        } else if (selectValueType == 3) {
            pictureMimeType = PictureMimeType.ofAudio();
        } else {
            pictureMimeType = PictureMimeType.ofAll();
        }

        PictureSelector.create(activity)
                .openGallery(pictureMimeType)//全部.PictureMimeType.ofAll()、图片.ofImage()、视频.ofVideo()、音频.ofAudio()
                .loadImageEngine(GlideEngine.createGlideEngine())
                .maxSelectNum(maxSelectNum) // 最大图片选择数量 int
                .minSelectNum(minSelectNum) // 最小选择数量 int
                .imageSpanCount(imageSpanCount) // 每行显示个数 int
                .selectionMode(selectionMode == 1 ? PictureConfig.SINGLE : PictureConfig.MULTIPLE) // 多选 or 单选 PictureConfig.MULTIPLE or PictureConfig.SINGLE
                .previewImage(previewImage) // 是否可预览图片 true or false
                .previewVideo(false) // 是否可预览视频 true or false
                .enablePreviewAudio(false) // 是否可播放音频 true or false
                .isCamera(isCamera) // 是否显示拍照按钮 true or false
                .imageFormat(PictureMimeType.PNG) // 拍照保存图片格式后缀,默认jpeg
                .isZoomAnim(isZoomAnim) // 图片列表点击 缩放效果 默认true
                .sizeMultiplier(0.5f) // glide 加载图片大小 0~1之间 如设置 .glideOverride()无效
                .enableCrop(enableCrop) // 是否裁剪 true or false
                .compress(compress) // 是否压缩 true or false
                .glideOverride(160, 160) // int glide 加载宽高，越小图片列表越流畅，但会影响列表图片浏览的清晰度
                .withAspectRatio(CropW, CropH) // int 裁剪比例 如16:9 3:2 3:4 1:1 可自定义
                .hideBottomControls(hideBottomControls) // 是否显示uCrop工具栏，默认不显示 true or false
                .isGif(isGif) // 是否显示gif图片 true or false
                .freeStyleCropEnabled(freeStyleCropEnabled) // 裁剪框是否可拖拽 true or false
                .circleDimmedLayer(showCropCircle) // 是否圆形裁剪 true or false
                .showCropFrame(showCropFrame) // 是否显示裁剪矩形边框 圆形裁剪时建议设为false   true or false
                .showCropGrid(showCropGrid) // 是否显示裁剪矩形网格 圆形裁剪时建议设为false    true or false
                .openClickSound(openClickSound) // 是否开启点击声音 true or false
                .cropCompressQuality(cropCompressQuality) // 裁剪压缩质量 默认90 int
                .minimumCompressSize(minimumCompressSize) // 小于100kb的图片不压缩
                .synOrAsy(true) //同步true或异步false 压缩 默认同步
                .rotateEnabled(rotateEnabled) // 裁剪是否可旋转图片 true or false
                .scaleEnabled(scaleEnabled) // 裁剪是否可放大缩小图片 true or false
//                .selectionMedia(selectList) // 当前已选中的图片 List
//                .selectionMedia(selectList) // 当前已选中的视频 List
                .videoQuality(videoQuality) // 视频录制质量 0 or 1 int
                .videoMaxSecond(videoMaxSecond) // 显示多少秒以内的视频or音频也可适用 int
                .videoMinSecond(videoMinSecond) // 显示多少秒以内的视频or音频也可适用 int
                .recordVideoSecond(recordVideoSecond) //视频秒数录制 默认60s int
                .forResult(PictureConfig.CHOOSE_REQUEST);//结果回调onActivityResult code

    }


    public static void openCamera(Activity activity, MethodCall call) {
        int maxSelectNum = call.argument("maxSelectNum");
        int minSelectNum = call.argument("minSelectNum");
        int imageSpanCount = call.argument("imageSpanCount");
        int selectionMode = call.argument("selectionMode");
        boolean previewImage = call.argument("previewImage");
        boolean previewVideo = call.argument("previewVideo");
        boolean isZoomAnim = call.argument("isZoomAnim");
        boolean isCamera = call.argument("isCamera");
        boolean enableCrop = call.argument("enableCrop");
        boolean compress = call.argument("compress");
        boolean hideBottomControls = call.argument("hideBottomControls");
        boolean freeStyleCropEnabled = call.argument("freeStyleCropEnabled");
        boolean showCropCircle = call.argument("showCropCircle");
        boolean showCropFrame = call.argument("showCropFrame");
        boolean showCropGrid = call.argument("showCropGrid");
        boolean openClickSound = call.argument("openClickSound");
        int minimumCompressSize = call.argument("minimumCompressSize");
        boolean isGif = call.argument("isGif");
        boolean rotateEnabled = call.argument("rotateEnabled");
        boolean scaleEnabled = call.argument("scaleEnabled");
//        List<LocalMedia> selectList = call.argument("selectList");
        int CropW = call.argument("CropW");
        int CropH = call.argument("CropH");
        int cropCompressQuality = call.argument("cropCompressQuality");
        int selectValueType = call.argument("selectValueType");
        int videoQuality = call.argument("videoQuality");
        int videoMaxSecond = call.argument("videoMaxSecond");
        int videoMinSecond = call.argument("videoMinSecond");
        int recordVideoSecond = call.argument("recordVideoSecond");

        int pictureMimeType = 0;
        if (selectValueType == 1) {
            pictureMimeType = PictureMimeType.ofImage();
        } else if (selectValueType == 2) {
            pictureMimeType = PictureMimeType.ofVideo();
        } else if (selectValueType == 3) {
            pictureMimeType = PictureMimeType.ofAudio();
        } else {
            pictureMimeType = PictureMimeType.ofAll();
        }

        PictureSelector.create(activity)
                .openCamera(pictureMimeType)
                .imageFormat(PictureMimeType.PNG)// 拍照保存图片格式后缀,默认jpeg
                .enableCrop(enableCrop)// 是否裁剪 true or false
                .compress(compress)// 是否压缩 true or false
                .glideOverride(160, 160)// int glide 加载宽高，越小图片列表越流畅，但会影响列表图片浏览的清晰度
                .withAspectRatio(CropW, CropH)// int 裁剪比例 如16:9 3:2 3:4 1:1 可自定义
                .hideBottomControls(enableCrop)// 是否显示uCrop工具栏，默认不显示 true or false
                .freeStyleCropEnabled(freeStyleCropEnabled)// 裁剪框是否可拖拽 true or false
                .circleDimmedLayer(showCropCircle)// 是否圆形裁剪 true or false
                .showCropFrame(showCropFrame)// 是否显示裁剪矩形边框 圆形裁剪时建议设为false   true or false
                .showCropGrid(showCropGrid)// 是否显示裁剪矩形网格 圆形裁剪时建议设为false    true or false
                .cropCompressQuality(cropCompressQuality)// 裁剪压缩质量 默认90 int
                .minimumCompressSize(minimumCompressSize)// 小于100kb的图片不压缩
                .synOrAsy(true)//同步true或异步false 压缩 默认同步
                .rotateEnabled(rotateEnabled) // 裁剪是否可旋转图片 true or false
                .scaleEnabled(scaleEnabled)// 裁剪是否可放大缩小图片 true or false
                .openClickSound(openClickSound)// 是否开启点击声音 true or false
                .maxSelectNum(maxSelectNum)// 最大图片选择数量 int
                .minSelectNum(minSelectNum)// 最小选择数量 int
                .imageSpanCount(imageSpanCount)// 每行显示个数 int
                .selectionMode(selectionMode)// 多选 or 单选 PictureConfig.MULTIPLE or PictureConfig.SINGLE
                .previewImage(previewImage)// 是否可预览视频 true or false
                .previewVideo(previewVideo)// 是否可预览视频 true or false
                .videoQuality(videoQuality)// 视频录制质量 0 or 1 int
                .videoMaxSecond(videoMaxSecond)// 显示多少秒以内的视频or音频也可适用 int
                .videoMinSecond(videoMinSecond)// 显示多少秒以内的视频or音频也可适用 int
                .recordVideoSecond(recordVideoSecond)
                .forResult(PictureConfig.REQUEST_CAMERA);

    }

    public static void deleteCacheDirFile(Activity activity, MethodCall call) {
        int selectValueType = call.argument("selectValueType");
        int pictureMimeType = 0;
        if (selectValueType == 1) {
            pictureMimeType = PictureMimeType.ofImage();
        } else if (selectValueType == 2) {
            pictureMimeType = PictureMimeType.ofVideo();
        } else if (selectValueType == 3) {
            pictureMimeType = PictureMimeType.ofAudio();
        } else {
            pictureMimeType = PictureMimeType.ofAll();
        }
        PictureFileUtils.deleteCacheDirFile(activity, pictureMimeType);
    }
}

