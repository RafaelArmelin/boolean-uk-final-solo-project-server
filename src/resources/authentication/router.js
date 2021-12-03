const express = require("express");

const { signin, createUser } = require("./controller");

const router = express.Router();

router.post("/signin", signin);
router.post("/signup", createUser);

module.exports = router;
