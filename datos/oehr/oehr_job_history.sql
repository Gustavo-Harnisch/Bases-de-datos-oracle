
  CREATE TABLE "OEHR_JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMBER(6,0) CONSTRAINT "OEHR_JHIST_EMPLOYEE_NN" NOT NULL ENABLE, 
	"START_DATE" DATE CONSTRAINT "OEHR_JHIST_START_DATE_NN" NOT NULL ENABLE, 
	"END_DATE" DATE CONSTRAINT "OEHR_JHIST_END_DATE_NN" NOT NULL ENABLE, 
	"JOB_ID" VARCHAR2(10) CONSTRAINT "OEHR_JHIST_JOB_NN" NOT NULL ENABLE, 
	"DEPARTMENT_ID" NUMBER(4,0), 
	 CONSTRAINT "OEHR_JHIST_DATE_INTERVAL" CHECK (end_date >= start_date) ENABLE
   ) ;

  ALTER TABLE "OEHR_JOB_HISTORY" ADD CONSTRAINT "OEHR_JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "OEHR_DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "OEHR_JOB_HISTORY" ADD CONSTRAINT "OEHR_JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "OEHR_EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  ALTER TABLE "OEHR_JOB_HISTORY" ADD CONSTRAINT "OEHR_JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "OEHR_JOBS" ("JOB_ID") ENABLE;

  CREATE INDEX "OEHR_JHIST_DEPARTMENT_IX" ON "OEHR_JOB_HISTORY" ("DEPARTMENT_ID") 
  ;

  CREATE INDEX "OEHR_JHIST_EMPLOYEE_IX" ON "OEHR_JOB_HISTORY" ("EMPLOYEE_ID") 
  ;

  CREATE INDEX "OEHR_JHIST_JOB_IX" ON "OEHR_JOB_HISTORY" ("JOB_ID") 
  ;

   COMMENT ON COLUMN "OEHR_JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the oehr_employee table';
   COMMENT ON COLUMN "OEHR_JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date. 
Must be less than the end_date of the oehr_job_history table. (enforced by 
constraint oehr_jhist_date_interval)';
   COMMENT ON COLUMN "OEHR_JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be 
greater than the start_date of the oehr_job_history table. 
(enforced by constraint oehr_jhist_date_interval)';
   COMMENT ON COLUMN "OEHR_JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past foreign key to 
job_id column in the oehr_jobs table. A not null column.';
   COMMENT ON COLUMN "OEHR_JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past foreign key to deparment_id column in the oehr_departments table';
   COMMENT ON TABLE "OEHR_JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee 
changes departments within the job or changes jobs within the department, 
new rows get inserted into this table with old job information of the 
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with oehr_jobs, oehr_employees, and oehr_departments tables.';