package pl.com.szczeciak.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.com.szczeciak.items.Item;
import pl.com.szczeciak.items.ItemRepository;
import pl.com.szczeciak.station.Station;
import pl.com.szczeciak.station.StationRepository;

import java.util.ArrayList;
import java.util.List;

@Controller
public class initalView {

    @Autowired
    StationRepository stationRepository;

    @Autowired
    ItemRepository itemRepository;

    @GetMapping("/")
    public String initialView(Model model){
        List<Station> stations = stationRepository.findAll();
        model.addAttribute("stations", stations);


        List<List<Item>> itemArray = new ArrayList<List<Item>>();

        for (int i = 1; i < stations.size()+1; i++) {
            List<Item> items = itemRepository.findAllByStationId((long) i);
            itemArray.add(items);
        }


        model.addAttribute("itemArray", itemArray);

        return "home";
    }

}
