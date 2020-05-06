package picture.picker.example;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
//    Log.i("PicturePicker====", String.valueOf(requestCode));
//    Log.i("PicturePicker====", String.valueOf(resultCode));
//    Log.i("PicturePicker====", String.valueOf(data));

    }
}
