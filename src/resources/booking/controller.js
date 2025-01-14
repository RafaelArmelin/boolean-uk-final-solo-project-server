const prisma = require("../../utils/database");

const createBooking = async (req, res) => {
  const data = req.body;

  // const { name, email } = user;
  const { name, email, description, dateAndTime, pinterestBoard } = data;

  try {
    const result = await prisma.booking.create({
      data: {
        name,
        email,
        description,
        dateAndTime,
        pinterestBoard,
      },
    });

    res.json(result);
  } catch (error) {
    console.error({ error: error.message });
    res.status(500).json({ error: error.message });
  }
};

const getAllBookings = async (req, res) => {
  try {
    const result = await prisma.booking.findMany({
      include: {
        user: true,
      },
    });
    res.json(result);
  } catch (error) {
    console.error({ error: error.message });
    res.status(500).json({ error: error.message });
  }
};

module.exports = { createBooking, getAllBookings };
