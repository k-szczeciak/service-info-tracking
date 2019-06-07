package pl.com.szczeciak.station;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.com.szczeciak.items.Item;

import java.util.List;

public interface StationRepository extends JpaRepository<Station, Long> {



}
