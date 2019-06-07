package pl.com.szczeciak.items;

import pl.com.szczeciak.operation.Operation;
import pl.com.szczeciak.station.Station;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "items")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String name;

    @NotNull
    private String mnr;

    @NotNull
    private String sn;

//    @NotNull
    private LocalDateTime fd;

    private String customer; // todo: implement customer table hence here should be customer_id instead;

    @ManyToOne
    @JoinColumn(name = "station_id")
    private Station station;

    @OneToMany(mappedBy = "item")
    private List<Operation> operations;

    @PrePersist
    public void prePersist() {
        fd = LocalDateTime.now();
    }










    public Station getStation() {
        return station;
    }

    public void setStation(Station station) {
        this.station = station;
    }

    public Item() {
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

    public String getMnr() {
        return mnr;
    }

    public void setMnr(String mnr) {
        this.mnr = mnr;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public LocalDateTime getFd() {
        return fd;
    }

    public void setFd(LocalDateTime fd) {
        this.fd = fd;
    }
}
