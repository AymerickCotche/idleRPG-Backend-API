const {Router} = require('express');
const userController = require('./controllers/userController');
const characterController = require('./controllers/characterController');
const jwtMW = require('./middlewares/jwtMW');
const tempMW = require('./middlewares/tempMW');
const inventoryController = require('./controllers/inventoryController');
const itemController = require('./controllers/itemController');
const loginMW = require('./middlewares/loginMW');
const charAttributeController = require('./controllers/charAttributeController');
const charEquipmentController = require('./controllers/charEquipment.Controller');


const router = Router();

// router.post('/user/subscribe', userController.subscribe);
router.post('/user/subscribe', tempMW.subscribeUser, tempMW.createCharacter);
router.post('/user/login', loginMW.login,  characterController.findOne);
router.get('/user/infos', jwtMW, userController.getInfos);

router.get('/character/:id', characterController.findOne);

router.post('/inventory', jwtMW, inventoryController.addItem);
router.delete('/inventory', jwtMW, inventoryController.removeItem);
router.get('/items', itemController.findAll);

router.patch('/attribute/augment', jwtMW, charAttributeController.updateIncrement, characterController.findOne);

router.patch('/equipment/unequipItem', jwtMW, charEquipmentController.unequipItem, characterController.findOne);

router.patch('/equipment/equipItem', jwtMW, charEquipmentController.equipItem, characterController.findOne);

module.exports = router;