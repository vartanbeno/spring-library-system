package com.vartanbeno.controller;

import com.vartanbeno.model.User;
import com.vartanbeno.model.UserOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/authenticate")
    public String authenticate(
            @ModelAttribute("user") User user,
            Model model
    ) {
        User theUser = UserOperations.getUser(user.getUsername(), user.getPassword());
        if (theUser == null) {
            return "redirect:/login";
        }
        else {
            return "redirect:/";
        }
    }

}
