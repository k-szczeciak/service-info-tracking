/*
* ToDo:
*  - zamiast my account = nazwa uzytkowanika
*  - zwijanie listy w widoku ogolnym
*  - autoryzacja w wsesji
*  - przechodzenie pomiedzy widokami dopracowac
*  - formatowanie obrazow
*  - walidacja
*  - sprawdzanie uzytkownika
*  - statystyki
*  - wyszukiwania
*
*
*
* */


package pl.com.szczeciak.app;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.szczeciak.items.Item;
import pl.com.szczeciak.items.ItemRepository;
import pl.com.szczeciak.station.Station;
import pl.com.szczeciak.station.StationRepository;
import pl.com.szczeciak.user.User;
import pl.com.szczeciak.user.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;

@Controller
@SessionAttributes("userSession")
public class initalView {

    @Autowired
    StationRepository stationRepository;

    @Autowired
    ItemRepository itemRepository;

    @Autowired
    UserRepository userRepository;

    @GetMapping("/login")
    public String login(HttpSession session, Model model, HttpServletRequest request){
        //automatic log out

        User user = null;
        user = (User)session.getAttribute("userSession");
        model.addAttribute("userSession", user);

        //session.setAttribute("userSession", user);

        user = (User)session.getAttribute("userSession");
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model, HttpServletRequest request){
        String refer = request.getHeader("Referer");
        HttpSession session = request.getSession();
        User user = userRepository.findByUsername(username);
        model.addAttribute("isLogged", false);

        String requestetUrl = null;
        if (null != session.getAttribute("requestetUrl")){
            requestetUrl = session.getAttribute("requestetUrl").toString();
        }

//        String url = request.getRequestURL().toString();

        if(user == null){
            return "login";
        }
        if (BCrypt.checkpw(password, user.getPassword())){
            model.addAttribute("userSession", user);
            model.addAttribute("isLogged", true);
/*
            if (!url.equals(refer)){
                return "redirect:" + refer;
            }else{
                return "redirect:/home";
            }*/

            if (null != requestetUrl){
                return "redirect:" + requestetUrl;
            }else{
                return "redirect: /home";
            }
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

/*
    @GetMapping("/")
    public String searchPageInit(Model model){

        return "search";
    }
*/

    @GetMapping("/")
    public String searchPage(Model model, @RequestParam(required = false)String query){
        model.addAttribute("query", query);
        String results = "no results";
        List<Item> items = itemRepository.findAllByMnr(query);
        if (items.isEmpty()){
            items = itemRepository.findAllBySn(query);
        }
        if (!items.isEmpty()){
            model.addAttribute("items", items);
            results = "wyniki:";
        }
        model.addAttribute("results", results);
        //next: search by sn and add list

        return "search";
    }

}
