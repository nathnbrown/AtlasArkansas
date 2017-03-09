package models;

import javax.persistence.*;


@Entity
public class Place
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PLACE_ID")
    public Long placeId;

    @Column(name = "NAME")
    public String name;

    @Column(name = "LATITUDE")
    public double latitude;

    @Column(name = "LONGITUDE")
    public double longitude;

    @Column(name = "DESCRIPTION")
    public String description;

    @Column(name = "URL")
    public String url;

    @Column(name = "CATEGORY_ID")
    public String categoryId;

}
