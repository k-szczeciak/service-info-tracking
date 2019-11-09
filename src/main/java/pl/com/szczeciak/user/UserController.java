package pl.com.szczeciak.user;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.szczeciak.station.Station;
import pl.com.szczeciak.station.StationRepository;

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

    @Autowired
    StationRepository stationRepository;


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

    @GetMapping("/add")
    public String addUser(Model model){
        User user = new User();
        model.addAttribute("user", user);

        return "userAdd";
    }

    @PostMapping("/add")
    public String addUser(@ModelAttribute User user){
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
        return "userList";
    }

    @ModelAttribute("stations")
    List<Station> getStations() {
        List<Station> stations = stationRepository.findAll();
        return stations;
    }
}
