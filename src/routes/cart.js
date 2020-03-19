const express = require('express')
const routes = express.Router()

const CartController = require('../app/controllers/CartController')

// login /logout
routes.get('/', CartController.index)
    .post('/:id/add-one', CartController.addOne)
    .post('/:id/remove-one', CartController.removeOne)
    .post('/:id/delete', CartController.delete)




module.exports = routes // exportando a variável de rotas