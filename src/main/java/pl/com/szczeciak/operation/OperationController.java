package pl.com.szczeciak.operation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.szczeciak.station.Station;
import pl.com.szczeciak.station.StationController;
import pl.com.szczeciak.station.StationRepository;

import java.util.List;

@Controller
@RequestMapping("/operations")
public class OperationController {

    @Autowired
    OperationRepository operationRepository;

    @Autowired
    StationRepository stationRepository;

    @GetMapping("/all")
    public String showlAllOperations(Model model){
        List<Operation> operations = operationRepository.findAll();
        model.addAttribute("operations", operations);
        return "operationList";
    }

    @ModelAttribute("stations")
    List<Station> getStations() {
        List<Station> stations = stationRepository.findAll();
        return stations;
    }
}
