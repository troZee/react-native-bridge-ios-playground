package io.callstack.integrationapp.ui.main

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import com.facebook.react.ReactInstanceManager
import com.facebook.react.ReactRootView
import com.facebook.react.modules.core.DefaultHardwareBackBtnHandler
import com.facebook.react.common.LifecycleState
import com.facebook.react.shell.MainReactPackage

import io.callstack.integrationapp.BuildConfig


class MyReactFragment : Fragment() {

    private lateinit var mReactRootView: ReactRootView
    private lateinit var mReactInstanceManager: ReactInstanceManager

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        mReactRootView = ReactRootView(activity!!)
        mReactInstanceManager = ReactInstanceManager.builder()
            .setApplication(activity!!.application)
            .setCurrentActivity(activity!!)
            .setBundleAssetName("index.android.bundle")
            .setJSMainModulePath("index")
            .addPackage(MainReactPackage())
            .setUseDeveloperSupport(BuildConfig.DEBUG)
            .setInitialLifecycleState(LifecycleState.RESUMED)
            .build()

        val initialProperties = Bundle()
        initialProperties.putIntArray("scores", IntArray(0))

        mReactRootView.startReactApplication(mReactInstanceManager, "RNHighScores", initialProperties)

        return mReactRootView
    }

    override fun onResume() {
        super.onResume()
        mReactInstanceManager.onHostResume(activity, activity as DefaultHardwareBackBtnHandler?)

    }

    override fun onPause() {
        super.onPause()
        mReactInstanceManager.onHostPause(activity!!)

    }

    override fun onDestroy() {
        super.onDestroy()
        mReactInstanceManager.onHostDestroy(activity!!)
        mReactRootView.unmountReactApplication()

    }

    companion object {
        @JvmStatic
        fun newInstance() = MyReactFragment()
    }
}
