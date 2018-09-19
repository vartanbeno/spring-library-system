package com.vartanbeno.controller;

import com.vartanbeno.model.User;
import com.vartanbeno.model.UserOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login(Model model, HttpServletRequest request) {
        if (loggedIn(request)) {
            return "redirect:/";
        }
        else {
            model.addAttribute("user", new User());
            request.getSession().setAttribute("loggedIn", false);
            return "login";
        }
    }

    @PostMapping("/authenticate")
    public String authenticate(
            @ModelAttribute("user") User user,
            HttpServletRequest request
    ) {
        User theUser = UserOperations.getUser(user.getUsername(), user.getPassword());
        if (theUser == null) {
            return "redirect:/login";
        }
        else {
            request.getSession().setAttribute("loggedIn", true);
            return "redirect:/";
        }
    }

    public static boolean loggedIn(HttpServletRequest request) {
        boolean loggedIn;
        try {
            loggedIn = (boolean) request.getSession().getAttribute("loggedIn");
        }
        catch (NullPointerException e) {
            loggedIn = false;
        }
        return loggedIn;
    }

}
