<div align="center">
  <img src="./catalogo/static/IF.png" width="35" alt="Logo IFRO" />
  <br>
  <h1>Catálogo E-commerce</h1>
  <p>
    <strong>IFRO - Campus Ariquemes | Programação IV</strong>
  </p>
</div>

<div align="center">
  
[![Django](https://img.shields.io/badge/Django-5.2-darkgreen?logo=django&logoColor=white)](https://www.djangoproject.com/)
[![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python&logoColor=white)](https://www.python.org/)
[![MySQL](https://img.shields.io/badge/MySQL-005C84?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow)]()

</div>

<br>

## 1. Descrição do Projeto

Este projeto é uma aplicação web desenvolvida como atividade da disciplina de **Programação IV**, focada no desenvolvimento de um catálogo de E-commerce utilizando o framework Django. O objetivo principal é gerenciar a exibição de produtos e categorias, integrando a aplicação a um banco de dados relacional robusto (MySQL) e gerenciando variáveis de ambiente com segurança.

O sistema utiliza a arquitetura **MVT (Model-View-Template)**, separando a lógica de consulta ao banco de dados, o roteamento da aplicação e a renderização do front-end dinâmico.

---

## 2. Requisitos Atendidos

O desenvolvimento engloba as seguintes implementações:

* ✅ **Modelagem de Dados:** Criação de Models para `Categoria` e `Producto`, estabelecendo a relação entre eles.
* ✅ **Gestão Administrativa:** Registro dos models no `Django Admin` para o cadastro fácil de produtos, controle de disponibilidade e upload de imagens.
* ✅ **Lógica de Negócios (Managers):** Implementação de um Manager customizado (`ProdutoDisponivelManager`) para filtrar nativamente apenas os produtos ativos no estoque.
* ✅ **Class-Based Views (CBVs):** Uso de `TemplateView` para injetar dados dinâmicos e aleatórios (Destaques) na página inicial.
* ✅ **Segurança e Configuração:** Ocultação de credenciais do banco de dados e chaves sensíveis utilizando a biblioteca `django-environ`.

---

## 3. Arquitetura e Modelagem

O projeto foi estruturado para refletir um catálogo de vendas padrão:

### Entidades e Relacionamentos
* **Categoria:** Agrupa os itens da loja. Possui nome e slug. Relaciona-se 1:N com *Produto*.
* **Produto:** Entidade principal contendo nome, descrição, preço, imagem e um booleano de disponibilidade. Relaciona-se N:1 com *Categoria*.

### Estrutura de Diretórios
* **`ecommerce2026/`**: Configurações globais do projeto (Settings, rotas principais conectadas ao app, arquivos estáticos e de mídia).
* **`catalogo/`**: App principal contendo a regra de negócios.
    * **`models.py`**: Definição das tabelas e relacionamentos do banco.
    * **`views.py`**: Lógica da página inicial para exibir os destaques.
    * **`admin.py`**: Configuração do painel administrativo com filtros e campos editáveis.
    * **`urls.py`**: Roteamento específico do catálogo.

---

## 4. Funcionalidades

### Módulo Público (Vitrine)
* **Página Inicial:** Exibição dinâmica de 3 produtos disponíveis escolhidos aleatoriamente em destaque no catálogo.

### Módulo Administrativo (Restrito)
* **Gestão de Catálogo:** Interface completa (CRUD) para gerenciar categorias e produtos.
* **Controle Rápido:** Capacidade de alterar o preço e a disponibilidade do produto diretamente pela lista de visualização do painel admin.

---

## 5. Instruções de Execução

Este projeto utiliza **MySQL** como banco de dados principal e requer a configuração de **Variáveis de Ambiente** para rodar localmente. Siga os passos com atenção.

### Pré-requisitos
* Python 3.10 ou superior.
* Servidor MySQL (XAMPP, MySQL Workbench, Docker, etc.) rodando na sua máquina.
* Git instalado.

### Passo a Passo

1.  **Clonar o repositório:**
    ```bash
    git clone [https://github.com/ArmandoGT/prog4-ecommerce.git](https://github.com/ArmandoGT/prog4-ecommerce.git)
    cd prog4-ecommerce
    ```

2.  **Criar e ativar o ambiente virtual:**
    ```bash
    # Windows
    python -m venv venv
    .\venv\Scripts\activate

    # Linux/Mac
    python3 -m venv venv
    source venv/bin/activate
    ```

3.  **Instalar dependências (Django, MySQL Client, Environ, etc.):**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Configurar o Banco de Dados MySQL:**
    Abra o seu cliente MySQL (via terminal, phpMyAdmin ou Workbench) e crie um banco de dados vazio para o projeto:
    ```sql
    CREATE DATABASE nome_do_seu_banco CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    ```

5.  **Configurar as Variáveis de Ambiente (.env):**
    Crie um arquivo chamado `.env` na raiz do projeto (no mesmo diretório do arquivo `manage.py`). Adicione as seguintes linhas no seu arquivo `.env`, alterando os valores de exemplo pelos seus dados reais:
    
    ```env
    # Exemplo de arquivo .env
    SECRET_KEY=sua_secret_key_gerada_aqui
    DBNAME=nome_do_seu_banco
    DBUSER=seu_usuario_do_mysql
    DBPASS=sua_senha_do_mysql
    DBHOST=localhost
    DBPORT=3360
    ```
    
    > **Dica - Gerando uma nova SECRET_KEY segura:**
    > Se precisar gerar uma nova chave para o seu `.env`, rode o seguinte comando no terminal (com o ambiente virtual ativo) e copie o resultado:
    > ```bash
    > python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
    > ```

6.  **Gerar as tabelas no Banco de Dados:**
    ```bash
    python manage.py makemigrations
    python manage.py migrate
    ```

7.  **Criar Superusuário (Para acessar o painel Admin):**
    ```bash
    python manage.py createsuperuser
    ```

8.  **Executar o servidor local:**
    ```bash
    python manage.py runserver
    ```

Acesse a aplicação em:
* **Catálogo:** `http://127.0.0.1:8000/`
* **Administração:** `http://127.0.0.1:8000/admin/`

---

## 6. Tecnologias Utilizadas

| Tecnologia | Propósito |
|-----------|----------|
| **Django 5.2** | Framework web backend principal |
| **Python** | Linguagem de programação |
| **MySQL** | Banco de dados relacional oficial do projeto |
| **mysqlclient** | Driver de comunicação entre o Python e o MySQL |
| **django-environ** | Gerenciamento de segurança e variáveis de ambiente (.env) |

---

<div align="center">
  <p>Desenvolvido por <strong>ArmandoGT</strong></p>
  <p><img src="./catalogo/static/IF.png" width="8" alt="Logo IFRO"/> 
  IFRO - Instituto Federal de Rondônia</p>
</div>