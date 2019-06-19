package pl.com.szczeciak.comment;

import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findAllById(Long id);

    List<Comment> findAllByItemId(Long id);

    Comment findCommentById(Long id);

}
