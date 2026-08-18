
  CREATE TABLE "OEHR_JOBS" 
   (	"JOB_ID" VARCHAR2(10), 
	"JOB_TITLE" VARCHAR2(35) CONSTRAINT "OEHR_JOB_TITLE_NN" NOT NULL ENABLE, 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0), 
	 CONSTRAINT "OEHR_JOB_ID_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX  ENABLE
   ) ;

   COMMENT ON COLUMN "OEHR_JOBS"."JOB_ID" IS 'Primary key of jobs oehr_table.';
   COMMENT ON COLUMN "OEHR_JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
   COMMENT ON COLUMN "OEHR_JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
   COMMENT ON COLUMN "OEHR_JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
   COMMENT ON TABLE "OEHR_JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with oehr_employees and oehr_job_history table.';