const Inventory = require('../models/inventory');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async save (request, response, next) {
        try {
            if (response.locals.nothingToDo === true) {
                next();
            } else if (response.locals.nothingToDo === false) {
                const exists = response.locals.exists;
                const inventory = await new Inventory(request.body).save(exists);
                next();
            } else {
                const exists = response.locals.exists;
                const inventory = await new Inventory(request.body).save(exists);
                const token = jwt.makeToken(request.userId);
                response.setHeader('Authorization', token);
                await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
                if (inventory) {
                    //on a fait un insert
                    return response.status(201).json(inventory);
                }
                //sinon, on a fait un update
                response.status(204).json('Enregistrement mis à jour');
            }
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message);
        }
    },

    async addItem (request, response) {
        try {
            const inventory = await new Inventory(request.body).addItem();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(201).json(inventory);
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async removeItem (request, response) {
        try {
            const instance = await new Inventory(request.body);
            console.log(request.body);
            const inventoryDeleted = instance.removeItem()
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(200).json(inventoryDeleted);
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message);
        }
    }
}