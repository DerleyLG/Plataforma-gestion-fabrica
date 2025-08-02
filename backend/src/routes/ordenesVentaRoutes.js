const express = require('express');
const router = express.Router();
const controller = require('../controllers/ordenesVentaController');


router.get('/articulos-con-stock', controller.getArticulosConStock);

router.get('/',      controller.getAll);
router.get('/:id',   controller.getById);
router.post('/',     controller.create);
router.put('/:id',   controller.update);
router.delete('/:id',controller.delete);
router.get('/articulos-con-stock', controller.getArticulosConStock);

module.exports = router;
