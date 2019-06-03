package pl.com.szczeciak.items;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/items")
public class ItemController {

    @Autowired
    ItemRepository itemRepository;

    @GetMapping("/all")
    public String showAllItems(Model model){
        List<Item> items = itemRepository.findAll();
        model.addAttribute("items", items);
        return "itemList";
    }
}
