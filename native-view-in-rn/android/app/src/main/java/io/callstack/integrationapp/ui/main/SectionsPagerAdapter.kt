package io.callstack.integrationapp.ui.main

import android.content.Context
import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentPagerAdapter
import io.callstack.integrationapp.R

private val TAB_TITLES = arrayOf(
    R.string.tab_text_native,
    R.string.tab_text_react
)

class SectionsPagerAdapter(private val context: Context, fm: FragmentManager) : FragmentPagerAdapter(fm) {

    override fun getItem(position: Int): Fragment {
        when(position){
            0 -> return NativeFragment.newInstance()
            1 -> return MyReactFragment.newInstance()
        }
        return Fragment()
    }

    override fun getPageTitle(position: Int): CharSequence? {
        return context.resources.getString(TAB_TITLES[position])
    }

    override fun getCount(): Int {
        return TAB_TITLES.size
    }
}