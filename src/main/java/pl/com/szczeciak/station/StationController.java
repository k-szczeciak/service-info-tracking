package pl.com.szczeciak.station;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class StationController {

    @Autowired
    StationRepository stationRepository;

    @GetMapping("/allStations")
    public String showAllStations(Model model){
        List<Station> stations = stationRepository.findAll();
        model.addAttribute("stations", stations);
        return "stationList";
    }
}
