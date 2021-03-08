package io.github.v7lin.advertising_identifier;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;

import androidx.annotation.NonNull;

import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * AdvertisingIdentifierPlugin
 */
public class AdvertisingIdentifierPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context applicationContext;
    private Handler mainHandler;

    // --- FlutterPlugin

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), "v7lin.github.io/advertising_identifier");
        channel.setMethodCallHandler(this);
        applicationContext = binding.getApplicationContext();
        mainHandler = new Handler(Looper.getMainLooper());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
        applicationContext = null;
        mainHandler.removeCallbacksAndMessages(null);
        mainHandler = null;
    }

    // --- MethodCallHandler

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull final Result result) {
        if ("getAdvertisingIdInfo".equals(call.method)) {
            final Context context = applicationContext;
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        final AdvertisingIdClient.Info advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(context);
                        if (advertisingIdInfo != null) {
                            if (mainHandler != null) {
                                mainHandler.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        Map<String, Object> map = new HashMap<>();
                                        map.put("id", advertisingIdInfo.getId());
                                        map.put("is_limit_ad_tracking_enabled", advertisingIdInfo.isLimitAdTrackingEnabled());
                                        result.success(map);
                                    }
                                });
                            }
                        } else {
                            if (mainHandler != null) {
                                mainHandler.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        result.error("FAILED", "AdvertisingIdInfo is null", null);
                                    }
                                });
                            }
                        }
                    } catch (final IOException | GooglePlayServicesNotAvailableException | GooglePlayServicesRepairableException e) {
                        if (mainHandler != null) {
                            mainHandler.post(new Runnable() {
                                @Override
                                public void run() {
                                    String errorMessage = e.getMessage();
                                    if (TextUtils.isEmpty(errorMessage)) {
                                        errorMessage = e.getClass().getSimpleName();
                                    }
                                    result.error("FAILED", errorMessage, null);
                                }
                            });
                        }
                    }
                }
            }, "advertising_identifier").start();
        } else {
            result.notImplemented();
        }
    }
}
