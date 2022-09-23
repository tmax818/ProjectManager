package tylermaxwell.projectmanager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import tylermaxwell.projectmanager.models.LoginUser;
import tylermaxwell.projectmanager.models.User;
import tylermaxwell.projectmanager.services.UserService;

@Controller
public class MainController {

    @Autowired
    UserService userService;

    @GetMapping("/")
    public String index(Model model){

        // Bind empty User and LoginUser objects to capture form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
}
