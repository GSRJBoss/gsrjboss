--
-- JBoss, Home of Professional Open Source
-- Copyright 2013, Red Hat, Inc. and/or its affiliates, and individual
-- contributors by the @authors tag. See the copyright.txt in the
-- distribution for a full listing of individual contributors.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- http://www.apache.org/licenses/LICENSE-2.0
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

--PRODUCCION --
-- Deafault

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO "public"."empresa" (id,nit,carnet_identidad,ciudad,direccion,estado,fecha_modificacion,fecha_registro,foto_perfil,peso_foto,razon_social,representante_legal,telefono,usuario_registro,actividad_economica) VALUES ('1', '123456789', '987654', 'SANTA CRUZ DE LA SIERRA', 'Calle S/N Z/Barrio S/N', 'AC', '2016-01-01 11:54:57.168', '2016-01-01 00:00:00', null, '65974', 'spaps SRL', 'MAURICIO BEJARANO RIVERA', '3420000', 'admin', 'SERVICIOS INFORMATICOS');

-- ----------------------------
-- Records of sucursal
-- ----------------------------
INSERT INTO "public"."sucursal" (id,usuario_registro,actividad,descripcion,direccion,estado,fecha_modificacion,fecha_registro,nit,nombre,numero_sucursal,telefono,id_empresa,credito_fiscal,generar_tickets) VALUES ('1', 'admin','SERVICIOS INFORMATICOS','SUCURSAL PRINCIPAL', 'Calle s/n Barrio S/N', 'AC', null, '2016-01-01 00:00:00', '30000000', 'CASA MATRIZ', '0', '3420000', '1',true,false);
-- ----------------------------
--  Sequence structure for sucursal_id_seq
-- ----------------------------
 ALTER SEQUENCE "public"."sucursal_id_seq" RESTART WITH 2;


-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO "public"."usuario"(id,email ,fecha_registro,foto_perfil,login,nombre,password,peso_foto,state,usuario_registro,fecha_modificacion,id_sucursal) VALUES (1,'admin.admin@gmail.com','2015-01-01 00:00:00',null,'spaps','ADMINISTRADOR','spaps##', 0,'SU','admin',null,1);
INSERT INTO "public"."usuario"(id,email ,fecha_registro,foto_perfil,login,nombre,password,peso_foto,state,usuario_registro,fecha_modificacion,id_sucursal) VALUES (2,'admin.admin@gmail.com','2015-01-01 00:00:00',null,'DEMO','USUARIO DEMO','DEMO', 0,'IN','demo',null,1);
-- ----------------------------
--  Sequence structure for usuario_id_seq
-- ----------------------------
ALTER SEQUENCE "public"."usuario_id_seq" RESTART WITH 2;


-- ----------------------------
-- Records of usuario_empresa
-- ----------------------------
INSERT INTO "public"."usuario_empresa" (id,id_empresa,id_usuario)VALUES ('1', '1', '1');
-- ----------------------------
--  Sequence structure for roles_id_seq
-- ----------------------------
ALTER SEQUENCE "public"."usuario_empresa_id_seq" RESTART WITH 2;


-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles"(id,estado,fecha_modificacion,fecha_registro,nombre,usuario_registro,descripcion) VALUES(1,'SU',null,'2015-01-01 00:00:00','ADMINISTRADOR','admin','Grupo de Usuario Super Us.');
-- ----------------------------
--  Sequence structure for roles_id_seq
-- ----------------------------
ALTER SEQUENCE "public"."roles_id_seq" RESTART WITH 2;


-- ----------------------------
-- Records of usuario_rol
-- ----------------------------
INSERT INTO "public"."usuario_rol"(id,estado,fecha_modificacion ,fecha_registro ,usuario_registro,id_roles, id_usuario) values(1,'AC',null,'2015-01-01 00:00:00','admin',1,1);
-- ----------------------------
--  Sequence structure for usuario_rol_id_seq
-- ----------------------------
ALTER SEQUENCE "public"."usuario_rol_id_seq" RESTART WITH 2;

-- ----------------------------
-- Records of modulo
-- ----------------------------
INSERT INTO "public"."modulo" (id,nombre,estado) VALUES (1,'SEGURIDAD','AC');
INSERT INTO "public"."modulo" (id,nombre,estado) VALUES (2,'PARAMETRIZACION','AC');
INSERT INTO "public"."modulo" (id,nombre,estado) VALUES (3,'VENTA','AC');
INSERT INTO "public"."modulo" (id,nombre,estado) VALUES (4,'PROCESO','AC');
INSERT INTO "public"."modulo" (id,nombre,estado) VALUES (5,'REPORTE','AC');


-- ----------------------------
-- Records of permiso
-- ----------------------------
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('1', 'USUARIO',1,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('2', 'ROL',1,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('3', 'PERMISO',1,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('4', 'EMPRESA',2,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('5', 'DOCUMENTO',2,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('6', 'SUCURSAL',2,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('7', 'DIRECTORIO',2,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('8', 'CERTIFICACION',2,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('9', 'CLIENTE',3,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('10', 'FACTURACION',3,'AC');
INSERT INTO "public"."permiso"(id,nombre,id_modulo,estado) VALUES ('11', 'ORDEN SERVICIO',4,'AC');

-- ----------------------------
-- Records of privilegio
-- ----------------------------
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(1,'AC',null,'2015-01-01 00:00:00','admin', 1,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(2,'AC',null,'2015-01-01 00:00:00','admin', 2,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(3,'AC',null,'2015-01-01 00:00:00','admin', 3,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(4,'AC',null,'2015-01-01 00:00:00','admin', 4,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(5,'AC',null,'2015-01-01 00:00:00','admin', 5,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(6,'AC',null,'2015-01-01 00:00:00','admin', 6,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(7,'AC',null,'2015-01-01 00:00:00','admin', 7,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(8,'AC',null,'2015-01-01 00:00:00','admin', 8,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(9,'AC',null,'2015-01-01 00:00:00','admin', 9,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(10,'AC',null,'2015-01-01 00:00:00','admin', 10,1);
INSERT INTO "public"."privilegio"(id,estado,fechamodificacion,fecharegistro, usuarioregistro, id_permiso,id_roles)VALUES(11,'AC',null,'2015-01-01 00:00:00','admin', 11,1);
-- ----------------------------
--  Sequence structure for privilegio_id_seq
-- ----------------------------
ALTER SEQUENCE "public"."privilegio_id_seq" RESTART WITH 12;


-- ----------------------------
-- Records of gestion
-- ----------------------------
INSERT INTO "public"."gestion" (id,estado,estado_cierre,fecha_modificacion,fecha_registro,gestion,iniciada,usuario_registro,id_empresa) VALUES ('1','AC','AC',null,'2016-01-01 00:00:00','2016','FALSE','admin','1');

-- ----------------------------
-- Records of dosificacion
-- ----------------------------
INSERT INTO "public"."dosificacion" (id,activo,cantidad_dosificacion,estado,fecha_limite_emision,fecha_modificacion,fecha_registro,leyenda_inferior1,leyenda_inferior2,llave_control,norma_aplicada,numero_autorizacion,numero_inicial,numero_secuencia,numero_tramite,tipo_dosificacion,usuario_registro,id_sucursal) VALUES ('1','t', '30', 'AC', '2016-03-02', null, '2016-01-01 00:00:00', 'ESTA FACTURA CONTRIBUYE AL DESARROLLO DEL PAIS.  EL USO ILICITO SERA SANCIONADO POR LEY.', 'Ley N° 453: Tienes derecho a un trato equitativo sin discriminación en la oferta de servicios.', '7eW]X_pm#+%#(jDU+6PTk_gI69DSt)L*E2%fxy6t(TB6ISznWY8\@QszEPNNwB3Q', 'NSF-07', '383403600000000', '1', '22', '760000000000', 'TIEMPO', 'admin', '1');
-- ----------------------------
--  Sequence structure for dosificacion_id_seq
-- ----------------------------
ALTER SEQUENCE "public"."dosificacion_id_seq" RESTART WITH 2;

-- ----------------------------
-- Records of parametro_empresa
-- ----------------------------
INSERT INTO "public"."parametro_empresa" (id,centro_costo,codificacion_etandar,estado,fecha_modificacion,fecha_registro,nivel_maximo,usuario_registro,id_empresa) VALUES ('1', TRUE, '9.99.999.9999.99999', 'AC', null, '2016-01-01 12:23:42.037', '5', 'admin', '1');


-- ----------------------------
-- ----------------------------
--  Records of tamano_hoja
-- ----------------------------
INSERT INTO "public"."tamano_hoja" VALUES ('1', 'admin', 'IN', '2015-01-01 00:00:00', 'LETTER');
INSERT INTO "public"."tamano_hoja" VALUES ('2', 'admin', 'IN', '2015-01-01 00:00:00', 'MINI');
INSERT INTO "public"."tamano_hoja" VALUES ('3', 'admin', 'AC', '2015-01-01 00:00:00', 'LEGAL');

-- ----------------------------
--  Records of tipo_comprobante


-- ----------------------------
--  Records of moneda
-- ----------------------------
INSERT INTO "public"."moneda" (id,nombre,simbolo_referencial) VALUES ('1', 'BOLIVIANOS', 'Bs.');
INSERT INTO "public"."moneda" (id,nombre,simbolo_referencial) VALUES ('2', 'DOLAR', 'Usd.');
INSERT INTO "public"."moneda" (id,nombre,simbolo_referencial) VALUES ('3', 'REAL', 'R$.');
INSERT INTO "public"."moneda" (id,nombre,simbolo_referencial) VALUES ('4', 'EURO', 'E.');
-- ----------------------------
--  Sequence structure for tipo_cuenta_id_seq
-- ----------------------------



-- ----------------------------
--  Records of moneda_empresa
-- ----------------------------
INSERT INTO "public"."moneda_empresa" (id,estado,fecha_registro,simbolo,tipo,id_empresa,id_moneda) VALUES ('1', 'AC', '2016-01-01 12:23:42.037', 'Bs.', 'NACIONAL', '1', '1');
INSERT INTO "public"."moneda_empresa" (id,estado,fecha_registro,simbolo,tipo,id_empresa,id_moneda) VALUES ('2', 'AC', '2016-01-01 12:23:42.037', 'Usd.', 'EXTRANJERA', '1', '2');

-- ----------------------------
--  Records of configuracion_compra
-- ----------------------------

-- ----------------------------
-- Records of tipo_cambio
-- ----------------------------
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('1', 'AC', '2016-01-02 00:00:00', '02/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('2', 'AC', '2016-01-03 00:00:00', '03/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('3', 'AC', '2016-01-04 00:00:00', '04/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('4', 'AC', '2016-01-05 00:00:00', '05/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('5', 'AC', '2016-01-06 00:00:00', '06/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('6', 'AC', '2016-01-07 00:00:00', '07/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('7', 'AC', '2016-01-08 00:00:00', '08/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('8', 'AC', '2016-01-09 00:00:00', '09/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('9', 'AC', '2016-01-10 00:00:00', '10/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('10', 'AC', '2016-01-11 00:00:00', '11/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('11', 'AC', '2016-01-12 00:00:00', '12/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('12', 'AC', '2016-01-13 00:00:00', '13/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('13', 'AC', '2016-01-14 00:00:00', '14/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('14', 'AC', '2016-01-15 00:00:00', '15/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('15', 'AC', '2016-01-16 00:00:00', '16/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('16', 'AC', '2016-01-17 00:00:00', '17/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('17', 'AC', '2016-01-18 00:00:00', '18/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('18', 'AC', '2016-01-19 00:00:00', '19/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('19', 'AC', '2016-01-20 00:00:00', '20/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('20', 'AC', '2016-01-21 00:00:00', '21/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('21', 'AC', '2016-01-22 00:00:00', '22/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('22', 'AC', '2016-01-23 00:00:00', '23/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('23', 'AC', '2016-01-24 00:00:00', '24/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('24', 'AC', '2016-01-25 00:00:00', '25/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('25', 'AC', '2016-01-26 00:00:00', '26/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('26', 'AC', '2016-01-27 00:00:00', '27/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('27', 'AC', '2016-01-28 00:00:00', '28/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('28', 'AC', '2016-01-29 00:00:00', '29/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('29', 'AC', '2016-01-30 00:00:00', '30/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('30', 'AC', '2016-01-31 00:00:00', '31/01/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('31', 'AC', '2016-02-01 00:00:00', '01/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('32', 'AC', '2016-02-02 00:00:00', '02/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('33', 'AC', '2016-02-03 00:00:00', '03/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('34', 'AC', '2016-02-04 00:00:00', '04/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('35', 'AC', '2016-02-05 00:00:00', '05/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('36', 'AC', '2016-02-06 00:00:00', '06/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('37', 'AC', '2016-02-07 00:00:00', '07/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('38', 'AC', '2016-02-08 00:00:00', '08/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('39', 'AC', '2016-02-09 00:00:00', '09/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('40', 'AC', '2016-02-10 00:00:00', '10/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('41', 'AC', '2016-02-11 00:00:00', '11/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('42', 'AC', '2016-02-12 00:00:00', '12/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('43', 'AC', '2016-02-13 00:00:00', '13/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa)  VALUES ('44', 'AC', '2016-02-14 00:00:00', '14/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('45', 'AC', '2016-02-15 00:00:00', '15/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('46', 'AC', '2016-02-16 00:00:00', '16/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('47', 'AC', '2016-02-17 00:00:00', '17/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('48', 'AC', '2016-02-18 00:00:00', '18/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('49', 'AC', '2016-02-19 00:00:00', '19/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('50', 'AC', '2016-02-20 00:00:00', '20/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('51', 'AC', '2016-02-21 00:00:00', '21/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('52', 'AC', '2016-02-22 00:00:00', '22/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('53', 'AC', '2016-02-23 00:00:00', '23/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('54', 'AC', '2016-02-24 00:00:00', '24/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('55', 'AC', '2016-02-25 00:00:00', '25/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('56', 'AC', '2016-02-26 00:00:00', '26/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('57', 'AC', '2016-02-27 00:00:00', '27/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('58', 'AC', '2016-02-28 00:00:00', '28/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('59', 'AC', '2016-02-29 00:00:00', '29/02/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('60', 'AC', '2016-03-01 00:00:00', '01/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('61', 'AC', '2016-03-02 00:00:00', '02/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('62', 'AC', '2016-03-03 00:00:00', '03/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('63', 'AC', '2016-03-04 00:00:00', '04/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('64', 'AC', '2016-03-05 00:00:00', '05/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('65', 'AC', '2016-03-06 00:00:00', '06/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('66', 'AC', '2016-03-07 00:00:00', '07/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('67', 'AC', '2016-03-08 00:00:00', '08/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('68', 'AC', '2016-03-09 00:00:00', '09/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('69', 'AC', '2016-03-10 00:00:00', '10/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('70', 'AC', '2016-03-11 00:00:00', '11/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('71', 'AC', '2016-03-12 00:00:00', '12/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('72', 'AC', '2016-03-13 00:00:00', '13/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('73', 'AC', '2016-03-14 00:00:00', '14/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('74', 'AC', '2016-03-15 00:00:00', '15/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('75', 'AC', '2016-03-16 00:00:00', '16/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('76', 'AC', '2016-03-17 00:00:00', '17/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('77', 'AC', '2016-03-18 00:00:00', '18/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('78', 'AC', '2016-03-19 00:00:00', '19/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('79', 'AC', '2016-03-20 00:00:00', '20/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('80', 'AC', '2016-03-21 00:00:00', '21/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('81', 'AC', '2016-03-22 00:00:00', '22/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('82', 'AC', '2016-03-23 00:00:00', '23/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('83', 'AC', '2016-03-24 00:00:00', '24/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('84', 'AC', '2016-03-25 00:00:00', '25/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('85', 'AC', '2016-03-26 00:00:00', '26/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('86', 'AC', '2016-03-27 00:00:00', '27/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('87', 'AC', '2016-03-28 00:00:00', '28/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('88', 'AC', '2016-03-29 00:00:00', '29/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('89', 'AC', '2016-03-30 00:00:00', '30/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('90', 'AC', '2016-03-31 00:00:00', '31/03/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('91', 'AC', '2016-04-01 00:00:00', '01/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('92', 'AC', '2016-04-02 00:00:00', '02/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('93', 'AC', '2016-04-03 00:00:00', '03/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('94', 'AC', '2016-04-04 00:00:00', '04/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('95', 'AC', '2016-04-05 00:00:00', '05/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('96', 'AC', '2016-04-06 00:00:00', '06/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('97', 'AC', '2016-04-07 00:00:00', '07/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('98', 'AC', '2016-04-08 00:00:00', '08/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('99', 'AC', '2016-04-09 00:00:00', '09/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('100', 'AC', '2016-04-10 00:00:00', '10/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('101', 'AC', '2016-04-11 00:00:00', '11/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('102', 'AC', '2016-04-12 00:00:00', '12/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('103', 'AC', '2016-04-13 00:00:00', '13/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('104', 'AC', '2016-04-14 00:00:00', '14/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('105', 'AC', '2016-04-15 00:00:00', '15/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('106', 'AC', '2016-04-16 00:00:00', '16/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('107', 'AC', '2016-04-17 00:00:00', '17/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('108', 'AC', '2016-04-18 00:00:00', '18/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('109', 'AC', '2016-04-19 00:00:00', '19/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('110', 'AC', '2016-04-20 00:00:00', '20/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('111', 'AC', '2016-04-21 00:00:00', '21/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('112', 'AC', '2016-04-22 00:00:00', '22/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('113', 'AC', '2016-04-23 00:00:00', '23/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('114', 'AC', '2016-04-24 00:00:00', '24/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('115', 'AC', '2016-04-25 00:00:00', '25/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('116', 'AC', '2016-04-26 00:00:00', '26/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('117', 'AC', '2016-04-27 00:00:00', '27/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('118', 'AC', '2016-04-28 00:00:00', '28/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('119', 'AC', '2016-04-29 00:00:00', '29/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('120', 'AC', '2016-04-30 00:00:00', '30/04/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('121', 'AC', '2016-05-01 00:00:00', '01/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('122', 'AC', '2016-05-02 00:00:00', '02/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('123', 'AC', '2016-05-03 00:00:00', '03/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('124', 'AC', '2016-05-04 00:00:00', '04/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('125', 'AC', '2016-05-05 00:00:00', '05/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('126', 'AC', '2016-05-06 00:00:00', '06/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('127', 'AC', '2016-05-07 00:00:00', '07/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('128', 'AC', '2016-05-08 00:00:00', '08/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('129', 'AC', '2016-05-09 00:00:00', '09/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('130', 'AC', '2016-05-10 00:00:00', '10/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('131', 'AC', '2016-05-11 00:00:00', '11/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('132', 'AC', '2016-05-12 00:00:00', '12/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('133', 'AC', '2016-05-13 00:00:00', '13/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('134', 'AC', '2016-05-14 00:00:00', '14/05/2016', '6.92', '1');
INSERT INTO "public"."tipo_cambio" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('135', 'AC', '2016-05-15 00:00:00', '15/05/2016', '6.92', '1');

ALTER SEQUENCE "public"."tipo_cambio_id_seq" RESTART WITH 136;

-- ----------------------------
-- Records of tipo_cambio_ufv
-- ----------------------------
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('1', 'AC', '2016-01-02 00:00:00', '02/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('2', 'AC', '2016-01-03 00:00:00', '03/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('3', 'AC', '2016-01-04 00:00:00', '04/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('4', 'AC', '2016-01-05 00:00:00', '05/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('5', 'AC', '2016-01-06 00:00:00', '06/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('6', 'AC', '2016-01-07 00:00:00', '07/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('7', 'AC', '2016-01-08 00:00:00', '08/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('8', 'AC', '2016-01-09 00:00:00', '09/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('9', 'AC', '2016-01-10 00:00:00', '10/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('10', 'AC', '2016-01-11 00:00:00', '11/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('11', 'AC', '2016-01-12 00:00:00', '12/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('12', 'AC', '2016-01-13 00:00:00', '13/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('13', 'AC', '2016-01-14 00:00:00', '14/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('14', 'AC', '2016-01-15 00:00:00', '15/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('15', 'AC', '2016-01-16 00:00:00', '16/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('16', 'AC', '2016-01-17 00:00:00', '17/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('17', 'AC', '2016-01-18 00:00:00', '18/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('18', 'AC', '2016-01-19 00:00:00', '19/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('19', 'AC', '2016-01-20 00:00:00', '20/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('20', 'AC', '2016-01-21 00:00:00', '21/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('21', 'AC', '2016-01-22 00:00:00', '22/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('22', 'AC', '2016-01-23 00:00:00', '23/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('23', 'AC', '2016-01-24 00:00:00', '24/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('24', 'AC', '2016-01-25 00:00:00', '25/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('25', 'AC', '2016-01-26 00:00:00', '26/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('26', 'AC', '2016-01-27 00:00:00', '27/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('27', 'AC', '2016-01-28 00:00:00', '28/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('28', 'AC', '2016-01-29 00:00:00', '29/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('29', 'AC', '2016-01-30 00:00:00', '30/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('30', 'AC', '2016-01-31 00:00:00', '31/01/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('31', 'AC', '2016-02-01 00:00:00', '01/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('32', 'AC', '2016-02-02 00:00:00', '02/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('33', 'AC', '2016-02-03 00:00:00', '03/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('34', 'AC', '2016-02-04 00:00:00', '04/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('35', 'AC', '2016-02-05 00:00:00', '05/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('36', 'AC', '2016-02-06 00:00:00', '06/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('37', 'AC', '2016-02-07 00:00:00', '07/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('38', 'AC', '2016-02-08 00:00:00', '08/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('39', 'AC', '2016-02-09 00:00:00', '09/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('40', 'AC', '2016-02-10 00:00:00', '10/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('41', 'AC', '2016-02-11 00:00:00', '11/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('42', 'AC', '2016-02-12 00:00:00', '12/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('43', 'AC', '2016-02-13 00:00:00', '13/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('44', 'AC', '2016-02-14 00:00:00', '14/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('45', 'AC', '2016-02-15 00:00:00', '15/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('46', 'AC', '2016-02-16 00:00:00', '16/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('47', 'AC', '2016-02-17 00:00:00', '17/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('48', 'AC', '2016-02-18 00:00:00', '18/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('49', 'AC', '2016-02-19 00:00:00', '19/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('50', 'AC', '2016-02-20 00:00:00', '20/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('51', 'AC', '2016-02-21 00:00:00', '21/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('52', 'AC', '2016-02-22 00:00:00', '22/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('53', 'AC', '2016-02-23 00:00:00', '23/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('54', 'AC', '2016-02-24 00:00:00', '24/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('55', 'AC', '2016-02-25 00:00:00', '25/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('56', 'AC', '2016-02-26 00:00:00', '26/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('57', 'AC', '2016-02-27 00:00:00', '27/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('58', 'AC', '2016-02-28 00:00:00', '28/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('59', 'AC', '2016-02-29 00:00:00', '29/02/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('60', 'AC', '2016-03-01 00:00:00', '01/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('61', 'AC', '2016-03-02 00:00:00', '02/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('62', 'AC', '2016-03-03 00:00:00', '03/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('63', 'AC', '2016-03-04 00:00:00', '04/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('64', 'AC', '2016-03-05 00:00:00', '05/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('65', 'AC', '2016-03-06 00:00:00', '06/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('66', 'AC', '2016-03-07 00:00:00', '07/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('67', 'AC', '2016-03-08 00:00:00', '08/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('68', 'AC', '2016-03-09 00:00:00', '09/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('69', 'AC', '2016-03-10 00:00:00', '10/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('70', 'AC', '2016-03-11 00:00:00', '11/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('71', 'AC', '2016-03-12 00:00:00', '12/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('72', 'AC', '2016-03-13 00:00:00', '13/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('73', 'AC', '2016-03-14 00:00:00', '14/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('74', 'AC', '2016-03-15 00:00:00', '15/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('75', 'AC', '2016-03-16 00:00:00', '16/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('76', 'AC', '2016-03-17 00:00:00', '17/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('77', 'AC', '2016-03-18 00:00:00', '18/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('78', 'AC', '2016-03-19 00:00:00', '19/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('79', 'AC', '2016-03-20 00:00:00', '20/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('80', 'AC', '2016-03-21 00:00:00', '21/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('81', 'AC', '2016-03-22 00:00:00', '22/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('82', 'AC', '2016-03-23 00:00:00', '23/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('83', 'AC', '2016-03-24 00:00:00', '24/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('84', 'AC', '2016-03-25 00:00:00', '25/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('85', 'AC', '2016-03-26 00:00:00', '26/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('86', 'AC', '2016-03-27 00:00:00', '27/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('87', 'AC', '2016-03-28 00:00:00', '28/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('88', 'AC', '2016-03-29 00:00:00', '29/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('89', 'AC', '2016-03-30 00:00:00', '30/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('90', 'AC', '2016-03-31 00:00:00', '31/03/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('91', 'AC', '2016-04-01 00:00:00', '01/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('92', 'AC', '2016-04-02 00:00:00', '02/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('93', 'AC', '2016-04-03 00:00:00', '03/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('94', 'AC', '2016-04-04 00:00:00', '04/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('95', 'AC', '2016-04-05 00:00:00', '05/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('96', 'AC', '2016-04-06 00:00:00', '06/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('97', 'AC', '2016-04-07 00:00:00', '07/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('98', 'AC', '2016-04-08 00:00:00', '08/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('99', 'AC', '2016-04-09 00:00:00', '09/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('100', 'AC', '2016-04-10 00:00:00', '10/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('101', 'AC', '2016-04-11 00:00:00', '11/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('102', 'AC', '2016-04-12 00:00:00', '12/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('103', 'AC', '2016-04-13 00:00:00', '13/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('104', 'AC', '2016-04-14 00:00:00', '14/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('105', 'AC', '2016-04-15 00:00:00', '15/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('106', 'AC', '2016-04-16 00:00:00', '16/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('107', 'AC', '2016-04-17 00:00:00', '17/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('108', 'AC', '2016-04-18 00:00:00', '18/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('109', 'AC', '2016-04-19 00:00:00', '19/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('110', 'AC', '2016-04-20 00:00:00', '20/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('111', 'AC', '2016-04-21 00:00:00', '21/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('112', 'AC', '2016-04-22 00:00:00', '22/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('113', 'AC', '2016-04-23 00:00:00', '23/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('114', 'AC', '2016-04-24 00:00:00', '24/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('115', 'AC', '2016-04-25 00:00:00', '25/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('116', 'AC', '2016-04-26 00:00:00', '26/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('117', 'AC', '2016-04-27 00:00:00', '27/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('118', 'AC', '2016-04-28 00:00:00', '28/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('119', 'AC', '2016-04-29 00:00:00', '29/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('120', 'AC', '2016-04-30 00:00:00', '30/04/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('121', 'AC', '2016-05-01 00:00:00', '01/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('122', 'AC', '2016-05-02 00:00:00', '02/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('123', 'AC', '2016-05-03 00:00:00', '03/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('124', 'AC', '2016-05-04 00:00:00', '04/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('125', 'AC', '2016-05-05 00:00:00', '05/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('126', 'AC', '2016-05-06 00:00:00', '06/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('127', 'AC', '2016-05-07 00:00:00', '07/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('128', 'AC', '2016-05-08 00:00:00', '08/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('129', 'AC', '2016-05-09 00:00:00', '09/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('130', 'AC', '2016-05-10 00:00:00', '10/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('131', 'AC', '2016-05-11 00:00:00', '11/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('132', 'AC', '2016-05-12 00:00:00', '12/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('133', 'AC', '2016-05-13 00:00:00', '13/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('134', 'AC', '2016-05-14 00:00:00', '14/05/2016', '2.3', '1');
INSERT INTO "public"."tipo_cambio_ufv" (id,estado,fecha,fecha_literal,unidad,id_empresa) VALUES ('135', 'AC', '2016-05-15 00:00:00', '15/05/2016', '2.3', '1');


ALTER SEQUENCE "public"."tipo_cambio_ufv_id_seq" RESTART WITH 136;
