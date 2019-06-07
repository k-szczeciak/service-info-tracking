package pl.com.szczeciak.user;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import pl.com.szczeciak.operation.Operation;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Table(name = "user")
public class User {
//    public enum permitions { DEVELOPER, MANAGER, MASTER_USER, OFFICE, WORKSHOP_MANAGER, }
//    public enum Permition { CREATE, EDIT, VIEW, DELETE};

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;

    @NotNull
    private String firstName;

    @NotNull
    private String lastName;

    @NotBlank
    @Email
    private String email;

    @OneToMany(mappedBy = "user")
    private List<Operation> operations;

    @NotNull
    private Long station_id; //OneToMany relation  -assignment of one person to station - at the beginning one2one







    /*
        - one user to several stations
        - permition is only assignet to the corresponding station/s
        - todo entity for permitions
        - at the beginning one person is dedicated for one station and only for this one will have permition to edit
         for other only view and leave a comments
     */




/* this is saved for future permition entity*/
//    @NotNull
//    private Permition permition;

    public User() {
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
