package controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import models.*;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;
import javax.inject.Inject;
import java.util.List;


public class CategoriesController extends Controller
{

    public Result getMap()
    {

        return ok(views.html.map.render());
    }


    private final JPAApi jpaApi;

    @Inject
    public CategoriesController(JPAApi jpaApi)
    {
        this.jpaApi = jpaApi;

    }

    @Transactional(readOnly = true)
    public Result getLocation()

    {
        List<Place> places = (List<Place>) jpaApi.em().createQuery("select p from Place p").getResultList();

        GeoJSON geoJSON = new GeoJSON();

        for(Place place: places)
        {
            Feature feature = new Feature();
            feature.setId(place.placeId);
            feature.getProperties().setNAME(place.name);
            feature.getProperties().setURL(place.url);
            feature.getGeometry().getCoordinates().add(place.longitude);
            feature.getGeometry().getCoordinates().add(place.latitude);

            geoJSON.getFeatures().add(feature);
        }

        ObjectMapper mapper = new ObjectMapper();

        String jsonString = null;

        try
        {
            jsonString = mapper.writeValueAsString(geoJSON);
        } catch (Exception e)
        {
            System.out.println(e);
        }

        System.out.println(jsonString);

        return ok(jsonString);
    }




/*
    public Result getLocation()
    {
        GeoJSON geoJSON = new GeoJSON();

        Feature feature = new Feature();
        feature.setId(1);
        feature.getProperties().setNAME("Test location");
        feature.getProperties().setURL("www.testing.com");
        feature.getGeometry().getCoordinates().add(-92.44377136230469);
        feature.getGeometry().getCoordinates().add(35.08788871002626);

        geoJSON.getFeatures().add(feature);

        ObjectMapper mapper = new ObjectMapper();

        String jsonString = null;

        try
        {
            jsonString = mapper.writeValueAsString(geoJSON);
        } catch (Exception e)
        {
            System.out.println(e);
        }

        System.out.println(jsonString);

        return ok(jsonString);
        }
*/


}
