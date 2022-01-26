const {Router} = require('express');
const userController = require('./controllers/userController');
const characterController = require('./controllers/characterController');
const jwtMW = require('./middlewares/jwtMW');
const tempMW = require('./middlewares/tempMW');
const inventoryController = require('./controllers/inventoryController');
const itemController = require('./controllers/itemController');


const router = Router();

// router.post('/user/subscribe', userController.subscribe);
router.post('/user/subscribe', tempMW.subscribeUser, tempMW.createCharacter);
router.post('/user/login', userController.login);
router.get('/user/infos', jwtMW, userController.getInfos);

router.get('/character/:id', jwtMW, characterController.findOne);

router.post('/inventory', jwtMW, inventoryController.addItem);
router.delete('/inventory', jwtMW, inventoryController.removeItem);

router.get('/items', itemController.findAll);

module.exports = router;