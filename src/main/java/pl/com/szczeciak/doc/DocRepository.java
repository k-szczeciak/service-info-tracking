package pl.com.szczeciak.doc;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DocRepository extends JpaRepository<Doc, Long> {

    List<Doc> findAllById(Long id);

    Doc findByItemId(long id);

    List<Doc> findAllByItemId(long id);


}
