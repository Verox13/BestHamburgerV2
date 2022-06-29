const { Sequelize, Produto } = require("../models");
const bcrypt = require("bcryptjs");
const Op = Sequelize.Op;

const cardapioController = {
    homeHamburgeres: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: "hamburger" } });

        res.render("home-hamburgeres", { produtos });
    },

    homeBebidas: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: 'bebida' } })

        res.render('home-bebidas', { listaDeBebidas: produtos })
    },

    homeAcompanhamentos: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: "acompanhamento" } });

        res.render("home-acompanhamentos", { produtos });
    },
};

module.exports = cardapioController;