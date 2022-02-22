import { getPostgresClient } from "./postgres";
import express from "express";
import cors from "cors";
import bodyParser from "body-parser";

/** Connect to the database then start the API server */
getPostgresClient()
  .then((pgClient) => {
    const app = express();
      app.use(express.json());
      app.use(bodyParser.urlencoded({extended: true}));
      app.use(bodyParser.json());
      app.use(cors());

    app.get("/", (req, res) => {
      res.send("Hello world!");
    });

    app.get("/now", async (req, res) => {
      const data = await pgClient.query("SELECT NOW() as now");
      res.send(data.rows[0].now);
    });

      /** Get all collection **/
      app.get("/collections",async (req, res) => {
          try{
              const allCollection = await pgClient.query("SELECT * FROM collection");
              res.json(allCollection.rows);
          }catch(err){
              console.log("/image error: ",err.message)
          }
      })

      /** photo according to filter Criteria **/
      app.post("/filter",async (req, res) => {
          try{
              var filter;
              const result = req.body;
              console.log(result)
              if(result.city == "" && (result.title == "" || result.title == "None")){
                  filter = await pgClient.query("SELECT * FROM photo JOIN collection ON collection.id = photo.collection_id JOIN photographer ON photographer.id = photo.photographer_id");
              }
              else if(result.city == "" && result.title != ""){
                  filter = await pgClient.query("SELECT * FROM photo JOIN collection ON collection.id = photo.collection_id JOIN photographer ON photographer.id = photo.photographer_id where collection.title = $1 ",[result.title]);

              }
              else if(result.city != "" && (result.title == "" || result.title == "None")){
                 filter = await pgClient.query("SELECT * FROM photo JOIN collection ON collection.id = photo.collection_id JOIN photographer ON photographer.id = photo.photographer_id where  photographer.location LIKE $1",[ "%"+result.city+"%"]);
              }
              else{
                  filter = await pgClient.query("SELECT * FROM photo JOIN collection ON collection.id = photo.collection_id JOIN photographer ON photographer.id = photo.photographer_id where collection.title = $1 AND photographer.location LIKE $2",[result.title, "%"+result.city+"%"]);
              }
             res.json(filter.rows)
          }catch(err){
              console.log("error: ",err.message)
          }
      })

    app.listen(8080, () => {
      console.log("API server ready at http://localhost:8080");
    });
  })
  .catch((err) => {
    console.error("Error connecting to postgres: ", err);
  });
