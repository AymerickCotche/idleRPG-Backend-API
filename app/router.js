const {Router} = require('express');
const userController = require('./controllers/userController');
const characterController = require('./controllers/characterController');
const jwtMW = require('./middlewares/jwtMW');
const tempMW = require('./middlewares/tempMW');
const inventoryController = require('./controllers/inventoryController');
const itemController = require('./controllers/itemController');
const loginMW = require('./middlewares/loginMW');
const charAttributeController = require('./controllers/charAttributeController');
const charEquipmentController = require('./controllers/charEquipmentController');
const inventoryCheckMW = require('./middlewares/inventoryCheckMW');
const charEquCheckMW = require('./middlewares/charEquCheckMW');


const router = Router();

// router.post('/user/subscribe', userController.subscribe);
router.post('/user/subscribe', tempMW.subscribeUser, tempMW.createCharacter);
router.post('/user/login', loginMW.login,  characterController.findOne);
router.get('/user/infos', jwtMW, userController.getInfos);

router.get('/character/:id', characterController.findOne);

router.post('/inventory', jwtMW, inventoryController.addItem);
router.delete('/inventory', jwtMW, inventoryController.removeItem);
router.post('/inventory/addItem', jwtMW, inventoryCheckMW.checkExists, inventoryController.save);
router.get('/items', itemController.findAll);

router.patch('/attribute/augment', jwtMW, charAttributeController.updateIncrement);

router.patch('/equipment/unequipItem', jwtMW, inventoryCheckMW.checkExists, charEquipmentController.unequipItem, inventoryController.save);

// router.patch('/equipment/equipItem', jwtMW, charEquipmentController.equipItem, characterController.findOne);

router.patch('/equipment/equipItem', jwtMW, charEquCheckMW.checkExists, charEquCheckMW.getOldItemId, inventoryCheckMW.checkExists, inventoryController.save, charEquipmentController.equipItem, inventoryCheckMW.checkExists, inventoryController.save);

module.exports = router;