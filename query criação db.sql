CREATE DATABASE CondoSocialDB;
USE CondoSocialDB;

CREATE TABLE CodigoPostal (
    CP CHAR(255) PRIMARY KEY,
    Localidade CHAR(255) NOT NULL
);

CREATE TABLE Condominio (
    IdCondominio INT PRIMARY KEY,
    Morada CHAR(255) NOT NULL,
    Cp CHAR(255) NOT NULL,
    FOREIGN KEY (Cp) REFERENCES CodigoPostal(CP)
);

CREATE TABLE Utilizador (
    IdUtilizador INT PRIMARY KEY,
    Nome CHAR(255) NOT NULL,
    NIF INT NOT NULL,
    NPorta INT NOT NULL,
    IdCondominio INT NOT NULL,
    LoginIdLogin INT NOT NULL,
    FOREIGN KEY (IdCondominio) REFERENCES Condominio(IdCondominio)
);

CREATE TABLE Login (
    IdLogin INT PRIMARY KEY,
    Password CHAR(255) NOT NULL
);

ALTER TABLE Utilizador ADD FOREIGN KEY (LoginIdLogin) REFERENCES Login(IdLogin);

CREATE TABLE Contacto (
    Descricao CHAR(255) NOT NULL,
    Tag CHAR(255),
    IdUtilizador INT NOT NULL,
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador)
);

CREATE TABLE ContactoEmergencia (
    IdEmergencia INT PRIMARY KEY,
    Nome CHAR(50) NOT NULL,
    Telemovel CHAR(13) NOT NULL,
    IdCondominio INT NOT NULL,
    FOREIGN KEY (IdCondominio) REFERENCES Condominio(IdCondominio)
);

CREATE TABLE GestorCondominio (
    IdGestorCondominio INT PRIMARY KEY,
    IdCondominio INT NOT NULL,
    IdUtilizador INT NOT NULL,
    FOREIGN KEY (IdCondominio) REFERENCES Condominio(IdCondominio),
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador)
);

CREATE TABLE Incidencia (
    IdIncidencia INT PRIMARY KEY,
    IdCondominio INT NOT NULL,
    IdGestorCondominio INT NOT NULL,
    Mensagem CHAR(255) NOT NULL,
    Resposta CHAR(255),
    FOREIGN KEY (IdCondominio) REFERENCES Condominio(IdCondominio),
    FOREIGN KEY (IdGestorCondominio) REFERENCES GestorCondominio(IdGestorCondominio)
);

CREATE TABLE Reuniao (
    IdReuniao INT PRIMARY KEY,
    IdCondominio INT NOT NULL,
    IdUtilizador INT NOT NULL,
    IdGestorCondominio INT NOT NULL,
    Data DATE NOT NULL,
    Hora TIME NOT NULL,
    Estado BINARY(1) NOT NULL,
    Ata CHAR(255),
    FOREIGN KEY (IdCondominio) REFERENCES Condominio(IdCondominio),
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador),
    FOREIGN KEY (IdGestorCondominio) REFERENCES GestorCondominio(IdGestorCondominio)
);

CREATE TABLE Post (
    IdPost INT PRIMARY KEY,
    Titulo CHAR(30) NOT NULL,
    Mensagem CHAR(255) NOT NULL,
    Tag CHAR(50),
    TotalParticipantes INT,
    IdUtilizador INT NOT NULL,
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador)
);

CREATE TABLE Participante (
    IdParticipante INT PRIMARY KEY,
    IdPost INT NOT NULL,
    IdUtilizador INT NOT NULL,
    FOREIGN KEY (IdPost) REFERENCES Post(IdPost),
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador)
);

CREATE TABLE Comentario (
    IdComentario INT PRIMARY KEY,
    Mensagem CHAR(255) NOT NULL,
    IdUtilizador INT NOT NULL,
    IdPost INT NOT NULL,
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador),
    FOREIGN KEY (IdPost) REFERENCES Post(IdPost)
);

CREATE TABLE Likes (
    IdLike INT PRIMARY KEY,
    IdUtilizador INT NOT NULL,
    IdPost INT NOT NULL,
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador),
    FOREIGN KEY (IdPost) REFERENCES Post(IdPost)
);

CREATE TABLE Notificacao (
    IdNotificacao INT PRIMARY KEY,
    Mensagem INT NOT NULL,
    IdUtilizador INT NOT NULL,
    IdPost INT,
    IdReuniao INT,
    Vista BINARY(1000),
    IdIncidencia INT,
    FOREIGN KEY (IdUtilizador) REFERENCES Utilizador(IdUtilizador),
    FOREIGN KEY (IdPost) REFERENCES Post(IdPost),
    FOREIGN KEY (IdReuniao) REFERENCES Reuniao(IdReuniao),
    FOREIGN KEY (IdIncidencia) REFERENCES Incidencia(IdIncidencia)
);
