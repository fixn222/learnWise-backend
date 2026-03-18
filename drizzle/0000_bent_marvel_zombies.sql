CREATE TABLE "departments" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "departments_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"cod" varchar(50) NOT NULL,
	"name" varchar(50) NOT NULL,
	"description" varchar(225) NOT NULL,
	"created-at" timestamp DEFAULT now() NOT NULL,
	"updated-at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "departments_cod_unique" UNIQUE("cod")
);
--> statement-breakpoint
CREATE TABLE "subjects" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "subjects_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"department_Id" integer NOT NULL,
	"name" varchar(50) NOT NULL,
	"cod" varchar(50) NOT NULL,
	"description" varchar(225) NOT NULL,
	"created-at" timestamp DEFAULT now() NOT NULL,
	"updated-at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "subjects_cod_unique" UNIQUE("cod")
);
--> statement-breakpoint
ALTER TABLE "subjects" ADD CONSTRAINT "subjects_department_Id_departments_id_fk" FOREIGN KEY ("department_Id") REFERENCES "public"."departments"("id") ON DELETE restrict ON UPDATE no action;