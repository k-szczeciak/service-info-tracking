package pl.com.szczeciak.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.szczeciak.items.Item;
import pl.com.szczeciak.items.ItemRepository;

import java.util.List;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    ItemRepository itemRepository;


    @GetMapping("/all")
    public String showAllComments(Model model){
        List<Comment> comments = commentRepository.findAll();
        model.addAttribute("comments", comments);
        return "commentList";
    }

    @GetMapping("/add/{id}")
    public String addComment(Model model, @PathVariable long id){
        Comment comment = new Comment();
        model.addAttribute("comment", comment);

        Item item = itemRepository.findById(id);

        model.addAttribute("item", item);

        model.addAttribute("id", id);
        return "commentAdd";
    }

    @PostMapping("/add/{id}")
    public String addComment(Model model, @ModelAttribute Comment comment){
        commentRepository.save(comment);
        return "redirect: /";
    }





}
