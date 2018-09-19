package com.vartanbeno.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    /*
    This is not a good solution to set the base url.
    There's surely a better way...
     */
//    @GetMapping("/")
//    public ModelAndView redirectToLogin() {
//        return new ModelAndView("redirect:/login");
//    }

}
