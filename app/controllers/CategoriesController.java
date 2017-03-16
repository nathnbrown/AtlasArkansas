package controllers;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import models.*;
import play.Logger;
import play.db.jpa.JPAApi;
import play.db.jpa.Transactional;
import play.mvc.Controller;
import play.mvc.Result;
import javax.inject.Inject;
import java.net.HttpURLConnection;
import java.net.URL;
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
        //get cat id for request
        String id = request().getQueryString("categoryId");
        List<Place> places = (List<Place>) jpaApi.em().createQuery("select p from Place p where categoryId = :id").setParameter("id", id).getResultList();

        GeoJSON geoJSON = new GeoJSON();

        for(Place place: places)
        {
            Feature feature = new Feature();
            feature.setId(place.placeId);
            feature.getProperties().setNAME(place.name);
            feature.getProperties().setDESCRIPTION(place.description);
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

    public Result getISSJSON()
    {

        JsonNode jsonNode = null;
        try
        {
            String myURL = "http://api.open-notify.org/iss-now.json";

            URL url = new URL(myURL);

            HttpURLConnection request = (HttpURLConnection) url.openConnection();
            request.connect();

            ObjectMapper objectMapper = new ObjectMapper();
            jsonNode = objectMapper.readValue(url, JsonNode.class);

            System.out.println(jsonNode);
        }
        catch (Exception e)
        {
            Logger.error("oh no! got some exception: " + e.getMessage());
        }

        if (jsonNode == null)
        {
            Logger.warn("oh no! got nothing back from url");
        }

        return ok(jsonNode);
    }

    @Transactional(readOnly = true)
    public Result getISSLocation()
    {

        JsonNode jsonNode = null;
        try
        {
            String myURL = "http://api.open-notify.org/iss-now.json";

            URL url = new URL(myURL);

            HttpURLConnection request = (HttpURLConnection) url.openConnection();
            request.connect();

            ObjectMapper objectMapper = new ObjectMapper();
            jsonNode = objectMapper.readValue(url, JsonNode.class);

            System.out.println(jsonNode);
        }
        catch (Exception e)
        {
            Logger.error("oh no! got some exception: " + e.getMessage());
        }

        if (jsonNode == null)
        {
            Logger.warn("oh no! got nothing back from url");
        }

        //get cat id for request
        double longitude;
        double latitude;
        String iss = "International Space Station";
        String description = "Current location of the ISS";
        String url = "iss.astroviewer.net/";


        latitude = jsonNode.findValue("latitude").asDouble();
        longitude = jsonNode.findValue("longitude").asDouble();

        GeoJSON geoJSON = new GeoJSON();

        Feature feature = new Feature();
        feature.getGeometry().getCoordinates().add(longitude);
        feature.getGeometry().getCoordinates().add(latitude);
        feature.getProperties().setNAME(iss);
        feature.getProperties().setDESCRIPTION(description);
        feature.getProperties().setURL(url);

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
