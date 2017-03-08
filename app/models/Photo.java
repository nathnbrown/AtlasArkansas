package models;


import javax.persistence.*;

@Entity
public class Photo
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PHOTO_ID")
    public Long photoId;

    @Column(name = "PHOTO_DATA")
    public byte[] photoData;

}
