package pl.com.szczeciak.doc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.com.szczeciak.items.Item;
import pl.com.szczeciak.items.ItemRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import static java.time.LocalDate.now;

@Controller
@RequestMapping("/docs")
public class DocController {

    //Save the uploaded file to this folder
    private static String UPLOADED_FOLDER = "/Users/krzysztofszczeciak/workspace/_Project/src/main/docFiles/";

    @Autowired
    DocRepository docRepository;

    @Autowired
    ItemRepository itemRepository;

    @GetMapping("/all")
    public String showAllDocs(Model model){
        List<Doc> docs = docRepository.findAll();
        model.addAttribute("docs", docs);
        return "docList";
    }

    @GetMapping("/add/{item_id}")
    public String addNewDoc(Model model, @PathVariable long item_id){
        Doc doc = new Doc();
        model.addAttribute("doc", doc);
        model.addAttribute("item_id", item_id);
        return "docAdd";
    }

    @PostMapping("/add/{item_id}")
    public String addNewDoc(@RequestParam("file") MultipartFile file,
                            RedirectAttributes redirectAttributes,
                            @ModelAttribute Doc doc,
                            @PathVariable long item_id){

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

            Item item = itemRepository.findById(item_id);
            doc.setPath(path.getFileName().toString());
            doc.setDocType(file.getContentType());
            doc.setItem(item);
            docRepository.save(doc);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect: /";

    }

}
