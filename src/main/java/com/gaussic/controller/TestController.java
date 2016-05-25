package com.gaussic.controller;

import org.json.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.org.mozilla.javascript.internal.json.JsonParser;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by fengxiangli on 16/5/22.
 */
@Controller
public class TestController {
    @RequestMapping("tableDemoAjax")
    @ResponseBody
    public String tableDemoAjax(@RequestParam String aoData) {

        JSONArray jsonarray = new JSONArray(aoData);

        System.out.println(aoData);

        String sEcho = null;
        int iDisplayStart = 0; // 起始索引
        int iDisplayLength = 0; // 每页显示的行数

        for (int i = 0; i < jsonarray.length(); i++) {
            JSONObject obj = (JSONObject) jsonarray.get(i);
            if (obj.get("name").equals("sEcho"))
                sEcho = obj.get("value").toString();

            if (obj.get("name").equals("iDisplayStart"))
                iDisplayStart = obj.getInt("value");

            if (obj.get("name").equals("iDisplayLength"))
                iDisplayLength = obj.getInt("value");
        }

        // 生成20条测试数据
        List<String[]> lst = new ArrayList<String[]>();
        for (int i = 0; i < 25; i++) {
            String[] d = { "co1_data" + i, "col2_data" + i };
            lst.add(d);
        }

        JSONObject getObj = new JSONObject();
        getObj.put("sEcho", sEcho);// 不知道这个值有什么用,有知道的请告知一下
//        getObj.put("iTotalRecords", lst.size() );//实际的行数
        getObj.put("iTotalDisplayRecords", lst.size());//显示的行数,这个要和上面写的一样

        getObj.put("aaData", lst.subList(iDisplayStart,iDisplayStart + iDisplayLength));//要以JSON格式返回
        return getObj.toString();
    }
}
