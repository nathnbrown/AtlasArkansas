package controllers;

import models.Category;
import models.Photo;
import models.Place;
import play.data.DynamicForm;
import play.data.FormFactory;
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
    private final FormFactory formFactory;
    private final JPAApi jpaApi;

    @Inject
    public CategoriesController(FormFactory formFactory, JPAApi jpaApi)
    {
        this.formFactory = formFactory;
        this.jpaApi = jpaApi;
    }

    /*@Transactional(readOnly = true)
    public Result getCategories()
    {
        List<Category> categories = (List<Category>) jpaApi.em().
                createQuery("select categoryId, categoryName from Category").getResultList();

        return ok(views.html.categories.render(categories));
    }*/

    @Transactional(readOnly = true)
    public Result index()
    {
        List<Category> categories = (List<Category>) jpaApi.em().
                createQuery("select c from Category c").getResultList();

        return ok(views.html.categories.render(categories));
    }

    @Transactional(readOnly = true)
    public Result newCategory()
    {
        return ok(views.html.newCategory.render());
    }

    @Transactional
    public Result addCategory()
    {
        //Map the data from the html form into an instance of the Categories model
        //Categories.class lets the form factory create an instance of Categories
        //Values from the form are pushed into the model based on name of form field match name of variable in model

        Category category = formFactory.form(Category.class).bindFromRequest().get();

        //Save the new category to the database
        jpaApi.em().persist(category);

        //Send the browser to the list of categories page
        return redirect(routes.CategoriesController.index());
    }

    @Transactional
    public Result getPicture(Long id)
    {
        Photo photo = (Photo)jpaApi.em().
                createQuery("select p from Photo p where photoId = :id").
                setParameter("id", id).getSingleResult();

        if (photo.photoData == null)
        {
            return null;
        }else{
            return ok(photo.photoData).as("image/bmp");
        }

    }

    @Transactional(readOnly = true)
    public Result editCategory(Long categoryId)
    {
        //Get the model that we need to edit based on the passed in categoryId
        Category category = (Category)jpaApi.em()
                .createQuery("select c from Categories c where categoryId = :id")
                .setParameter("id", categoryId).getSingleResult();

        //Send the model we got to the update view
        return ok(views.html.updateCategory.render(category));
    }

    @Transactional
    public Result updateCategory()
    {
        //Gets the data from the form the user submitted
        DynamicForm postedForm = formFactory.form().bindFromRequest();

        //Copy the form values out into local variables
        Long categoryId = new Long(postedForm.get("categoryId"));
        String categoryName = postedForm.get("categoryName");

        //Get the model of the category we want to update
        Category category = (Category)jpaApi.em()
                .createQuery("select c from Categories c where categoryId = :id")
                .setParameter("id", categoryId).getSingleResult();

        //Copy new values into model
        category.categoryName = categoryName;

        //Save the model to the database
        jpaApi.em().persist(category);

        //Send the user to the list of categories view
        return redirect(routes.CategoriesController.index());
    }


    //@BodyParser.Of(MyMultipartFormDataBodyParser.class)
    public Result upload() throws IOException
    {
        //final Http.MultipartFormData<File> formData = request().body().asMultipartFormData();
        //final Http.MultipartFormData.FilePart<File> filePart = formData.getFile("name");
        //final File file = filePart.getFile();
        //final long data = operateOnTempFile(file);
        //return ok("file size = " + data + "");
        return null;
    }

    public Result getMap()
    {
        Place place = new Place();
        place.name = "Conway";
        place.longitude = -92.441559;
        place.latitude = 35.090328;

        return ok(views.html.map.render(place));
    }

    public Result getLocation()
    {
        return ok("{\n" +
                "\"type\": \"FeatureCollection\",\n" +
                "                                                                                \n" +
                "\"features\": [\n" +
                "\n" +
                "{ \"type\": \"Feature\", \"id\": 0, \"properties\": { \"NAME\": \"45th Street Theater\", \"TEL\": \"(212) 352-3101\", \"URL\": \"http:\\/\\/www.theatermania.com\\/new-york\\/theaters\\/45th-street-theatre_2278\\/\", \"ADDRESS1\": \"354 West 45th Street\", \"ADDRES2\": null, \"CITY\": \"New York\", \"ZIP\": 10036.0 }, \"geometry\": { \"type\": \"Point\", \"coordinates\": [ -92.44377136230469,35.08788871002626 ] } }\n" +
                ",\n" +
                "{ \"type\": \"Feature\", \"id\": 116, \"properties\": { \"NAME\": \"Delacorte Theater\", \"TEL\": \"(212) 861-7277\", \"URL\": \"http:\\/\\/www.centralpark.com\\/pages\\/attractions\\/delacorte-theatre.html\", \"ADDRESS1\": \"Central Park - Mid-Park at 80th Street\", \"ADDRES2\": \"SW corner of the Great Lawn\", \"CITY\": \"New York\", \"ZIP\": 0.0 }, \"geometry\": { \"type\": \"Point\", \"coordinates\": [ -92.54377136230469,35.08788871002626 ] } }\n" +
                ",\n" +
                "{ \"type\": \"Feature\", \"id\": 116, \"properties\": { \"NAME\": \"Delacorte Theater\", \"TEL\": \"(212) 861-7277\", \"URL\": \"http:\\/\\/www.centralpark.com\\/pages\\/attractions\\/delacorte-theatre.html\", \"ADDRESS1\": \"Central Park - Mid-Park at 80th Street\", \"ADDRES2\": \"SW corner of the Great Lawn\", \"CITY\": \"New York\", \"ZIP\": 0.0 }, \"geometry\": { \"type\": \"Point\", \"coordinates\": [ -92.64377136230469,35.08788871002626 ] } }\n" +
                ",\n" +
                "{ \"type\": \"Feature\", \"id\": 116, \"properties\": { \"NAME\": \"Delacorte Theater\", \"TEL\": \"(212) 861-7277\", \"URL\": \"http:\\/\\/www.centralpark.com\\/pages\\/attractions\\/delacorte-theatre.html\", \"ADDRESS1\": \"Central Park - Mid-Park at 80th Street\", \"ADDRES2\": \"SW corner of the Great Lawn\", \"CITY\": \"New York\", \"ZIP\": 0.0 }, \"geometry\": { \"type\": \"Point\", \"coordinates\": [ -92.74377136230469,35.08788871002626 ] } }\n" +
                "]\n" +
                "}\n");
    }





}
