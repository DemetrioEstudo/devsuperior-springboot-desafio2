package com.br.flademetrio.desafio2.entities;


import jakarta.persistence.*;

//@Entity
//@Table(name = "tb_categoria")
public class Categoria {

    //@Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;
    //@Column(columnDefinition = "TEXT")
    public String descricao;

}
