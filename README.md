# Desafio 2 - Modelo de Domínio e ORM

## 📚 Sobre o Projeto

Este é um projeto acadêmico desenvolvido como parte do **Desafio 2** do treinamento **Java Spring** da **DevSuperior**. O objetivo é praticar a modelagem de domínio e o mapeamento objeto-relacional (ORM) utilizando JPA/Hibernate.

## 🚀 Tecnologias Utilizadas

- **Java 17**
- **Spring Boot 3.5.8**
- **Spring Data JPA** - Persistência de dados
- **Spring Web** - Aplicação web
- **H2 Database** - Banco de dados em memória para testes
- **Maven** - Gerenciamento de dependências
- **Hibernate** - Implementação JPA

## 📦 Como Instalar e Executar

### Pré-requisitos
- Java 17 ou superior
- Maven 3.6+ (ou use o wrapper incluído: `mvnw`)

### Passos para execução

1. **Clone o repositório** (ou navegue até o diretório do projeto)
```powershell
cd D:\Estudo\Java\formacaodev\desafio2
```

2. **Compile o projeto**
```powershell
.\mvnw clean install
```

3. **Execute a aplicação**
```powershell
.\mvnw spring-boot:run
```

4. **Acesse o console H2** (opcional)
   - URL: `http://localhost:8080/h2-console`
   - JDBC URL: `jdbc:h2:mem:testdb`
   - User: `sa`
   - Password: (deixe em branco)

## 🗂️ Entidades (Entities)

O projeto implementa as seguintes entidades de domínio:

- **Categoria** (`tb_categoria`) - Categoria de atividades (Curso, Oficina, etc.)
- **Atividade** (`tb_atividade`) - Atividades do evento
- **Bloco** (`tb_bloco`) - Blocos de horário das atividades
- **Participante** (`tb_participante`) - Participantes do evento

## 🔗 Relacionamentos JPA

O projeto implementa os seguintes relacionamentos entre as entidades:

- **Atividade ↔ Categoria**: `Many-to-One` / `One-to-Many` (bidirecional)
  - Várias atividades pertencem a uma categoria
  
- **Atividade ↔ Bloco**: `One-to-Many` / `Many-to-One` (bidirecional)
  - Uma atividade possui vários blocos de horário
  
- **Atividade ↔ Participante**: `Many-to-Many` (bidirecional)
  - Várias atividades podem ter vários participantes
  - Tabela associativa: `participante_atividade`


## 📝 Seeding de Dados

Os dados iniciais são carregados automaticamente através do arquivo `import.sql` localizado em `src/main/resources/`.

### Dados implementados:

**Categorias:**
- c1: Curso
- c2: Oficina

**Atividades:**
- a1: Curso de HTML (Categoria: Curso, Preço: R$ 80,00)
  - Descrição: "Aprenda HTML5 de forma prática"
  - Bloco b1: 25/09/2017 08:00 - 11:00
- a2: Oficina de Github (Categoria: Oficina, Preço: R$ 50,00)
  - Descrição: "Controle versões de seus projetos"
  - Bloco b2: 25/09/2017 14:00 - 18:00
  - Bloco b3: 26/09/2017 08:00 - 11:00

**Participantes:**
- p1: José Silva (jose@gmail.com)
- p2: Tiago Faria (tiago@gmail.com)
- p3: Maria do Rosário (maria@gmail.com)
- p4: Teresa Silva (teresa@gmail.com)

**Relacionamentos Participante-Atividade:**
- José Silva (p1) → Curso de HTML (a1)
- Tiago Faria (p2) → Curso de HTML (a1)
- Maria do Rosário (p3) → Curso de HTML (a1) e Oficina de Github (a2)
- Teresa Silva (p4) → Oficina de Github (a2)

## 👨‍💻 Autor

Projeto desenvolvido por **flademetrio** como parte do treinamento DevSuperior.

## 📄 Licença

Este é um projeto acadêmico para fins de estudo.

