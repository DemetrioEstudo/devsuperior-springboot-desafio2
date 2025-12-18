# Desafio 2 - Modelo de Domínio e ORM

## 📊 Status de Implementação

- ✅ **Categoria** - Entidade completamente implementada
- ✅ **Atividade** - Entidade completamente implementada
- ✅ **Bloco** - Entidade completamente implementada
- ✅ **Relacionamento Atividade ↔ Categoria** - Implementado (Many-to-One/One-to-Many)
- ✅ **Relacionamento Atividade ↔ Bloco** - Implementado (One-to-Many/Many-to-One)
- ✅ **Seeding de dados** - Categorias, Atividades, Blocos e Participantes implementados
- 🚧 **Participante** - Entidade básica criada, aguardando mapeamento JPA
- 🚧 **Relacionamento Atividade ↔ Participante** - Aguardando implementação (Many-to-Many)

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
- `categoria_id` (FK) - Referência à categoria

**Relacionamentos:**
- Vários Blocos (1:N)
- Uma Categoria (N:1)
- Vários Participantes (N:N)

### ✅ Bloco (`tb_bloco`)
Representa um bloco de horário de uma atividade.

**Atributos:**
- `id` (Integer) - Identificador único
- `inicio` (Instant) - Data/hora de início
- `fim` (Instant) - Data/hora de término
- `atividade_id` (FK) - Referência à atividade

**Relacionamentos:**
- Uma Atividade (N:1)

### ✅ Categoria (`tb_categoria`)
Representa uma categoria de atividade (ex: Curso, Oficina).

**Atributos:**
- `id` (Integer) - Identificador único
- `descricao` (String/TEXT) - Descrição da categoria

**Relacionamentos:**
- Várias Atividades (1:N)

### ✅ Participante (`tb_participante`)
Representa um participante do evento.

**Atributos:**
- `id` (Integer) - Identificador único
- `nome` (String) - Nome do participante
- `email` (String) - Email do participante

**Relacionamentos:**
- Várias Atividades (N:N)

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

### Atividade ↔ Categoria
**Relacionamento:** `Many-to-One` (bidirecional)

- Várias **Atividades** pertencem a uma **Categoria**
- Uma **Categoria** pode ter várias **Atividades**

**Mapeamento:**
```java
// Em Atividade (lado proprietário)
@ManyToOne
@JoinColumn(name = "categoria_id")
private Categoria categoria;

// Em Categoria (lado inverso)
@OneToMany(mappedBy = "categoria")
private List<Atividade> atividades = new ArrayList<>();
```

**Tabela no banco:**
- A coluna `categoria_id` é criada em `tb_atividade` (chave estrangeira)
- Cada atividade referencia uma categoria obrigatória

### Atividade ↔ Participante
**Relacionamento:** `Many-to-Many` (bidirecional) - *Em implementação*

- Várias **Atividades** podem ter vários **Participantes**
- Vários **Participantes** podem estar em várias **Atividades**

**Mapeamento previsto:**
```java
// Em Atividade
@ManyToMany
@JoinTable(name = "tb_atividade_participante",
    joinColumns = @JoinColumn(name = "atividade_id"),
    inverseJoinColumns = @JoinColumn(name = "participante_id"))
private List<Participante> participantes = new ArrayList<>();

// Em Participante
@ManyToMany(mappedBy = "participantes")
private List<Atividade> atividades = new ArrayList<>();
```

**Tabela no banco:**
- Será criada uma tabela associativa `tb_atividade_participante`
- Contém as chaves estrangeiras: `atividade_id` e `participante_id`

### Relacionamentos Futuros
- Melhorias e otimizações nos relacionamentos existentes

## 📝 Seeding de Dados

Os dados iniciais são carregados automaticamente através do arquivo `import.sql` localizado em `src/main/resources/`.

### Dados implementados:

**Categorias:**
- c1: Curso
- c2: Oficina

**Atividades:**
- a1: Curso de HTML (Categoria: Curso, Preço: R$ 80,00)
  - Bloco b1: 25/09/2017 08:00 - 11:00
- a2: Oficina de Github (Categoria: Oficina, Preço: R$ 50,00)
  - Bloco b2: 25/09/2017 14:00 - 18:00
  - Bloco b3: 26/09/2017 08:00 - 11:00

**Participantes:**
- p1: José Silva (jose@gmail.com)
- p2: Tiago Faria (tiago@gmail.com)
- p3: Maria do Rosário (maria@gmail.com)
- p4: Teresa Silva (teresa@gmail.com)

**Relacionamentos Atividade-Participante:**
- Curso de HTML: José Silva, Tiago Faria
- Oficina de Github: Tiago Faria, Maria do Rosário, Teresa Silva

## 👨‍💻 Autor

Projeto desenvolvido por **flademetrio** como parte do treinamento DevSuperior.

## 📄 Licença

Este é um projeto acadêmico para fins de estudo.

