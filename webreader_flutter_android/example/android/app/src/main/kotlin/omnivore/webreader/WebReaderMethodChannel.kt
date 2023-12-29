package omnivore.webreader

import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * @author luwenjie on 2023/12/21 15:26:05
 */
class WebReaderMethodChannel : MethodChannel.MethodCallHandler {

    companion object {
        private const val TAG = "omnivore.webreader"
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.i(TAG, "call from flutter ${call.method} ${call.arguments}")
        when (call.method) {
            "requestReviewInApp" -> { //                result.success(RateManager.showRate(MainApplication.get()));
            }


        }
    }


}