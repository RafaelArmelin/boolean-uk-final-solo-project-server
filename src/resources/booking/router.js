const express = require("express");

const { createBooking, getAllBookings } = require("./controller");

const router = express.Router();

router.post("/", createBooking);
router.get("/booking", getAllBookings);

module.exports = router;