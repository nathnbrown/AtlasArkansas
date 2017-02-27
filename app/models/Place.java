package models;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Place
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PLACE_ID")
    public Long placeId;

    @Column(name = "NAME")
    public String name;

    @Column(name = "LATITUDE")
    public String latitude;

    @Column(name = "LONGITUDE")
    public String longitude;

    @Column(name = "DESCRIPTION")
    public String description;

    @Column(name = "URL")
    public String url;

    @Column(name = "CATEGORY_ID")
    public String categoryId;

}
