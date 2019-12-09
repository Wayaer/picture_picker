package picture.picker;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.util.ArrayMap;
import android.util.Base64;

import androidx.annotation.RequiresApi;

import com.luck.picture.lib.PictureSelector;
import com.luck.picture.lib.config.PictureMimeType;
import com.luck.picture.lib.entity.LocalMedia;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import static android.app.Activity.RESULT_OK;

public class PicturePickerPlugin implements MethodCallHandler, PluginRegistry.ActivityResultListener {
    private Activity activity;
    private Result result;
    private MethodCall call;

    private PicturePickerPlugin(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "PicturePicker");
        final PicturePickerPlugin plugin = new PicturePickerPlugin(registrar.activity());
        channel.setMethodCallHandler(plugin);
        registrar.addActivityResultListener(plugin);
    }

    @Override
    public void onMethodCall(MethodCall c, Result res) {
        result = res;
        call = c;
        switch (call.method) {
            case "openSelect":
                PicturePicker.openSelect(activity, call);
                break;
            case "openCamera":
                PicturePicker.openCamera(activity, call);
                break;
            case "deleteCacheDirFile":
                PicturePicker.deleteCacheDirFile(activity, call);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public boolean onActivityResult(int requestCode, int resultCode, Intent intent) {
        if (resultCode == RESULT_OK) {
            List<LocalMedia> selectList = PictureSelector.obtainMultipleResult(intent);
            onChooseResult(selectList);
//                    // 图片、视频、音频选择结果回调
//                    // 例如 LocalMedia 里面返回四种path
//                    // 1.media.getPath(); 为原图path
//                    // 2.media.getCutPath();为裁剪后path，需判断media.isCut();是否为true  注意：音视频除外
//                    // 3.media.getCompressPath();为压缩后path，需判断media.isCompressed();是否为true  注意：音视频除外
//                    // 如果裁剪并压缩了，以取压缩路径为准，因为是先裁剪后压缩的
//                    // 4.media.getAndroidQToPath();为Android Q版本特有返回的字段，此字段有值就用来做上传使用
        } else {
            this.result.success("cancel");
        }
        return false;
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    private void onChooseResult(List<LocalMedia> selectList) {
        List<Map<String, Object>> resultList = new ArrayList<>();
        selectList.forEach(localMedia -> {
            Map<String, Object> resultMap = new ArrayMap<>();
            resultMap.put("path", localMedia.getPath());
            resultMap.put("size", localMedia.getSize());
            if (localMedia.isCut()) {
                resultMap.put("cutPath", localMedia.getCutPath());
            }
            if (localMedia.isCompressed()) {
                resultMap.put("compressPath", localMedia.getCompressPath());
            }
            if (localMedia.getChooseModel() == PictureMimeType.ofVideo()) {
                resultMap.put("duration", localMedia.getDuration());
            }
            resultMap.put("width", localMedia.getWidth());
            resultMap.put("height", localMedia.getHeight());
            resultList.add(resultMap);
        });
        result.success(resultList);
    }

    private static String encodeBase64(String path) throws Exception {
        File file = new File(path);
        FileInputStream inputFile = new FileInputStream(file);
        byte[] buffer = new byte[(int) file.length()];
        inputFile.read(buffer);
        inputFile.close();
        return Base64.encodeToString(buffer, Base64.DEFAULT);
    }

}
