/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     28/6/2021 13:19:20                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ASISTENC_CL_VISITA_CLIENTE') then
    alter table ASISTENCIA
       delete foreign key FK_ASISTENC_CL_VISITA_CLIENTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EMPLEADO_ESPEC_EMP_ESPECIAL') then
    alter table EMPLEADO
       delete foreign key FK_EMPLEADO_ESPEC_EMP_ESPECIAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RUTINA_DA_EMPLEADO') then
    alter table RUTINA
       delete foreign key FK_RUTINA_DA_EMPLEADO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RUTINA_RUTINA_CL_CLIENTE') then
    alter table RUTINA
       delete foreign key FK_RUTINA_RUTINA_CL_CLIENTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RUTINA_TIENE_PLAN_ALI') then
    alter table RUTINA
       delete foreign key FK_RUTINA_TIENE_PLAN_ALI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VENTA_CLIENTE_V_CLIENTE') then
    alter table VENTA
       delete foreign key FK_VENTA_CLIENTE_V_CLIENTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VENTA_EMPLEADO__EMPLEADO') then
    alter table VENTA
       delete foreign key FK_VENTA_EMPLEADO__EMPLEADO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VENTA_PRODUCTO__PRODUCTO') then
    alter table VENTA
       delete foreign key FK_VENTA_PRODUCTO__PRODUCTO
end if;

drop index if exists ASISTENCIA.CL_VISITA_FK;

drop index if exists ASISTENCIA.ASISTENCIA_PK;

drop table if exists ASISTENCIA;

drop index if exists CLIENTE.CLIENTE_PK;

drop table if exists CLIENTE;

drop index if exists EMPLEADO.ESPEC_EMPLE_FK;

drop index if exists EMPLEADO.EMPLEADO_PK;

drop table if exists EMPLEADO;

drop index if exists ESPECIALIDAD.ESPECIALIDAD_PK;

drop table if exists ESPECIALIDAD;

drop index if exists PLAN_ALIMENTICIO.PLAN_ALIMENTICIO_PK;

drop table if exists PLAN_ALIMENTICIO;

drop index if exists PRODUCTO.PRODUCTO_PK;

drop table if exists PRODUCTO;

drop index if exists RUTINA.TIENE_FK;

drop index if exists RUTINA.RUTINA_CLIENTE_FK;

drop index if exists RUTINA.DA_FK;

drop index if exists RUTINA.RUTINA_PK;

drop table if exists RUTINA;

drop index if exists VENTA.PRODUCTO_VENTA_FK;

drop index if exists VENTA.CLIENTE_VENTA_FK;

drop index if exists VENTA.EMPLEADO_VENTA_FK;

drop index if exists VENTA.VENTA_PK;

drop table if exists VENTA;

/*==============================================================*/
/* Table: ASISTENCIA                                            */
/*==============================================================*/
create table ASISTENCIA 
(
   ID_ASISTENCIA        integer                        not null,
   ID_CLIENTE           integer                        null,
   FECHA_VISITA         date                           null,
   constraint PK_ASISTENCIA primary key (ID_ASISTENCIA)
);

/*==============================================================*/
/* Index: ASISTENCIA_PK                                         */
/*==============================================================*/
create unique index ASISTENCIA_PK on ASISTENCIA (
ID_ASISTENCIA ASC
);

/*==============================================================*/
/* Index: CL_VISITA_FK                                          */
/*==============================================================*/
create index CL_VISITA_FK on ASISTENCIA (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   ID_CLIENTE           integer                        not null,
   CEDULA_CLIENTE       numeric(10)                    not null,
   NOMBRES_CLIENTE      char(256)                      not null,
   APELLIDOS_CLIENTE    char(256)                      not null,
   DIRECCION_CLIENTE    char(256)                      not null,
   FECHANACIMIENTO_CLIENTE date                           not null,
   CORREO_CLIENTE       char(256)                      not null,
   PESODEINGRESO_CLIENTE char(256)                      not null,
   TELEFONO_CLIENTE     numeric(10)                    not null,
   ALTURA_CLIENTE       char(256)                      not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   ID_EMPLEADO          integer                        not null,
   ID_ESPECIALIDAD      integer                        null,
   CEDULA_EMPLEADO      numeric(10)                    not null,
   NOMBRES_EMPLEADO     char(256)                      not null,
   APELLIDOS_EMPLEADO   char(256)                      not null,
   DIRECION_EMPLEADO    char(256)                      not null,
   TELEFONO_EMPLEADO    numeric(10)                    not null,
   CORREO_EMPLEADO      char(256)                      not null,
   TIPO_EMPLEADO        char(256)                      not null,
   FECHANACIEMIENTO_EMPLEADO date                           not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO ASC
);

/*==============================================================*/
/* Index: ESPEC_EMPLE_FK                                        */
/*==============================================================*/
create index ESPEC_EMPLE_FK on EMPLEADO (
ID_ESPECIALIDAD ASC
);

/*==============================================================*/
/* Table: ESPECIALIDAD                                          */
/*==============================================================*/
create table ESPECIALIDAD 
(
   ID_ESPECIALIDAD      integer                        not null,
   DESCRIPCION          char(256)                      not null,
   constraint PK_ESPECIALIDAD primary key (ID_ESPECIALIDAD)
);

/*==============================================================*/
/* Index: ESPECIALIDAD_PK                                       */
/*==============================================================*/
create unique index ESPECIALIDAD_PK on ESPECIALIDAD (
ID_ESPECIALIDAD ASC
);

/*==============================================================*/
/* Table: PLAN_ALIMENTICIO                                      */
/*==============================================================*/
create table PLAN_ALIMENTICIO 
(
   ID_PLAN              integer                        not null,
   DESCRIPCION_PLAN     char(256)                      not null,
   constraint PK_PLAN_ALIMENTICIO primary key (ID_PLAN)
);

/*==============================================================*/
/* Index: PLAN_ALIMENTICIO_PK                                   */
/*==============================================================*/
create unique index PLAN_ALIMENTICIO_PK on PLAN_ALIMENTICIO (
ID_PLAN ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   CODIGO_PRODUCTO      integer                        not null,
   TIPO_PRODUCTO        char(256)                      not null,
   NOMBRE_PRODUCTO      char(256)                      not null,
   DESCRIPCION_PRODUCTO char(256)                      not null,
   FECHACADUCIDAD_PRODUCTO date                           not null,
   PRECIO_PRODUCTO      decimal                        not null,
   constraint PK_PRODUCTO primary key (CODIGO_PRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
CODIGO_PRODUCTO ASC
);

/*==============================================================*/
/* Table: RUTINA                                                */
/*==============================================================*/
create table RUTINA 
(
   ID_RUTINA            integer                        not null,
   ID_CLIENTE           integer                        null,
   ID_EMPLEADO          integer                        null,
   ID_PLAN              integer                        not null,
   NUMERO_RUTINA        integer                        null,
   NOMBRE_EJERCICIOS    char(256)                      null,
   TIEMPO_RUTINA        char(256)                      null,
   FECHAINICIO_RUTINA   date                           null,
   FECHAFIN_RUTINA      date                           null,
   constraint PK_RUTINA primary key (ID_RUTINA)
);

/*==============================================================*/
/* Index: RUTINA_PK                                             */
/*==============================================================*/
create unique index RUTINA_PK on RUTINA (
ID_RUTINA ASC
);

/*==============================================================*/
/* Index: DA_FK                                                 */
/*==============================================================*/
create index DA_FK on RUTINA (
ID_EMPLEADO ASC
);

/*==============================================================*/
/* Index: RUTINA_CLIENTE_FK                                     */
/*==============================================================*/
create index RUTINA_CLIENTE_FK on RUTINA (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on RUTINA (
ID_PLAN ASC
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA 
(
   ID_VENTA             integer                        not null,
   CODIGO_PRODUCTO      integer                        null,
   ID_CLIENTE           integer                        null,
   ID_EMPLEADO          integer                        null,
   FECHA_VENTA          date                           not null,
   DESCRIPCION_VENTA    char(256)                      not null,
   PRECIOFINAL_VENTA    decimal                        not null,
   constraint PK_VENTA primary key (ID_VENTA)
);

/*==============================================================*/
/* Index: VENTA_PK                                              */
/*==============================================================*/
create unique index VENTA_PK on VENTA (
ID_VENTA ASC
);

/*==============================================================*/
/* Index: EMPLEADO_VENTA_FK                                     */
/*==============================================================*/
create index EMPLEADO_VENTA_FK on VENTA (
ID_EMPLEADO ASC
);

/*==============================================================*/
/* Index: CLIENTE_VENTA_FK                                      */
/*==============================================================*/
create index CLIENTE_VENTA_FK on VENTA (
ID_CLIENTE ASC
);

/*==============================================================*/
/* Index: PRODUCTO_VENTA_FK                                     */
/*==============================================================*/
create index PRODUCTO_VENTA_FK on VENTA (
CODIGO_PRODUCTO ASC
);

alter table ASISTENCIA
   add constraint FK_ASISTENC_CL_VISITA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on update restrict
      on delete restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_ESPEC_EMP_ESPECIAL foreign key (ID_ESPECIALIDAD)
      references ESPECIALIDAD (ID_ESPECIALIDAD)
      on update restrict
      on delete restrict;

alter table RUTINA
   add constraint FK_RUTINA_DA_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on update restrict
      on delete restrict;

alter table RUTINA
   add constraint FK_RUTINA_RUTINA_CL_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on update restrict
      on delete restrict;

alter table RUTINA
   add constraint FK_RUTINA_TIENE_PLAN_ALI foreign key (ID_PLAN)
      references PLAN_ALIMENTICIO (ID_PLAN)
      on update restrict
      on delete restrict;

alter table VENTA
   add constraint FK_VENTA_CLIENTE_V_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on update restrict
      on delete restrict;

alter table VENTA
   add constraint FK_VENTA_EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on update restrict
      on delete restrict;

alter table VENTA
   add constraint FK_VENTA_PRODUCTO__PRODUCTO foreign key (CODIGO_PRODUCTO)
      references PRODUCTO (CODIGO_PRODUCTO)
      on update restrict
      on delete restrict;

