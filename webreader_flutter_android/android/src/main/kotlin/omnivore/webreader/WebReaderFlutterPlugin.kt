package omnivore.webreader

import android.content.Context
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * @author luwenjie on 2024/1/2 16:57:42
 */
class WebReaderFlutterPlugin : FlutterPlugin, ActivityAware {


    companion object {
        private const val TAG = "WebReaderFlutterPlugin"
        const val CHANNEL_NAME = "lwjlol.omnivore.webreader"

        @JvmStatic
        var channel: MethodChannel? = null


}

    private var activityPluginBinding: ActivityPluginBinding? = null
    private val onNewIntent = PluginRegistry.NewIntentListener {
        Log.i(TAG, "onNewIntent: ${it.toString()}")
        return@NewIntentListener false
    }


    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        setupChannel(binding.binaryMessenger, binding.applicationContext)
        binding.platformViewRegistry.registerViewFactory(
            WebReaderView.VIEW_TYPE,
            WebReaderFactory()
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        teardownChannel()
    }

    private fun setupChannel(messenger: BinaryMessenger, context: Context) {
        channel = MethodChannel(messenger, CHANNEL_NAME)
        val handler = WebReaderMethodCallHandler()
        channel?.setMethodCallHandler(handler)
    }

    private fun teardownChannel() {
        channel?.setMethodCallHandler(null)
        channel = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityPluginBinding = binding
        activityPluginBinding?.addOnNewIntentListener(onNewIntent)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        Log.i(TAG, "onDetachedFromActivityForConfigChanges")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        Log.i(TAG, "onReattachedToActivityForConfigChanges")
    }

    override fun onDetachedFromActivity() {
        Log.i(TAG, "onDetachedFromActivity")
        activityPluginBinding?.removeOnNewIntentListener(onNewIntent);
        activityPluginBinding = null
    }


}