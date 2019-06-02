package pl.com.szczeciak.doc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class DocController {

    @Autowired
    DocRepository docRepository;

    @GetMapping("/allDocs")
    public String showAllDocs(Model model){
        List<Doc> docs = docRepository.findAll();
        model.addAttribute("docs", docs);
        return "docList";
    }

}
