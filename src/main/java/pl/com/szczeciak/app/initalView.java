package pl.com.szczeciak.app;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.com.szczeciak.items.Item;
import pl.com.szczeciak.items.ItemRepository;
import pl.com.szczeciak.station.Station;
import pl.com.szczeciak.station.StationRepository;
import pl.com.szczeciak.user.User;
import pl.com.szczeciak.user.UserRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class initalView {

    @Autowired
    StationRepository stationRepository;

    @Autowired
    ItemRepository itemRepository;

    @Autowired
    UserRepository userRepository;

    @GetMapping("/")
    public String login(){
        return "login";
    }

    @PostMapping("/")
    public String login(@RequestParam String username, @RequestParam String password, Model model){
        User user = userRepository.findByUsername(username);
        model.addAttribute("isLogged", false);

        if(user == null){
            return "login";
        }
        if (BCrypt.checkpw(password, user.getPassword())){
            model.addAttribute("userSession", user);
            model.addAttribute("isLogged", true);
            return "redirect:home";
        }
        return "login";
    }

    @GetMapping("/home")
    public String initialView(Model model){
        List<Station> stations = stationRepository.findAll();
        model.addAttribute("stations", stations);

        List<List<Item>> itemArray = new ArrayList<List<Item>>();

        Map<Integer, Integer> quantities = new HashMap<>();



        //todo przerobic wg metdoy pokazanej przez Marcina
        //todo ilosci zapytania do bazy - moze tak bedzie lepiej
        for (int i = 1; i < stations.size()+1; i++) {
            List<Item> items = itemRepository.findAllByStationId((long) i);
            itemArray.add(items);
            quantities.put(Integer.valueOf(i-1), Integer.valueOf(items.size()));
        }


        model.addAttribute("itemArray", itemArray);
        model.addAttribute("qty", quantities);

        return "home";
    }

}
