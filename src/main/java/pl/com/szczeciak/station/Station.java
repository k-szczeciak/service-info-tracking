package pl.com.szczeciak.station;

import pl.com.szczeciak.items.Item;
import pl.com.szczeciak.operation.Operation;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Table(name = "stations")
public class Station {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String name; // station name

    private String localization;

    private int capacity; //capacity in numer of simultanous operations

    private Long user_id; // relation one2one at first approach

    @OneToMany(mappedBy = "station", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Item> items;

    @OneToMany(mappedBy = "station")
    private List<Operation> operations;


    public Station() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocalization() {
        return localization;
    }

    public void setLocalization(String localization) {
        this.localization = localization;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }
}
