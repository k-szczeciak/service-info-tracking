package pl.com.szczeciak.items;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.com.szczeciak.comment.Comment;
import pl.com.szczeciak.comment.CommentRepository;
import pl.com.szczeciak.doc.Doc;
import pl.com.szczeciak.doc.DocRepository;
import pl.com.szczeciak.operation.Operation;
import pl.com.szczeciak.operation.OperationRepository;
import pl.com.szczeciak.station.Station;
import pl.com.szczeciak.station.StationRepository;
import pl.com.szczeciak.user.User;
import pl.com.szczeciak.user.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import static java.time.LocalDateTime.now;

@Controller
@RequestMapping("/items")
public class ItemController {

    //Save the uploaded file to this folder
    private static String UPLOADED_FOLDER = "/Users/krzysztofszczeciak/workspace/_Project/src/main/docFiles/";
//    private static String UPLOADED_FOLDER = "/tmp/docFiles/";

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

        //items
        List<Item> items= itemRepository.findAllById(id);
        model.addAttribute("items", items);

        //operations
        List<Operation> operations = operationRepository.findAllByItem_Id(id);
        model.addAttribute("operations", operations);

        //comments
        List<Comment> comments = commentRepository.findAllByItemId(id);
        model.addAttribute("comments", comments);

        //stations for list
        List<Station>stations = stationRepository.findAll();
        model.addAttribute("stations", stations);

        List<Doc> docs = docRepository.findAllByItemId(id);
        model.addAttribute("docs", docs);

        Item item = itemRepository.findById((long) id);
        model.addAttribute("item", item);

        return "item";
    }

    @PostMapping("/show/{id}")
    public String updateItem(@ModelAttribute Item item, HttpSession session, HttpServletRequest request){
        String refer = request.getHeader("Referer");
        item.setFd(now());
        itemRepository.save(item);
        User user = (User) session.getAttribute("userSession");

        Operation operation = new Operation();
        operation.setCreated(now());
        operation.setItem(item);
        operation.setStation(item.getStation());
//        operation.setUser(userRepository.findById((long) 1));
        operation.setUser(user);
        operationRepository.save(operation);

        return "redirect:" + refer;
    }

    @GetMapping("/add")
    public String addItem(Model model){
        Item item = new Item();
        model.addAttribute("item", item);

        return "itemAdd";
    }

    @PostMapping("/add")
    public String addItem(@RequestParam("file") MultipartFile file,
                          RedirectAttributes redirectAttributes,
                          @ModelAttribute Item item){
        item.setStation(stationRepository.getOne((long) 1));
        item.setActive(false);

//        String result = System.getProperty("user.dir");

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        try {

            //todo - walidacja typu pliku
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            //Path pathDir = Paths.get(UPLOADED_FOLDER + "/" + Long.toString(item.getId()) + "/");
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            /*if (!Files.exists(pathDir)){
                Files.createDirectory(pathDir);
            }*/
            Files.write(path, bytes);
            item.setItemImage(path.getFileName().toString());

            redirectAttributes.addFlashAttribute("message",
                    "You successfully uploaded '" + file.getOriginalFilename() + "'");
//            result = "w kwadracie";

        } catch (IOException e) {
            e.printStackTrace();
        }

        itemRepository.save(item);
        return "redirect: ../";
//        return "dupa + ..." + result;
    }

    @GetMapping("/uploadFiles/{id}")
    public String uplaodFiles(@PathVariable Long id, Model model){

        model.addAttribute("id", id);
        return "uploadFiles";
    }

    @PostMapping("/uploadFiles/{id}")
    public String uploadFiles(@RequestParam("file") MultipartFile file,
                              RedirectAttributes redirectAttributes,
                              @PathVariable Long id){

        //todo jak zamienic @PathVariable na Post-a
        //todo validator do plikow: wielkosc, typ i czy jest
        //todo to wrzuci do serwisu
        //todo przekierowanie zalezne od pubktu startu

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        try {

            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);

            redirectAttributes.addFlashAttribute("message",
                    "You successfully uploaded '" + file.getOriginalFilename() + "'");

            Item item = itemRepository.findById((long)id);
            item.setItemImage(path.getFileName().toString());
            itemRepository.save(item);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect: /items/all";
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
