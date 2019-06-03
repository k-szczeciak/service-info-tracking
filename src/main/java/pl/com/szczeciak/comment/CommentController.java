package pl.com.szczeciak.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    CommentRepository commentRepository;


    @GetMapping("/all")
    public String showAllComments(Model model){
        List<Comment> comments = commentRepository.findAll();
        model.addAttribute("comments", comments);
        return "commentList";
    }

}
