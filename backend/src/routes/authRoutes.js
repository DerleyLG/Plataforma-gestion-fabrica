const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const verifyToken = require('../middlewares/verifyToken');

router.post('/login', authController.login);
router.get('/me', verifyToken, authController.me);
module.exports = router;
