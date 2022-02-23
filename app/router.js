const { Router } = require('express');
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
const sucessController = require('./controllers/sucessController');
const charSuccessController = require('./controllers/charSuccessController');
const { updateExp } = require('./controllers/characterController');

const router = Router();

// router.post('/user/subscribe', userController.subscribe);

router.post(
  '/user/subscribe',
  tempMW.subscribeUser,
  tempMW.createCharacter,
  sucessController.findAll,
  entityController.findAll,
  characterController.findOne
);
router.post(
  '/user/login',
  loginMW.login,
  sucessController.findAll,
  entityController.findAll,
  characterController.findOne
);
router.get('/user/infos', jwtMW, userController.getInfos);

router.post(
  '/user/checklogin',
  jwtMW,
  entityController.findAll,
  characterController.findOne
);

// router.get('/character/:id', characterController.findOne);

// router.delete('/inventory', jwtMW, inventoryController.removeItem);
router.post(
  '/inventory/addItem',
  jwtMW,
  inventoryCheckMW.checkExists,
  inventoryController.save
);
router.get('/items', itemController.findAll);

router.patch(
  '/attribute/augment',
  jwtMW,
  charAttributeController.updateIncrement
);

router.patch(
  '/equipment/unequipItem',
  jwtMW,
  inventoryCheckMW.checkExists,
  charEquipmentController.unequipItem,
  inventoryController.save
);

router.patch(
  '/equipment/equipItem',
  jwtMW,
  charEquCheckMW.checkExists,
  charEquCheckMW.getOldItemId,
  inventoryCheckMW.checkExists,
  inventoryController.save,
  charEquipmentController.equipItem,
  inventoryCheckMW.checkExists,
  inventoryController.save
);

router.post(
  '/job',
  jwtMW,
  inventoryCheckMW.checkExists,
  inventoryController.save,
  characterController.updateNbJob,
  charJobController.updateExp,
  charJobController.getJobLevelCharacter
);

router.patch(
  '/shop',
  jwtMW,
  characterController.updateNbPurchase,
  characterController.updateGold,
  inventoryCheckMW.checkExists,
  inventoryController.save
);

router.patch(
  '/craft',
  jwtMW,
  characterController.updateNbCraft,
  inventoryController.updateComponent,
  inventoryCheckMW.checkExists,
  inventoryController.save
);

router.patch(
  '/fight',
  jwtMW,
  charAttributeController.updateHp,
  characterController.updateNbFought,
  characterController.updateGold,
  characterController.updateExp,
  characterController.getLevelCharacter,
  inventoryCheckMW.checkExists,
  inventoryController.save
);

router.patch(
  '/useCons',
  jwtMW,
  charAttributeController.augmentHp,
  inventoryCheckMW.checkExists,
  inventoryController.save
);

router.patch('/addstatspoints', charAttributeController.updateStatsPoints);
router.post('/char/success/add', jwtMW, charSuccessController.add);

router.patch('/char/rebirth', characterController.doRebirth);

router;

module.exports = router;
