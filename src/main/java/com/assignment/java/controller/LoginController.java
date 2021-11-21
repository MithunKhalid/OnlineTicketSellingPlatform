package com.assignment.java.controller;

import com.assignment.java.dao.UserDao;
import com.assignment.java.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @RequestMapping(value ="/loginForm" ,method = RequestMethod.GET)
    private String showLoginForm(ModelMap model) {

        User user = new User();
        model.addAttribute("user", user);
        return "login";
    }

    @RequestMapping(value ="/loginForm" ,method = RequestMethod.POST)
    private String createUserGet(@ModelAttribute("user") User user, ModelMap model, HttpServletRequest request) {

        String role = null;
        final String SESSION_ROLE = "role";

        user = userDao.loginUser(user);
        if(user==null){
            model.addAttribute("errorMsg","Login Denied");
            User user1 = new User();
            model.addAttribute("user", user1);
            return "login";
        }
        else{
            System.out.println("getUserName in controller "+user.getUserName());
            System.out.println("role in controller "+user.getRole());
            HttpSession session = request.getSession();
            session.setAttribute("role", user.getRole());
            session.setAttribute("username", user.getUserName());
        }
        return "home";

    }

    @RequestMapping(value ="/logout" ,method = RequestMethod.GET)
    private String logout(ModelMap model, HttpServletRequest request) {

        HttpSession session=request.getSession();
        session.invalidate();
        User user = new User();
        model.addAttribute("user", user);
        return "login";
    }
}
