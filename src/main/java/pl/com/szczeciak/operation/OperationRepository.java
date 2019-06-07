package pl.com.szczeciak.operation;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OperationRepository extends JpaRepository<Operation, Long> {

    List<Operation> findAllByItem_Id(Long id);

}
