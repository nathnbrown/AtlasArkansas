package models;

import javax.persistence.*;

@Entity
public class Category
{
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "CATEGORY_ID")
        public Long categoryId;

        @Column(name = "CATEGORY_NAME")
        public String categoryName;
}
