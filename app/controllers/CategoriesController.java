package controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import models.*;
import play.data.DynamicForm;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;

import javax.inject.Inject;
import java.io.IOException;
import java.util.List;

import static play.data.Form.form;
import static play.libs.Json.toJson;

public class CategoriesController extends Controller
{
/*
    private final JPAApi jpaApi;

    @Inject
    public CategoriesController(JPAApi jpaApi)
    {
        this.jpaApi = jpaApi;

    }

    @Transactional(readOnly = true)
    public Result index()
    {
        List<Place> places = (List<Place>) jpaApi.em().
                createQuery("select p from Places p").getResultList();

        GeoJSON geoJSON = new GeoJSON();

        for(Place place: places)
        {
        places.add();
        places.add();



        }
        return ok("TODO");
    }

*/

    public Result getMap()
    {
        Place place = new Place();

        return ok(views.html.map.render(place));
    }

    public Result getLocation()
    {
        GeoJSON geoJSON = new GeoJSON();

        Feature feature = new Feature();
        feature.setId(1);
        feature.getProperties().setNAME("Test location");
        feature.getProperties().setURL("www.Google.com");
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

}
