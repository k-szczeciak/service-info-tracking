package pl.com.szczeciak.station;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/stations")
public class StationController {

    @Autowired
    StationRepository stationRepository;

    @GetMapping("/all")
    public String showAllStations(Model model){
        List<Station> stations = stationRepository.findAll();
        model.addAttribute("stations", stations);
        return "stationList";
    }

    @GetMapping("/add")
    public String addStation(Model model){
        Station station = new Station();
        model.addAttribute("station", station);
//        List<Station> stations = stationRepository.findAll();
//        model.addAttribute("stations", stations);
        return "stationAdd";
    }


    @PostMapping("/add")
    public String addStation(@ModelAttribute Station station){
        stationRepository.save(station);
        return "redirect: /";
    }

/*
    @ModelAttribute("stations")
    public List<Station> getUsers() {
        return stationRepository.findAll();
    }*/


}
