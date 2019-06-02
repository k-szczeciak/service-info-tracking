package pl.com.szczeciak.operation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class OperationController {

    @Autowired
    OperationRepository operationRepository;

    @GetMapping("/allOperations")
    public String showlAllOperations(Model model){
        List<Operation> operations = operationRepository.findAll();
        model.addAttribute("operations", operations);
        return "operationList";
    }
}
