package omnivore.webreader

import android.content.Context
import android.util.Log
import android.view.View
import android.webkit.WebView
import io.flutter.plugin.platform.PlatformView

/**
 * @author luwenjie on 2024/1/2 16:56:41
 */
class WebReaderView(private val context: Context) : PlatformView {
    private val webView = WebView(context);

    companion object {
        private const val TAG = "ViewFactory"
        const val VIEW_TYPE = "plugins.omnivore/webreader"
    }


    override fun onFlutterViewAttached(flutterView: View) {
        super.onFlutterViewAttached(flutterView)
        Log.i(TAG, "onFlutterViewAttached")
        webView.loadUrl("https://baidu.com")
    }

    override fun getView(): View {
        return webView
            .apply {

            };
    }

    override fun onFlutterViewDetached() {
        super.onFlutterViewDetached()
        Log.i(TAG, "onFlutterViewDetached")

    }

    override fun dispose() {
        Log.i(TAG, "dispose")

    }
}