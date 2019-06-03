package pl.com.szczeciak.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    public SimpleMailMessage template;

    @GetMapping("/all")
    public String showAllUsers(Model model){
        List<User> users = userRepository.findAll();

        model.addAttribute("users", users);
        return "userList";
    }


    @GetMapping("/sendMail")
    @ResponseBody
    public String sendMail(){

        return "mail sand attempt... check mail box";
    }
}
