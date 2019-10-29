package pl.com.szczeciak.station;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.szczeciak.items.Item;
import pl.com.szczeciak.items.ItemRepository;

import java.util.List;

@Controller
@RequestMapping("/stations")
public class StationController {

    @Autowired
    StationRepository stationRepository;

    @Autowired
    ItemRepository itemRepository;

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

    @GetMapping("/edit/{id}")
    public String editStation(Model model, @PathVariable long id){
        Station station = stationRepository.findStationById(id);
        model.addAttribute("station", station);

        List<Item> items = itemRepository.findAllByStationId(id);
        model.addAttribute("items", items);

        return "station";
    }

    @PostMapping("/edit/{id}")
    public String editStation(Model model, @ModelAttribute Station station){

        stationRepository.save(station);
        String station_id = station.getId().toString();

        return "redirect: ../show/" + station_id;
    }

/*
    @ModelAttribute("stations")
    public List<Station> getUsers() {
        return stationRepository.findAll();
    }*/


}
