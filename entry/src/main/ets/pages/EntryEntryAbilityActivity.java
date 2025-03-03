// EntryEntryAbilityActivity.java
package com.example.androidTestDemo;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import java.util.HashMap;
import java.util.Map;

import ohos.ace.adapter.capability.bridge.BridgePlugin;
import ohos.ace.adapter.capability.bridge.MethodData;
import ohos.stage.ability.adapter.StageActivity;

public class EntryEntryAbilityActivity extends StageActivity {
    private BridgeImpl bridgeImpl = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        bridgeImpl = new BridgeImpl(this, "BridgeName", getBridgeManager());
        setInstanceName("com.example.basebridge:entry:EntryAbility:");
        super.onCreate(savedInstanceState);
        // 显示应用程序界面布局(在项目的 res/layout 目录下，添加main_activity.xml文件)
        setContentView(R.layout.main_activity);
        // 注册按钮
        testCallMethod1();
        testCallMethod2();
        testCallMethod3();
    }

    public void testCallMethod1() {
        // 使用button按钮点击，发送信息。
        Button button = (Button) findViewById(R.id.TestCallMethod1);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 定义对象数组，存放JS侧方法形参对应的实参
                Object[] paramObject = { "param1", 1, true};
                // 构造JS侧方法描述对象实例
                MethodData methodData = new MethodData("funTest", paramObject);
                // 调用Js侧的方法（jsMethodName）
                bridgeImpl.callMethod(methodData);
            }
        });
    }
    public void testCallMethod2() {
        // 使用button按钮点击，发送信息。
        Button button = (Button) findViewById(R.id.TestCallMethod2);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 定义对象数组，存放JS侧方法形参对应的实参
                String[] sArray = {"hello", "world"};
                int[] iArray = {123, 456};
                boolean[] bArray = {true, false};
                Object[] paramObject = {sArray, iArray, bArray};
                // 构造JS侧方法描述对象实例
                MethodData methodData = new MethodData("funTestArray", paramObject);
                // 调用Js侧的方法（jsMethodName）
                bridgeImpl.callMethod(methodData);
            }
        });
    }
    public void testCallMethod3() {
        // 使用button按钮点击，发送信息。
        Button button = (Button) findViewById(R.id.TestCallMethod3);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 定义对象数组，存放JS侧方法形参对应的实参
                Map<String, String> map1 = new HashMap<>();
                map1.put("one", "hello");
                map1.put("two", "world");
                Map<String, Integer> map2 = new HashMap<>();
                map2.put("one", 1);
                map2.put("two", 2);
                Map<String, Boolean> map3 = new HashMap<>();
                map3.put("one", true);
                map3.put("two", false);

                Object[] paramObject = {map1, map2, map3};
                // 构造JS侧方法描述对象实例
                MethodData methodData = new MethodData("funTestRecord", paramObject);
                // 调用Js侧的方法（jsMethodName）
                bridgeImpl.callMethod(methodData);
            }
        });
    }
}

