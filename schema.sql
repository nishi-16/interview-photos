-- This file is a reference for the schema of the database.
-- Only the migration.sql file should be run on the database for setup.

CREATE TABLE "photographer" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(256) NOT NULL,
    "location" VARCHAR(256) DEFAULT NULL,
    "bio" VARCHAR(256) DEFAULT NULL,
    "profile_image_url" VARCHAR(256) DEFAULT NULL,
    "twitter_username" VARCHAR(256) DEFAULT NULL,
    "instagram_username" VARCHAR(256) DEFAULT NULL
);

CREATE TABLE "collection" (
    "id" SERIAL PRIMARY KEY,
    "title" VARCHAR(256) NOT NULL
);

CREATE TABLE "photo" (
    "id" SERIAL PRIMARY KEY,
    "photographer_id" INT NOT NULL,
    "collection_id" INT NOT NULL,
    -- URL to view the photo
    "url" VARCHAR(256) NOT NULL,
    -- Text description of the photo that can be searched for keywords.
    "description" VARCHAR(1024) DEFAULT NULL,
    -- Dimensions of the photo
    "height" INT NOT NULL,
    "width" INT NOT NULL,
    CONSTRAINT "photo_photographer_id_fkey" FOREIGN KEY ("photographer_id") REFERENCES "photographer" ("id"),
    CONSTRAINT "photo_collection_id_fkey" FOREIGN KEY ("collection_id") REFERENCES "collection" ("id")
);

