package pl.com.szczeciak.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.com.szczeciak.station.Station;
import pl.com.szczeciak.station.StationRepository;

import java.util.List;

@Controller
public class initalView {

    @Autowired
    StationRepository stationRepository;

    @GetMapping("/")
    public String initialView(Model model){
        List<Station> stations = stationRepository.findAll();
        model.addAttribute("stations", stations);
        return "home";
    }
}
