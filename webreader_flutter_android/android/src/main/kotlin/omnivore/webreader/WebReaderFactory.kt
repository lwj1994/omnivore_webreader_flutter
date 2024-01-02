package omnivore.webreader

import android.content.Context
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 * @author luwenjie on 2024/1/2 17:10:25
 */
class WebReaderFactory(createArgsCodec: MessageCodec<Any>? = StandardMessageCodec.INSTANCE) :
    PlatformViewFactory(createArgsCodec) {


    companion object {
        private const val TAG = "WebReaderFactory"
    }

    override fun create(context: Context, p1: Int, args: Any?): PlatformView {
        return WebReaderView(context);
    }
}