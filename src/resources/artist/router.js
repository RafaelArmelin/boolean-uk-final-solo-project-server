const express = require("express");

const { createArtist } = require("./controller");

const router = express.Router();

router.post("/artists/create", createArtist);

module.exports = router;
