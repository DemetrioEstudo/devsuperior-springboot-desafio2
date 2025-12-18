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

### ✅ Atividade (`tb_atividade`)
Representa uma atividade do evento.

**Atributos:**
- `id` (Integer) - Identificador único
- `nome` (String) - Nome da atividade
- `descricao` (String/TEXT) - Descrição detalhada
- `preco` (Double) - Preço da atividade

### ✅ Bloco (`tb_bloco`)
Representa um bloco de horário de uma atividade.

**Atributos:**
- `id` (Integer) - Identificador único
- `inicio` (Instant) - Data/hora de início
- `fim` (Instant) - Data/hora de término
- `atividade_id` (FK) - Referência à atividade

### 🚧 Categoria (`tb_categoria`) - *Em desenvolvimento*
Representa uma categoria de atividade.

**Atributos:**
- `id` (Integer) - Identificador único
- `descricao` (String/TEXT) - Descrição da categoria

### 🚧 Participante (`tb_participante`) - *Em desenvolvimento*
Representa um participante do evento.

**Atributos:**
- `id` (Integer) - Identificador único
- `nome` (String) - Nome do participante
- `email` (String) - Email do participante

## 🔗 Relacionamentos JPA

### Atividade ↔ Bloco
**Relacionamento:** `One-to-Many` (bidirecional)

- Uma **Atividade** pode ter vários **Blocos** de horário
- Um **Bloco** pertence a apenas uma **Atividade**

**Mapeamento:**
```java
// Em Atividade
@OneToMany(mappedBy = "atividade")
private List<Bloco> blocos = new ArrayList<>();

// Em Bloco
@ManyToOne
@JoinColumn(name = "atividade_id")
private Atividade atividade;
```

### Relacionamentos Futuros (a implementar)
- **Atividade ↔ Categoria:** Many-to-Many
- **Atividade ↔ Participante:** Many-to-Many
- **Bloco ↔ Participante:** Many-to-Many (através de atividade)

## 📝 Seeding de Dados

Os dados iniciais são carregados automaticamente através do arquivo `import.sql` localizado em `src/main/resources/`.

## 👨‍💻 Autor

Projeto desenvolvido por **flademetrio** como parte do treinamento DevSuperior.

## 📄 Licença

Este é um projeto acadêmico para fins de estudo.

