package pl.com.szczeciak.items;


import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Long> {

    List<Item> findAllById(Long id);

    List<Item> findAllByStationId(Long id);

    List<Item> findAllByMnr(String mnr);

    List<Item> findAllBySn(String sn);

    Item findById(long id);

    //Item findTopById();

}
