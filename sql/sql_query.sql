CREATE TABLE "public"."countries" (
  "country_id" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "country_name" varchar(40) COLLATE "pg_catalog"."default",
  "region_id" numeric,
  CONSTRAINT "countries_pkey" PRIMARY KEY ("country_id")
)
;

ALTER TABLE "public"."countries" OWNER TO "postgres";

CREATE TABLE "public"."departments" (
  "department_id" numeric(4,0) NOT NULL,
  "department_name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "manager_id" numeric(6,0),
  "location_id" numeric(4,0),
  CONSTRAINT "departments_pkey" PRIMARY KEY ("department_id")
)
;

ALTER TABLE "public"."departments" OWNER TO "postgres";

CREATE TABLE "public"."employees" (
  "employee_id" numeric(6,0) NOT NULL,
  "first_name" varchar(20) COLLATE "pg_catalog"."default",
  "last_name" varchar(25) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(25) COLLATE "pg_catalog"."default" NOT NULL,
  "phone_numeric" varchar(20) COLLATE "pg_catalog"."default",
  "hire_date" date NOT NULL,
  "job_id" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "salary" numeric(8,2),
  "commission_pct" numeric(2,2),
  "manager_id" numeric(6,0),
  "department_id" numeric(4,0),
  CONSTRAINT "employees_pkey" PRIMARY KEY ("employee_id"),
  CONSTRAINT "emp_email_uk" UNIQUE ("email")
)
;

ALTER TABLE "public"."employees" OWNER TO "postgres";

CREATE TABLE "public"."estado" (
  "id" int8 NOT NULL DEFAULT nextval('estado_id_seq'::regclass),
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "pais_id" int4 NOT NULL,
  CONSTRAINT "estado_pkey" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."estado" OWNER TO "postgres";

COMMENT ON COLUMN "public"."estado"."id" IS 'Identificador de la tabla';

COMMENT ON COLUMN "public"."estado"."nombre" IS 'Nombre del Estado';

COMMENT ON COLUMN "public"."estado"."pais_id" IS 'Identificador del pais al que pertenece el estado.';

COMMENT ON TABLE "public"."estado" IS 'Entidad que contiene los estados. Desarrollado por Jose Rodriguez <josearodrigueze@gmail.com> @josearodrigueze';

CREATE TABLE "public"."job_grades" (
  "grade_level" varchar(3) COLLATE "pg_catalog"."default",
  "lowest_sal" numeric,
  "highest_sal" numeric
)
;

ALTER TABLE "public"."job_grades" OWNER TO "postgres";

CREATE TABLE "public"."job_history" (
  "employee_id" numeric(6,0) NOT NULL,
  "start_date" date NOT NULL,
  "end_date" date NOT NULL,
  "job_id" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "department_id" numeric(4,0),
  CONSTRAINT "job_history_pkey" PRIMARY KEY ("employee_id", "job_id")
)
;

ALTER TABLE "public"."job_history" OWNER TO "postgres";

CREATE TABLE "public"."jobs" (
  "job_id" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "job_title" varchar(35) COLLATE "pg_catalog"."default" NOT NULL,
  "min_salary" numeric(6,0),
  "max_salary" numeric(6,0),
  CONSTRAINT "jobs_pkey" PRIMARY KEY ("job_id")
)
;

ALTER TABLE "public"."jobs" OWNER TO "postgres";

CREATE TABLE "public"."localidad" (
  "id" int8 NOT NULL DEFAULT nextval('localidad_id_seq'::regclass),
  "tabla" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "localidad_id" int8,
  CONSTRAINT "localidad_pkey" PRIMARY KEY ("id"),
  CONSTRAINT "chk_localidad" CHECK (tabla::text = ANY (ARRAY['pais'::text, 'estado'::text, 'municipio'::text, 'parroquia'::text]))
)
;

ALTER TABLE "public"."localidad" OWNER TO "postgres";

COMMENT ON COLUMN "public"."localidad"."id" IS 'Identificador de la localidad.';

COMMENT ON COLUMN "public"."localidad"."tabla" IS 'Indica el suborden al que pertenece registro almacenado. Ej. pais, estado, municipio, parroquia.';

COMMENT ON COLUMN "public"."localidad"."nombre" IS 'Nombre de la localidad almacenada.';

COMMENT ON COLUMN "public"."localidad"."localidad_id" IS 'Identificador del padre de la localidad.';

COMMENT ON TABLE "public"."localidad" IS 'Entidad que contiene la informacion de localidades (Pais, Estado, Municipio, Parroquia).';

CREATE TABLE "public"."locations" (
  "location_id" numeric(4,0) NOT NULL,
  "street_address" varchar(40) COLLATE "pg_catalog"."default",
  "postal_code" varchar(12) COLLATE "pg_catalog"."default",
  "city" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "state_province" varchar(25) COLLATE "pg_catalog"."default",
  "country_id" char(2) COLLATE "pg_catalog"."default",
  CONSTRAINT "locations_pkey" PRIMARY KEY ("location_id")
)
;

ALTER TABLE "public"."locations" OWNER TO "postgres";

CREATE TABLE "public"."municipio" (
  "id" int8 NOT NULL DEFAULT nextval('municipio_id_seq'::regclass),
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "estado_id" int8 NOT NULL,
  CONSTRAINT "municipio_pkey" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."municipio" OWNER TO "postgres";

COMMENT ON COLUMN "public"."municipio"."id" IS 'Identificador de la tabla';

COMMENT ON COLUMN "public"."municipio"."nombre" IS 'Nombre del municipio.';

COMMENT ON COLUMN "public"."municipio"."estado_id" IS 'Identificador del estado al que pertenece el municipio.';

COMMENT ON TABLE "public"."municipio" IS 'Entidad qu contendra los municipios. Desarrollado por Jose Rodriguez <josearodrigueze@gmail.com> @josearodrigueze';

CREATE TABLE "public"."organization" (
  "id" int8 NOT NULL,
  "createdBy" int8 NOT NULL,
  "updatedBy" int8 NOT NULL,
  "title" varchar(75) COLLATE "pg_catalog"."default" NOT NULL,
  "metaTitle" varchar(100) COLLATE "pg_catalog"."default",
  "slug" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "summary" text COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "createdAt" timestamp(6) NOT NULL,
  "updatedAt" timestamp(6),
  "profile" text COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default",
  CONSTRAINT "_copy_6" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."organization" OWNER TO "postgres";

CREATE TABLE "public"."organization_meta" (
  "id" int8 NOT NULL,
  "organizationId" int8 NOT NULL,
  "key" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "content" text COLLATE "pg_catalog"."default",
  CONSTRAINT "_copy_5" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."organization_meta" OWNER TO "postgres";

CREATE TABLE "public"."pais" (
  "id" int4 NOT NULL DEFAULT nextval('pais_id_seq'::regclass),
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  CONSTRAINT "pais_pkey" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."pais" OWNER TO "postgres";

COMMENT ON COLUMN "public"."pais"."id" IS 'Identificador de la tabla';

COMMENT ON COLUMN "public"."pais"."nombre" IS 'Nombre del pais';

COMMENT ON TABLE "public"."pais" IS 'Entidad que contiene los paises. Desarrollado por Jose Rodriguez <josearodrigueze@gmail.com> @josearodrigueze';

CREATE TABLE "public"."parroquia" (
  "id" int8 NOT NULL DEFAULT nextval('parroquia_id_seq'::regclass),
  "nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "municipio_id" int8 NOT NULL,
  CONSTRAINT "parroquia_pkey" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."parroquia" OWNER TO "postgres";

COMMENT ON COLUMN "public"."parroquia"."id" IS 'Identificador de la tabla';

COMMENT ON COLUMN "public"."parroquia"."nombre" IS 'Nombre del parroquia.';

COMMENT ON COLUMN "public"."parroquia"."municipio_id" IS 'Identificador del municipio al que pertenece la parroquia.';

COMMENT ON TABLE "public"."parroquia" IS 'Entidad qu contendra los parroquias. Desarrollado por Jose Rodriguez <josearodrigueze@gmail.com> @josearodrigueze';

CREATE TABLE "public"."permission" (
  "id" int8 NOT NULL,
  "title" varchar(75) COLLATE "pg_catalog"."default" NOT NULL,
  "slug" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "type" int2 NOT NULL,
  "active" int2 NOT NULL,
  "createdAt" timestamp(6) NOT NULL,
  "updatedAt" timestamp(6),
  "content" text COLLATE "pg_catalog"."default",
  CONSTRAINT "_copy_4" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."permission" OWNER TO "postgres";

CREATE TABLE "public"."regions" (
  "region_id" numeric NOT NULL,
  "region_name" varchar(25) COLLATE "pg_catalog"."default",
  CONSTRAINT "regions_pkey" PRIMARY KEY ("region_id")
)
;

ALTER TABLE "public"."regions" OWNER TO "postgres";

CREATE TABLE "public"."role" (
  "id" int8 NOT NULL,
  "title" varchar(75) COLLATE "pg_catalog"."default" NOT NULL,
  "slug" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "type" int2 NOT NULL,
  "active" int2 NOT NULL,
  "createdAt" timestamp(6) NOT NULL,
  "updatedAt" timestamp(6),
  "content" text COLLATE "pg_catalog"."default",
  CONSTRAINT "_copy_3" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."role" OWNER TO "postgres";

CREATE TABLE "public"."role_permission" (
  "roleId" int8 NOT NULL,
  "permissionId" int8 NOT NULL,
  "createdAt" timestamp(6) NOT NULL,
  "updatedAt" timestamp(6),
  CONSTRAINT "_copy_2" PRIMARY KEY ("roleId", "permissionId")
)
;

ALTER TABLE "public"."role_permission" OWNER TO "postgres";

CREATE TABLE "public"."user" (
  "id" int8 NOT NULL,
  "roleId" int8 NOT NULL,
  "firstName" varchar(50) COLLATE "pg_catalog"."default",
  "middleName" varchar(50) COLLATE "pg_catalog"."default",
  "lastName" varchar(50) COLLATE "pg_catalog"."default",
  "username" varchar(50) COLLATE "pg_catalog"."default",
  "mobile" varchar(15) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "passwordHash" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "registeredAt" timestamp(6) NOT NULL,
  "lastLogin" timestamp(6),
  "intro" text COLLATE "pg_catalog"."default",
  "profile" text COLLATE "pg_catalog"."default",
  CONSTRAINT "_copy_1" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."user" OWNER TO "postgres";

CREATE TABLE "public"."employee" (
  "id" int8 NOT NULL,
  "userId" int8 NOT NULL,
  "organizationId" int8 NOT NULL,
  "roleId" int8 NOT NULL,
  "createdBy" int8 NOT NULL,
  "updatedBy" int8 NOT NULL,
  "code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL,
  "createdAt" timestamp(6) NOT NULL,
  "updatedAt" timestamp(6),
  "startsAt" timestamp(6),
  "endsAt" timestamp(6),
  "notes" text COLLATE "pg_catalog"."default",
  "id_nuevatabla" varchar(255),
  CONSTRAINT "employee_pkey" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."employee" OWNER TO "postgres";

ALTER TABLE "public"."countries" ADD CONSTRAINT "countries_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "public"."regions" ("region_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."departments" ADD CONSTRAINT "departments_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "public"."locations" ("location_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."employees" ADD CONSTRAINT "employees_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "public"."departments" ("department_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."employees" ADD CONSTRAINT "employees_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "public"."jobs" ("job_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."employees" ADD CONSTRAINT "jefe_fk" FOREIGN KEY ("manager_id") REFERENCES "public"."employees" ("employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."estado" ADD CONSTRAINT "estado_pais__id_fkey" FOREIGN KEY ("pais_id") REFERENCES "public"."pais" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public"."job_history" ADD CONSTRAINT "job_history_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "public"."departments" ("department_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."job_history" ADD CONSTRAINT "job_history_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees" ("employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."job_history" ADD CONSTRAINT "job_history_job_id_fkey" FOREIGN KEY ("job_id") REFERENCES "public"."jobs" ("job_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."localidad" ADD CONSTRAINT "localidad_localidad_id_fkey" FOREIGN KEY ("localidad_id") REFERENCES "public"."localidad" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."locations" ADD CONSTRAINT "locations_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "public"."countries" ("country_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."municipio" ADD CONSTRAINT "municipio_estado__id_fkey" FOREIGN KEY ("estado_id") REFERENCES "public"."estado" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public"."organization" ADD CONSTRAINT "fk_organization_creator" FOREIGN KEY ("createdBy") REFERENCES "public"."user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."organization" ADD CONSTRAINT "fk_organization_modifier" FOREIGN KEY ("updatedBy") REFERENCES "public"."user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."organization_meta" ADD CONSTRAINT "fk_meta_organization" FOREIGN KEY ("organizationId") REFERENCES "public"."organization" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."parroquia" ADD CONSTRAINT "parroquia_municipio__id_fkey" FOREIGN KEY ("municipio_id") REFERENCES "public"."municipio" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public"."role_permission" ADD CONSTRAINT "fk_rp_permission" FOREIGN KEY ("permissionId") REFERENCES "public"."permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."role_permission" ADD CONSTRAINT "fk_rp_role" FOREIGN KEY ("roleId") REFERENCES "public"."role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."user" ADD CONSTRAINT "fk_user_role" FOREIGN KEY ("roleId") REFERENCES "public"."role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."employee" ADD CONSTRAINT "fk_employee_creator" FOREIGN KEY ("createdBy") REFERENCES "public"."user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."employee" ADD CONSTRAINT "fk_employee_modifier" FOREIGN KEY ("updatedBy") REFERENCES "public"."user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."employee" ADD CONSTRAINT "fk_employee_organization" FOREIGN KEY ("organizationId") REFERENCES "public"."organization" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."employee" ADD CONSTRAINT "fk_employee_role" FOREIGN KEY ("roleId") REFERENCES "public"."role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "public"."employee" ADD CONSTRAINT "fk_employee_user" FOREIGN KEY ("userId") REFERENCES "public"."user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX "idx_organization_creator" ON "public"."organization" USING btree (
  "createdBy" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "idx_organization_modifier" ON "public"."organization" USING btree (
  "updatedBy" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "uq_slug" ON "public"."organization" USING btree (
  "slug" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

CREATE INDEX "idx_meta_organization" ON "public"."organization_meta" USING btree (
  "organizationId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "uq_meta_organization" ON "public"."organization_meta" USING btree (
  "organizationId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

CREATE INDEX "uq_slug_copy_2" ON "public"."permission" USING btree (
  "slug" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

CREATE INDEX "uq_slug_copy_1" ON "public"."role" USING btree (
  "slug" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

CREATE INDEX "idx_rp_permission" ON "public"."role_permission" USING btree (
  "permissionId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "idx_rp_role" ON "public"."role_permission" USING btree (
  "roleId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "idx_user_role" ON "public"."user" USING btree (
  "roleId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "uq_email" ON "public"."user" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

CREATE INDEX "uq_mobile" ON "public"."user" USING btree (
  "mobile" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

CREATE INDEX "uq_username" ON "public"."user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

CREATE INDEX "idx_employee_creator" ON "public"."employee" USING btree (
  "createdBy" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "idx_employee_modifier" ON "public"."employee" USING btree (
  "updatedBy" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "idx_employee_organization" ON "public"."employee" USING btree (
  "organizationId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "idx_employee_role" ON "public"."employee" USING btree (
  "roleId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "idx_employee_user" ON "public"."employee" USING btree (
  "userId" "pg_catalog"."int8_ops" ASC NULLS LAST
);