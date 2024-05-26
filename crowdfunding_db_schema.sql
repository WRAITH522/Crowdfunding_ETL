-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "ContactsT" (
    "contact_id" INTEGER   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "email" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_ContactsT" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "CategoryT" (
    "category_id" VARCHAR(20)   NOT NULL,
    "category" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_CategoryT" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "SubcategoryT" (
    "subcategory_id" VARCHAR(20)   NOT NULL,
    "subcategory" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_SubcategoryT" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "CampaignT" (
    "cf_id" INTEGER   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(255)   NOT NULL,
    "description" VARCHAR(255)   NOT NULL,
    "goal" DECIMAL   NOT NULL,
    "pledged" DECIMAL   NOT NULL,
    "outcome" VARCHAR(30)   NOT NULL,
    "backers_count" INTEGER   NOT NULL,
    "country" VARCHAR(10)   NOT NULL,
    "currency" VARCHAR(10)   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(20)   NOT NULL,
    "subcategory_id" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_CampaignT" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "CampaignT" ADD CONSTRAINT "fk_CampaignT_contact_id" FOREIGN KEY("contact_id")
REFERENCES "ContactsT" ("contact_id");

ALTER TABLE "CampaignT" ADD CONSTRAINT "fk_CampaignT_category_id" FOREIGN KEY("category_id")
REFERENCES "CategoryT" ("category_id");

ALTER TABLE "CampaignT" ADD CONSTRAINT "fk_CampaignT_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "SubcategoryT" ("subcategory_id");

-- check here for sucessful creation and import from csv files --
-- START RUN HERE:

select * from "CampaignT"
limit 5;

SELECT *
FROM "ContactsT"
limit 5;

select * from "CategoryT"
limit 5;

select * from "SubcategoryT"
limit 5;

-- run query to ensure joins work -- 
SELECT  c.first_name, c.last_name, m.company_name, m.pledged, x.category, y.subcategory
FROM "CampaignT" m
JOIN "ContactsT" c
ON (m.contact_id = c.contact_id)
JOIN "CategoryT" x
ON (m.category_id = x.category_id)
JOIN "SubcategoryT" y
ON (m.subcategory_id = y.subcategory_id)
LIMIT 10