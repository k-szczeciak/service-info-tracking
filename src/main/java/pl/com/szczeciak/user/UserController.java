package pl.com.szczeciak.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.jws.soap.SOAPBinding;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/allUsers")
    public String showAllUsers(Model model){
        List<User> users = userRepository.findAll();

        model.addAttribute("users", users);
        return "userList";
    }
}
