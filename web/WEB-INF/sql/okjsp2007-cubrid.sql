/* ���̺� */
/* ���ǻ��� : AUTO_INCREMENT(?,1)���� ?�� �� �÷��� �ִ밪�� ã�Ƽ� +1�� �־��ּ���. */
CREATE TABLE "guestbook"(
"seq" integer AUTO_INCREMENT(?,1) PRIMARY KEY,
"name" character varying(42) DEFAULT  NOT NULL,
"email" character varying(82),
"homepage" character varying(82),
"subject" character varying(202) DEFAULT  NOT NULL,
"content" character varying(131072) NOT NULL,
"password" character varying(18) DEFAULT  NOT NULL,
"logtime" timestamp DEFAULT TIMESTAMP'01/02/1970 00:00:00' NOT NULL
);

CREATE TABLE "ok_writer"(
"writer" character varying(102),
"cnt" integer DEFAULT 0 NOT NULL
);

CREATE TABLE "okboard"(
"bbsid" character varying(102),
"seq" integer AUTO_INCREMENT(?,1) PRIMARY KEY,
"ref" integer AUTO_INCREMENT(?,1),
"step" smallint,
"lev" smallint,
"id" character varying(42),
"writer" character varying(102),
"subject" character varying(512),
"password" character varying(102),
"email" character varying(102),
"hit" integer,
"html" character(4),
"homepage" character varying(512),
"sts" smallint DEFAULT 1,
"wtime" timestamp,
"ip" character varying(102),
"memo" integer,
"content" character varying(33554432),
"ccl_id" character(4) DEFAULT '0   '
);

CREATE TABLE "okboard_bookmark"(
"id" character varying(42) DEFAULT  NOT NULL,
"seq" integer DEFAULT 0 NOT NULL,
"credate" timestamp DEFAULT TIMESTAMP'01/02/1970 00:00:00' NOT NULL,
PRIMARY KEY("id","seq")
);

CREATE TABLE "okboard_category"(
"seq" integer AUTO_INCREMENT(?,1) PRIMARY KEY,
"category" character varying(62) DEFAULT  NOT NULL
);

CREATE TABLE "okboard_deleted"(
"bbsid" character varying(102),
"seq" integer AUTO_INCREMENT(?,1) PRIMARY KEY,
"ref" integer DEFAULT 0 NOT NULL,
"step" integer DEFAULT 0 NOT NULL,
"lev" integer DEFAULT 0 NOT NULL,
"id" character varying(42),
"writer" character varying(102),
"subject" character varying(512),
"password" character varying(102),
"email" character varying(102),
"hit" integer,
"html" character(4),
"homepage" character varying(512),
"sts" integer DEFAULT 1,
"wtime" timestamp,
"ip" character varying(102),
"memo" integer,
"content" character varying(33554432),
"ccl_id" character(4) DEFAULT '0   '
);

CREATE TABLE "okboard_file"(
"fseq" integer AUTO_INCREMENT(?,1) PRIMARY KEY,
"seq" integer DEFAULT 0 NOT NULL,
"filename" character varying(402) DEFAULT  NOT NULL,
"maskname" character varying(62) DEFAULT  NOT NULL,
"filesize" integer DEFAULT 0 NOT NULL,
"download" integer DEFAULT 0 NOT NULL,
"sts" integer DEFAULT 1 NOT NULL
);

CREATE TABLE "okboard_info"(
"cseq" integer DEFAULT 0 NOT NULL,
"bbsid" character varying(42) DEFAULT  PRIMARY KEY,
"name" character varying(62) DEFAULT  NOT NULL,
"header" character varying(402)
);

CREATE TABLE "okboard_info_role"(
"bbsid" character varying(42) DEFAULT  NOT NULL,
"role" character varying(42) DEFAULT  NOT NULL,
PRIMARY KEY("bbsid","role")
);

CREATE TABLE "okboard_memo"(
"mseq" integer AUTO_INCREMENT(?,1) PRIMARY KEY,
"seq" integer DEFAULT 0 NOT NULL,
"id" character varying(42),
"sid" integer,
"writer" character varying(102),
"bcomment" character varying(131072),
"wtime" timestamp,
"memopass" character varying(42),
"ip" character varying(34)
);

CREATE TABLE "okboard_tag"(
"tagseq" integer DEFAULT 0 PRIMARY KEY,
"tag" character varying(202) DEFAULT  NOT NULL UNIQUE,
"cnt" integer,
"credate" timestamp
);

CREATE TABLE "okboard_tag_user"(
"tagseq" integer DEFAULT 0 NOT NULL,
"userid" character varying(42) DEFAULT  NOT NULL,
"seq" integer DEFAULT 0 NOT NULL,
"credate" timestamp DEFAULT TIMESTAMP'01/02/1970 00:00:00' NOT NULL,
PRIMARY KEY("tagseq","userid","seq")
);

CREATE TABLE "okmember"(
"id" character varying(42) DEFAULT  NOT NULL UNIQUE,
"password" character varying(42) DEFAULT  NOT NULL,
"name" character varying(42) DEFAULT  NOT NULL,
"email" character varying(102),
"joindate" timestamp DEFAULT TIMESTAMP'01/02/1970 00:00:00' NOT NULL,
"homepage" character varying(102),
"contact" character varying(42),
"profile" character(4),
"mailing" character(4) DEFAULT 'N   ',
"point" integer DEFAULT 0 NOT NULL,
"sid" integer DEFAULT 0 PRIMARY KEY
);

CREATE TABLE "okrole"(
"id" character varying(42) DEFAULT  NOT NULL,
"role" character varying(42) DEFAULT  NOT NULL,
PRIMARY KEY("id","role")
);

CREATE TABLE "point_history"(
"pseq" integer AUTO_INCREMENT(?,1) PRIMARY KEY,
"sid" integer DEFAULT 0 NOT NULL,
"code" character(4) DEFAULT '    ' NOT NULL,
"point" integer DEFAULT 0 NOT NULL,
"tstamp" timestamp DEFAULT TIMESTAMP'01/02/1970 00:00:00' NOT NULL,
"info" character(202)
);

CREATE TABLE "poll_data"(
"qseq" integer,
"seq" numeric(19,0) AUTO_INCREMENT(?,1) PRIMARY KEY,
"answer" character varying(131072),
"logtime" timestamp
);

CREATE TABLE "poll_group"(
"seq" integer UNIQUE,
"gquery" character varying(131072)
);

CREATE TABLE "poll_item"(
"pseq" integer,
"seq" integer,
"item" character varying(512),
"hit" numeric(19,0)
);

CREATE TABLE "poll_query"(
"gseq" integer,
"seq" integer UNIQUE,
"query" character varying(131072) NOT NULL,
"querytype" character(4)
);

CREATE TABLE "poll_user"(
"seq" numeric(19,0) AUTO_INCREMENT(?,1) PRIMARY KEY,
"ip" character varying(34),
"logtime" timestamp,
"session" character varying(512) DEFAULT  NOT NULL
);

CREATE TABLE "pollitem"(
"seq" integer DEFAULT 0 NOT NULL,
"itemseq" integer,
"item" character varying(402),
"hit" integer DEFAULT 0
);

CREATE TABLE "polllist"(
"seq" integer DEFAULT 0 NOT NULL,
"question" character varying(131072) NOT NULL,
"sdate" timestamp,
"edate" timestamp,
"active" character(4) DEFAULT '1   ',
"vtype" integer DEFAULT 1 NOT NULL,
"wtime" timestamp
);

/* Ʈ���� */
CREATE TRIGGER "glo_delete_contents"
PRIORITY 01.00
BEFORE DELETE ON "glo"
EXECUTE 
call destroy_data(obj);

/* �ε��� */
--�ε����� �����? =��=;;