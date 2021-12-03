const prisma = require("../../utils/database");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

async function signin(req, res) {
  const { email, password: passwordFromRequest } = req.body;

  try {
    const user = await prisma.user.findUnique({
      where: {
        email,
      },
    });

    if (!user) {
      res.status(401).json({ message: "Not Authorized" });
    }

    const passwordFromDatabase = user.password;

    const match = await bcrypt.compare(
      passwordFromRequest,
      passwordFromDatabase
    );
    console.log(match);

    if (match) {
      const token = jwt.sign(user, process.env.JWT_SECRET, {
        expiresIn: "1d",
      });
      res.status(200).json({ token });
    } else {
      res.status(401).json({ message: "Not Authorized" });
    }
  } catch (error) {
    console.error({ error });

    res.status(500).json(error);
  }
}
const createUser = async (req, res) => {
  const { name, email, password } = req.body;
  console.log("BODY: ", req.body);

  const hashedPassword = await bcrypt.hash(password, 8);

  try {
    const result = await prisma.user.create({
      data: {
        name,
        email,
        password: hashedPassword,
      },
    });
    const token = jwt.sign(result, process.env.JWT_SECRET, {
      expiresIn: "1d",
    });
    console.log("TOKEN", token);
    res.status(201).json({ token });
  } catch (error) {
    console.error({ error: error.message });
    res.status(500).json({ error: error.message });
  }
};
module.exports = { signin, createUser };
