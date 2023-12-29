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
 * @author luwenjie on 2023/12/21 15:21:31
 */
class WebReaderFlutterPlugin : FlutterPlugin, ActivityAware {


    companion object {
        private const val TAG = "WebReaderFlutterPlugin"
        const val CHANNEL_NAME = "omnivore.webreader"
        var channel: MethodChannel? = null
        fun registerWith() {

        }
    }

    private var activityPluginBinding: ActivityPluginBinding? = null
    private val onNewIntent = PluginRegistry.NewIntentListener {
        Log.i("CongressPlugin", "onNewIntent: ${it.toString()}")
        return@NewIntentListener false
    }


    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        setupChannel(binding.binaryMessenger, binding.applicationContext)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        teardownChannel()
    }

    private fun setupChannel(messenger: BinaryMessenger, context: Context) {
        channel = MethodChannel(messenger, CHANNEL_NAME)
        val handler = WebReaderMethodChannel()
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
        Log.i("CongressPlugin", "onDetachedFromActivityForConfigChanges")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        Log.i("CongressPlugin", "onReattachedToActivityForConfigChanges")
    }

    override fun onDetachedFromActivity() {
        Log.i("CongressPlugin", "onDetachedFromActivity")
        activityPluginBinding?.removeOnNewIntentListener(onNewIntent);
        activityPluginBinding = null
    }

}