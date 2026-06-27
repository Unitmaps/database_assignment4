CREATE TABLE "employees" (
  "id" integer PRIMARY KEY,
  "full_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "status" varchar DEFAULT 'active',
  "hired_at" date NOT NULL,
  "fired_at" date
);

CREATE TABLE "departments" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" text,
  "head_id" integer
);

CREATE TABLE "employees_departments" (
  "employee_id" integer,
  "department_id" integer,
  PRIMARY KEY ("employee_id", "department_id")
);

CREATE TABLE "salaries" (
  "id" integer PRIMARY KEY,
  "employee_id" integer NOT NULL,
  "amount" decimal(10,2) CONSTRAINT positive_price CHECK ("amount" > 0),
  "effective_from" date NOT NULL
);

CREATE TABLE "projects" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" text,
  "status" varchar DEFAULT 'planning',
  "budget" decimal(10,2),
  "start_date" date,
  "end_date" date
);

CREATE TABLE "employees_on_projects" (
  "employee_id" integer,
  "project_id" integer,
  "role_on_project" varchar,
  "joined_at" date NOT NULL
);

CREATE TABLE "offices" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "address" varchar UNIQUE NOT NULL,
  "city" varchar NOT NULL
);

CREATE TABLE "employees_to_offices" (
  "employee_id" integer NOT NULL,
  "office_id" integer
);

ALTER TABLE "employees_departments" ADD FOREIGN KEY ("employee_id") REFERENCES "employees" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employees_on_projects" ADD FOREIGN KEY ("employee_id") REFERENCES "employees" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employees_to_offices" ADD FOREIGN KEY ("employee_id") REFERENCES "employees" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "salaries" ADD FOREIGN KEY ("employee_id") REFERENCES "employees" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employees_departments" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employees_on_projects" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employees_to_offices" ADD FOREIGN KEY ("office_id") REFERENCES "offices" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "departments" ADD FOREIGN KEY ("head_id") REFERENCES "employees" ("id") DEFERRABLE INITIALLY IMMEDIATE;
