USE master;
GO

CREATE DATABASE Endloww;
GO

USE Endloww;
GO

CREATE TABLE [pays] (
  [id_pays] integer PRIMARY KEY,
  [nom_pays] nvarchar(255)
)
GO

CREATE TABLE [auteur] (
  [id_auteur] integer PRIMARY KEY,
  [nom_auteur] nvarchar(255),
  [date_auteur] timestamp,
  [pays_auteur] nvarchar(255)
)
GO

CREATE TABLE [livre] (
  [id_livre] integer PRIMARY KEY,
  [titre_livre] nvarchar(255),
  [annee_livre] timestamp,
  [resume_livre] nvarchar(255)
)
GO

CREATE TABLE [type] (
  [id_type] integer PRIMARY KEY,
  [nom_type] nvarchar(255)
)
GO

CREATE TABLE [exemplaire] (
  [id_exemplaire] integer PRIMARY KEY,
  [reference_exemplaire] nvarchar(255)
)
GO

CREATE TABLE [edition] (
  [id_edition] integer PRIMARY KEY,
  [nom_edition] nvarchar(255)
)
GO

CREATE TABLE [inscrit] (
  [id_inscrit] integer PRIMARY KEY,
  [nom_inscrit] nvarchar(255),
  [prenom_inscrit] nvarchar(255),
  [adresse_rue_inscrit] nvarchar(255),
  [adresse_cp_inscrit] nvarchar(255),
  [telephone_inscrit] nvarchar(255),
  [email_inscrit] nvarchar(255)
)
GO

CREATE TABLE [emprunt] (
  [id_exemplaire] integer,
  [id_inscrit] integer,
  [reference_emprunt] nvarchar(255),
  [date_emprunt] timestamp,
  [delai_emprunt] integer,
  PRIMARY KEY ([id_exemplaire], [id_inscrit])
)
GO

ALTER TABLE [auteur] ADD FOREIGN KEY ([id_auteur]) REFERENCES [pays] ([id_pays])
GO

CREATE TABLE [auteur_livre] (
  [auteur_id_auteur] integer,
  [livre_id_livre] integer,
  PRIMARY KEY ([auteur_id_auteur], [livre_id_livre])
);
GO

ALTER TABLE [auteur_livre] ADD FOREIGN KEY ([auteur_id_auteur]) REFERENCES [auteur] ([id_auteur]);
GO

ALTER TABLE [auteur_livre] ADD FOREIGN KEY ([livre_id_livre]) REFERENCES [livre] ([id_livre]);
GO


CREATE TABLE [livre_type] (
  [livre_id_livre] integer,
  [type_id_type] integer,
  PRIMARY KEY ([livre_id_livre], [type_id_type])
);
GO

ALTER TABLE [livre_type] ADD FOREIGN KEY ([livre_id_livre]) REFERENCES [livre] ([id_livre]);
GO

ALTER TABLE [livre_type] ADD FOREIGN KEY ([type_id_type]) REFERENCES [type] ([id_type]);
GO


ALTER TABLE [exemplaire] ADD FOREIGN KEY ([id_exemplaire]) REFERENCES [livre] ([id_livre])
GO

ALTER TABLE [exemplaire] ADD FOREIGN KEY ([id_exemplaire]) REFERENCES [edition] ([id_edition])
GO

ALTER TABLE [emprunt] ADD FOREIGN KEY ([id_inscrit]) REFERENCES [inscrit] ([id_inscrit])
GO

ALTER TABLE [emprunt] ADD FOREIGN KEY ([id_exemplaire]) REFERENCES [exemplaire] ([id_exemplaire])
GO
