package pl.com.szczeciak.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.Message;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    public SimpleMailMessage template;

    @Autowired
    EmailServiceImpl emailService;

    @GetMapping("/all")
    public String showAllUsers(Model model){
        List<User> users = userRepository.findAll();

        model.addAttribute("users", users);
        return "userList";
    }


    @GetMapping("/sendMail")
    public String sendMail(Model model){
        Email email = new Email();
        model.addAttribute("email", email);
        return "mailSend";
    }

    @PostMapping("/sendMail")
    public String sendMail(Model model, @ModelAttribute Email email){
        emailService.sendSimpleMessage(email.getTo(), email.getSubject(), email.getText());
        return "redirect: /";
    }
}
