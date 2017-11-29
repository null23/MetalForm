package com.exskil.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LENOVO on 2017/5/30.
 */
@Controller
@RequestMapping("error")
public class ErrorController {

    @RequestMapping("nopermission")
    public String nopermission(){
        return "error/nopermission";
    }
}
