package pl.com.szczeciak.station;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
