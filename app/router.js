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
const entityController = require('./controllers/entityController');
const charJobController = require('./controllers/charJobController');


const router = Router();

// router.post('/user/subscribe', userController.subscribe);
router.post('/user/subscribe', tempMW.subscribeUser, entityController.findAll, tempMW.createCharacter);
router.post('/user/login', loginMW.login, entityController.findAll, characterController.findOne);
router.get('/user/infos', jwtMW, userController.getInfos);

router.post('/user/checklogin', jwtMW, entityController.findAll, characterController.findOne)

router.get('/character/:id', characterController.findOne);

router.post('/inventory', jwtMW, inventoryController.addItem);
router.delete('/inventory', jwtMW, inventoryController.removeItem);
router.post('/inventory/addItem', jwtMW, inventoryCheckMW.checkExists, inventoryController.save);
router.get('/items', itemController.findAll);

router.patch('/attribute/augment', jwtMW, charAttributeController.updateIncrement);

router.patch('/equipment/unequipItem', jwtMW, inventoryCheckMW.checkExists, charEquipmentController.unequipItem, inventoryController.save);

// router.patch('/equipment/equipItem', jwtMW, charEquipmentController.equipItem, characterController.findOne);

router.patch('/equipment/equipItem', jwtMW, charEquCheckMW.checkExists, charEquCheckMW.getOldItemId, inventoryCheckMW.checkExists, inventoryController.save, charEquipmentController.equipItem, inventoryCheckMW.checkExists, inventoryController.save);

router.get('/entities', entityController.findAll);

router.post('/job', inventoryCheckMW.checkExists, inventoryController.save, charJobController.updateExp, charJobController.getJobLevelCharacter);

router.patch('/shop', characterController.updateGold, inventoryCheckMW.checkExists, inventoryController.save)


//route à modifier plus tard :
router

module.exports = router;