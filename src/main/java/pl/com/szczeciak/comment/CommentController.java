package pl.com.szczeciak.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.com.szczeciak.items.Item;
import pl.com.szczeciak.items.ItemRepository;

import java.util.List;

import static java.time.LocalDateTime.now;

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

        String result = comment.getDescription().replaceAll("\n", "<br>");
        comment.setDescription(result);
        commentRepository.save(comment);
        return "redirect: /";
    }

    @GetMapping("/edit/{id}")
    public String editComment(Model model, @PathVariable long id){
        Comment comment = commentRepository.findCommentById(id);
        model.addAttribute("comment", comment);

        Item item = itemRepository.findById(id);
        model.addAttribute("item", item);

        return "comment";
    }

    @PostMapping("/edit/{id}")
    public String editComment(Model model, @ModelAttribute Comment comment){
        String result = comment.getDescription().replace("\n", "<br>");
        comment.setDescription(result);
        comment.setCreated(now());
        commentRepository.save(comment);
        return "redirect: /";
    }





}
