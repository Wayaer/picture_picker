package picture.picker

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Environment
import androidx.annotation.NonNull
import com.luck.picture.lib.config.PictureConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener

class PicturePickerPlugin : MethodCallHandler, ActivityAware, FlutterPlugin, ActivityResultListener {
    private lateinit var channel: MethodChannel
    override fun onMethodCall(_call: MethodCall, _result: MethodChannel.Result) {
        channelResult = _result
        call = _call
        when (call.method) {
            "openImagePicker" -> PicturePicker.openImagePicker()
            "deleteCacheDirFile" -> PicturePicker.deleteCacheDirFile()
            else -> channelResult.notImplemented()
        }
    }

    override fun onAttachedToEngine(@NonNull plugin: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(plugin.binaryMessenger, "PicturePicker")
        channel.setMethodCallHandler(this)
        context = plugin.applicationContext

    }


    companion object {
        lateinit var context: Context
        lateinit var call: MethodCall
        lateinit var activity: Activity
        lateinit var channelResult: MethodChannel.Result
    }

    ///主要是用于获取当前flutter页面所处的Activity.
    override fun onAttachedToActivity(plugin: ActivityPluginBinding) {
        activity = plugin.activity
        plugin.addActivityResultListener(this)
    }

    ///主要是用于获取当前flutter页面所处的Activity.
    override fun onDetachedFromActivity() {
    }

    ///Activity注销时
    override fun onReattachedToActivityForConfigChanges(plugin: ActivityPluginBinding) {
        plugin.removeActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        channel.setMethodCallHandler(null)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, intent: Intent?): Boolean {
        if (resultCode == Activity.RESULT_OK) {
            if (requestCode == PictureConfig.REQUEST_CAMERA || requestCode == PictureConfig.CHOOSE_REQUEST) {
                channelResult.success(PicturePicker.onResult(intent))
            }
        }
        return true
    }

}