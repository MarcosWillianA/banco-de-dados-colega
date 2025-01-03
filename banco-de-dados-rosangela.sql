-- Modelo SQL para representar o diagrama refinado

-- Tabela Conta
CREATE TABLE Conta (
    IDConta INT PRIMARY KEY AUTO_INCREMENT,
    TipoConta ENUM('PJ', 'PF') NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    CPF_CNPJ VARCHAR(20) UNIQUE NOT NULL,
    Email VARCHAR(255),
    Telefone VARCHAR(20)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    IDPagamento INT PRIMARY KEY AUTO_INCREMENT,
    IDConta INT NOT NULL,
    FormaPagamento VARCHAR(50) NOT NULL,
    DetalhesPagamento TEXT,
    FOREIGN KEY (IDConta) REFERENCES Conta(IDConta) ON DELETE CASCADE
);

-- Tabela Entrega
CREATE TABLE Entrega (
    IDEntrega INT PRIMARY KEY AUTO_INCREMENT,
    IDConta INT NOT NULL,
    StatusEntrega ENUM('Aguardando Envio', 'Enviado', 'Entregue') NOT NULL,
    CodigoRastreamento VARCHAR(50),
    FOREIGN KEY (IDConta) REFERENCES Conta(IDConta) ON DELETE CASCADE
);

-- Tabela Pedido
CREATE TABLE Pedido (
    IDPedido INT PRIMARY KEY AUTO_INCREMENT,
    IDConta INT NOT NULL,
    IDPagamento INT NOT NULL,
    IDEntrega INT NOT NULL,
    DataPedido DATETIME NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDConta) REFERENCES Conta(IDConta) ON DELETE CASCADE,
    FOREIGN KEY (IDPagamento) REFERENCES Pagamento(IDPagamento) ON DELETE SET NULL,
    FOREIGN KEY (IDEntrega) REFERENCES Entrega(IDEntrega) ON DELETE SET NULL )

    -- Modelo SQL para representar o diagrama refinado

-- Tabela Conta
CREATE TABLE Conta (
    IDConta INT PRIMARY KEY AUTO_INCREMENT,
    TipoConta ENUM('PJ', 'PF') NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    CPF_CNPJ VARCHAR(20) UNIQUE NOT NULL,
    Email VARCHAR(255),
    Telefone VARCHAR(20)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    IDPagamento INT PRIMARY KEY AUTO_INCREMENT,
    IDConta INT NOT NULL,
    FormaPagamento VARCHAR(50) NOT NULL,
    DetalhesPagamento TEXT,
    FOREIGN KEY (IDConta) REFERENCES Conta(IDConta) ON DELETE CASCADE
);

-- Tabela Entrega
CREATE TABLE Entrega (
    IDEntrega INT PRIMARY KEY AUTO_INCREMENT,
    IDConta INT NOT NULL,
    StatusEntrega ENUM('Aguardando Envio', 'Enviado', 'Entregue') NOT NULL,
    CodigoRastreamento VARCHAR(50),
    FOREIGN KEY (IDConta) REFERENCES Conta(IDConta) ON DELETE CASCADE
);

-- Tabela Pedido
CREATE TABLE Pedido (
    IDPedido INT PRIMARY KEY AUTO_INCREMENT,
    IDConta INT NOT NULL,
    IDPagamento INT NOT NULL,
    IDEntrega INT NOT NULL,
    DataPedido DATETIME NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDConta) REFERENCES Conta(IDConta) ON DELETE CASCADE,
    FOREIGN KEY (IDPagamento) REFERENCES Pagamento(IDPagamento) ON DELETE SET NULL,
    FOREIGN KEY (IDEntrega) REFERENCES Entrega(IDEntrega) ON DELETE SET NULL )