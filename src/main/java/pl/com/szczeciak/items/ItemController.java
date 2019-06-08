package pl.com.szczeciak.items;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.szczeciak.comment.Comment;
import pl.com.szczeciak.comment.CommentRepository;
import pl.com.szczeciak.doc.DocRepository;
import pl.com.szczeciak.operation.Operation;
import pl.com.szczeciak.operation.OperationRepository;
import pl.com.szczeciak.station.Station;
import pl.com.szczeciak.station.StationRepository;
import pl.com.szczeciak.user.UserRepository;

import java.util.List;

import static java.time.LocalDateTime.now;

@Controller
@RequestMapping("/items")
public class ItemController {

    @Autowired
    ItemRepository itemRepository;

    @Autowired
    OperationRepository operationRepository;

    @Autowired
    StationRepository stationRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    DocRepository docRepository;

    @GetMapping("/all")
    public String showAllItems(Model model){
        List<Item> items = itemRepository.findAll();
        model.addAttribute("items", items);
        return "itemList";
    }

    @GetMapping("/show/{id}")
    public String showItemById(Model model, @PathVariable Long id){
         List<Item> items= itemRepository.findAllById(id);
        model.addAttribute("items", items);
        List<Operation> operations = operationRepository.findAllByItem_Id(id);
        model.addAttribute("operations", operations);
        List<Station>stations = stationRepository.findAll();
        model.addAttribute("stations", stations);

        Item item = new Item();
        model.addAttribute("item", item);

        List<Comment> comments = commentRepository.findAllByItemId(id);
        model.addAttribute("comments", comments);


        return "item";
    }

    @PostMapping("/show/{id}")
    public String updateItem(@ModelAttribute Item item){
        item.setFd(now());
        itemRepository.save(item);

        Operation operation = new Operation();
        operation.setCreated(now());
        operation.setItem(item);
        operation.setStation(item.getStation());
        operation.setUser(userRepository.findById((long) 1));
        operationRepository.save(operation);


        return "redirect: /";
    }

    @GetMapping("/add")
    public String addItem(Model model){
        Item item = new Item();
        model.addAttribute("item", item);

        return "itemAdd";
    }

    @PostMapping("/add")
    public String addItem(@ModelAttribute Item item){
        item.setStation(stationRepository.getOne((long) 1));
        itemRepository.save(item);
        return "redirect: ../";
    }

    /*
    * Todo:
    * - new item
     * - add edit - change station only
     * - add docs
     * - add comments
     * - add photo
     * - add form validator
    * - add status change
    * */
}
