# Projeto de Modelagem e Consultas SQL para E-commerce

Este projeto é uma implementação de um banco de dados para um sistema de e-commerce, com modelagem de dados, inserção de informações e consultas SQL complexas para análise de dados. O sistema inclui funcionalidades como gerenciamento de clientes, produtos, pedidos, pagamentos e entregas.

## Objetivo

O objetivo deste projeto é demonstrar como modelar um banco de dados de e-commerce utilizando SQL, incluindo a criação de tabelas, definição de chaves primárias e estrangeiras, além de realizar consultas SQL para extrair informações complexas do banco.

## Funcionalidades

- Modelagem de banco de dados para e-commerce com diversas tabelas, incluindo `Cliente`, `Produto`, `Fornecedor`, `Pedido`, `Pagamento` e `Entrega`.
- Inserção de dados de teste nas tabelas.
- Consultas SQL avançadas para análise de dados, como:

  - Quantos pedidos foram feitos por cada cliente.
  - Relação de produtos, fornecedores e estoques.
  - Status das entregas e total de pagamentos por pedido.

## Estrutura do Banco de Dados

As seguintes tabelas são criadas no banco de dados:

1. **Cliente**: Contém informações sobre clientes, que podem ser pessoa física (PF) ou jurídica (PJ).
2. **Produto**: Contém os produtos vendidos no e-commerce, incluindo o nome e preço.
3. **Fornecedor**: Contém informações sobre os fornecedores dos produtos.
4. **Estoque**: Contém a quantidade disponível de cada produto no estoque.
5. **Pedido**: Contém informações sobre os pedidos feitos pelos clientes.
6. **Pagamento**: Contém as formas de pagamento utilizadas pelos clientes para efetuar os pedidos.
7. **Entrega**: Contém informações sobre o status e código de rastreio das entregas.
8. **Produto_Fornecedor**: Relação entre produtos e fornecedores.

## Consultas SQL

Algumas das consultas SQL implementadas são:

1. **Quantos pedidos foram feitos por cada cliente?**
2. **Algum vendedor também é fornecedor?**
3. **Relação de produtos, fornecedores e estoques.**
4. **Relação de nomes dos fornecedores e nomes dos produtos.**
5. **Status das entregas e total de pagamentos por pedido.**

## Como Executar

1. Clone este repositório.
2. Execute o script `ecommerce_project.sql` no seu banco de dados MySQL ou PostgreSQL.
3. Realize as consultas SQL para testar as funcionalidades.

## Licença

Este projeto está licenciado sob a Licença MIT - consulte o arquivo [LICENSE](LICENSE) para mais detalhes.

