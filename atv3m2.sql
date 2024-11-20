create database vendas;
use vendas;

CREATE TABLE estado (
    id_estado INT PRIMARY KEY,
    estado VARCHAR(50)
);

CREATE TABLE cidade (
    id_cidade INT PRIMARY KEY,
    cidade VARCHAR(50),
    estado VARCHAR(50)
);


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    valor_produto DECIMAL(10, 2),
    data_compra DATE,
    id_cidade INT,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

INSERT INTO estado (id_estado, estado)
VALUES 
(1, 'São Paulo'),
(2, 'Rio de Janeiro'),
(3, 'Minas Gerais'),
(4, 'Bahia'),
(5, 'Paraná'),
(6, 'Santa Catarina'),
(7, 'Rio Grande do Sul'),
(8, 'Pernambuco'),
(9, 'Amazonas'),
(10, 'Ceará'),
(11, 'Distrito Federal'),
(12, 'Goiás'),
(13, 'Espírito Santo'),
(14, 'Mato Grosso'),
(15, 'Alagoas'),
(16, 'Paraíba'),
(17, 'Pará'),
(18, 'Tocantins'),
(19, 'Maranhão'),
(20, 'Piauí'),
(21, 'Amapá'),
(22, 'Roraima'),
(23, 'Acre'),
(24, 'Rondônia'),
(25, 'Sergipe');

select*from estado;

INSERT INTO cidade (id_cidade, cidade, estado)
VALUES 
(1, 'São Paulo', 'São Paulo'),
(2, 'Rio de Janeiro', 'Rio de Janeiro'),
(3, 'Belo Horizonte', 'Minas Gerais'),
(4, 'Salvador', 'Bahia'),
(5, 'Curitiba', 'Paraná'),
(6, 'Florianópolis', 'Santa Catarina'),
(7, 'Porto Alegre', 'Rio Grande do Sul'),
(8, 'Recife', 'Pernambuco'),
(9, 'Manaus', 'Amazonas'),
(10, 'Fortaleza', 'Ceará'),
(11, 'Brasília', 'Distrito Federal'),
(12, 'Goiânia', 'Goiás'),
(13, 'Vitória', 'Espírito Santo'),
(14, 'Cuiabá', 'Mato Grosso'),
(15, 'Maceió', 'Alagoas'),
(16, 'João Pessoa', 'Paraíba'),
(17, 'Belém', 'Pará'),
(18, 'Palmas', 'Tocantins'),
(19, 'São Luís', 'Maranhão'),
(20, 'Teresina', 'Piauí'),
(21, 'Macapá', 'Amapá'),
(22, 'Boa Vista', 'Roraima'),
(23, 'Rio Branco', 'Acre'),
(24, 'Porto Velho', 'Rondônia'),
(25, 'Aracaju', 'Sergipe');

select*from cidade;



INSERT INTO produtos (id_produto, nome_produto, valor_produto, data_compra, id_cidade)
VALUES 
(1, 'Smartphone Samsung Galaxy S21', 3500.00, '2023-01-01', 1),
(2, 'Notebook Dell Inspiron 15', 4500.00, '2023-02-01', 2),
(3, 'Fone de Ouvido JBL Tune 510BT', 250.00, '2023-03-01', 3),
(4, 'Smart TV LG 55 Polegadas', 3200.00, '2023-04-01', 4),
(5, 'Caixa de Som Bluetooth JBL Charge 5', 800.00, '2023-05-01', 5),
(6, 'Monitor Gamer AOC Hero 24"', 1400.00, '2023-06-01', 6),
(7, 'Câmera Canon EOS Rebel T7', 2800.00, '2023-07-01', 7),
(8, 'Teclado Mecânico Logitech G PRO', 750.00, '2023-08-01', 8),
(9, 'Mouse Gamer Razer DeathAdder V2', 450.00, '2023-09-01', 9),
(10, 'Tablet Apple iPad 9ª Geração', 3800.00, '2023-10-01', 10),
(11, 'Console Sony PlayStation 5', 4700.00, '2023-11-01', 11),
(12, 'Notebook Apple MacBook Air M1', 7200.00, '2023-12-01', 12),
(13, 'Caixa de Som Alexa Echo Dot 5ª Geração', 400.00, '2023-01-15', 13),
(14, 'Smartwatch Xiaomi Mi Band 7', 300.00, '2023-02-15', 14),
(15, 'HD Externo Seagate 1TB', 350.00, '2023-03-15', 15),
(16, 'Roteador TP-Link Archer C6', 200.00, '2023-04-15', 16),
(17, 'Carregador Portátil Xiaomi 10.000mAh', 150.00, '2023-05-15', 17),
(18, 'Headset Gamer HyperX Cloud Stinger', 350.00, '2023-06-15', 18),
(19, 'Impressora Multifuncional Epson EcoTank L3250', 1500.00, '2023-07-15', 19),
(20, 'Controle DualSense PS5', 350.00, '2023-08-15', 20),
(21, 'Som Automotivo Pioneer MVH-S218BT', 600.00, '2023-09-15', 21),
(22, 'Projetor Epson PowerLite E20', 2700.00, '2023-10-15', 22),
(23, 'Smartphone Apple iPhone 14', 7000.00, '2023-11-15', 23),
(24, 'SSD Kingston NV1 500GB', 320.00, '2023-12-15', 24),
(25, 'Microfone Condensador Blue Yeti', 850.00, '2024-01-01', 25);

select*from produtos;



CREATE INDEX idx_nome_produto ON produtos (nome_produto);

SHOW INDEX FROM produtos;



CREATE INDEX idx_cidade ON cidade (cidade);
SHOW INDEX FROM cidade;

CREATE INDEX idx_estado ON estado (estado);
SHOW INDEX FROM estado;


CREATE VIEW vw_produtos_preco AS
SELECT id_produto, nome_produto, valor_produto
FROM produtos
WHERE valor_produto > 100.00;

select*from vw_produtos_preco;

SET SQL_SAFE_UPDATES = 0;

UPDATE produtos
SET valor_produto = valor_produto * 0.90;

SET SQL_SAFE_UPDATES = 1;


